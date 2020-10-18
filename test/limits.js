// Simulate a full contribution

const MultiSigWallet = artifacts.require("MultiSigWallet");
const MiniMeTokenFactory = artifacts.require("MiniMeTokenFactory");
const REAL = artifacts.require("REALMock");
const RealCrowdsaleClass = artifacts.require("REALCrowdsaleMock");
const ContributionWallet = artifacts.require("ContributionWallet");
const DevTokensHolder = artifacts.require("DevTokensHolderMock");
const REALPlaceHolderClass = artifacts.require("REALPlaceHolderMock");

const assertFail = require("./helpers/assertFail");

contract("REALCrowdsale", function(accounts) {
    const addressReal = accounts[0];
    const addressCommunity = accounts[1];
    const addressReserve = accounts[2];
    const addressBounties = accounts[9];
    const addressDevs = accounts[3];
    const addressREALHolder = accounts[4];
    const addressTest1 = accounts[5];
    const addressTest2 = accounts[6];
    const addressTest3 = accounts[7];
    const addressTest4 = accounts[8];
    const addressTestDummy = accounts[10];
    const addressTestDummy2 = accounts[11];

    let multisigReal;
    let multisigCommunity;
    let multisigReserve;
    let multisigBounties;
    let multisigDevs;
    let miniMeTokenFactory;
    let real;
    let realCrowdsale;
    let contributionWallet;
    let devTokensHolder;
    let realPlaceHolder;

    var cur = 0;

    const startBlock = 1000000;
    const endBlock = 1040000;

    it("Deploys all contracts", async function() {
        multisigReal = await MultiSigWallet.new([addressReal], 1);
        multisigCommunity = await MultiSigWallet.new([addressCommunity], 1);
        multisigReserve = await MultiSigWallet.new([addressReserve], 1);
        multisigBounties = await MultiSigWallet.new([addressBounties], 1);
        multisigDevs = await MultiSigWallet.new([addressDevs], 1);

        miniMeTokenFactory = await MiniMeTokenFactory.new();

        real = await REAL.new(miniMeTokenFactory.address);

        realCrowdsale = await RealCrowdsaleClass.new();

        contributionWallet = await ContributionWallet.new(
            multisigReal.address,
            endBlock,
            realCrowdsale.address);
        devTokensHolder = await DevTokensHolder.new(
            multisigDevs.address,
            realCrowdsale.address,
            real.address);

        realPlaceHolder = await REALPlaceHolderClass.new(
            multisigCommunity.address,
            real.address,
            realCrowdsale.address);

        await real.changeController(realCrowdsale.address);

        await realCrowdsale.initialize(
            real.address,
            realPlaceHolder.address,

            startBlock,
            endBlock,

            contributionWallet.address,

            multisigReserve.address,
            devTokensHolder.address,
            multisigBounties.address);
    });

    it("Checks initial parameters", async function() {
        assert.equal(await real.controller(), realCrowdsale.address);
    });

    it("Checks that nobody can buy before the sale starts", async function() {
        await assertFail(async function() {
            await real.send(web3.toWei(1));
        });
    });

    it("Adds 2 guaranteed addresses ", async function() {
        await realCrowdsale.setGuaranteedAddress(addressTest1, web3.toWei(101));
        await realCrowdsale.setGuaranteedAddress(addressTest2, web3.toWei(110));
        await realCrowdsale.setGuaranteedAddress(addressTestDummy, web3.toWei(30000));
        await realCrowdsale.setGuaranteedAddress(addressTestDummy2, web3.toWei(19839));

        const permited1 = await realCrowdsale.guaranteedBuyersLimit(addressTest1);
        const permited2 = await realCrowdsale.guaranteedBuyersLimit(addressTest2);
        const permitedDummy = await realCrowdsale.guaranteedBuyersLimit(addressTestDummy);
        const permitedDummy2 = await realCrowdsale.guaranteedBuyersLimit(addressTestDummy2);

        assert.equal(web3.fromWei(permited1).toNumber(), 101);
        assert.equal(web3.fromWei(permited2).toNumber(), 110);
        assert.equal(web3.fromWei(permitedDummy).toNumber(), 30000);
        assert.equal(web3.fromWei(permitedDummy2).toNumber(), 19839);
    });

    it("Pauses and resumes the contribution ", async function() {
        await realCrowdsale.setMockedBlockNumber(1000000);
        await real.setMockedBlockNumber(1000000);
        await realCrowdsale.pauseContribution();
        await assertFail(async function() {
            await real.sendTransaction({value: web3.toWei(5), gas: 300000, gasPrice: "20000000000"});
        });
        await realCrowdsale.resumeContribution();
    });

    it("Checks limits", async function() {
      var currentTotalCollected = 0;

      await realCrowdsale.setMockedBlockNumber(1000000);
      await real.setMockedBlockNumber(1000000);

      await real.sendTransaction({value: web3.toWei(1), gas: 300000, from: addressTest1});
      var balanceTest1 = await real.balanceOf(addressTest1);
      assert.equal(web3.fromWei(balanceTest1).toNumber(), 220*1.25);

      await real.sendTransaction({value: web3.toWei(24949), gas: 300000, from: addressTestDummy}); //24950
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 24950);

      await realCrowdsale.setMockedBlockNumber(1001000);
      await real.setMockedBlockNumber(1001000);

      await real.sendTransaction({value: web3.toWei(100), gas: 300000, from: addressTest1}); //25050
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 25050);
      balanceTest1 = await real.balanceOf(addressTest1);
      assert.equal(web3.fromWei(balanceTest1).toNumber(), (1*220*1.25)+(50*220*1.25)+(50*220*1.20));

      await real.sendTransaction({value: web3.toWei(250), gas: 300000, from: addressTestDummy}); //25300
      await realCrowdsale.setMockedBlockNumber(1002000);
      await real.setMockedBlockNumber(1002000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 25300);

      await real.sendTransaction({value: web3.toWei(10), gas: 300000, from: addressTest2}); //25310
      var balanceTest2 = await real.balanceOf(addressTest2);
      assert.equal(web3.fromWei(balanceTest2).toNumber(), 10*220*1.20);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 25310);


      await real.sendTransaction({value: web3.toWei(4801), gas: 300000, from: addressTestDummy}); //49950 19839
      await real.sendTransaction({value: web3.toWei(19839), gas: 300000, from: addressTestDummy2});
      await realCrowdsale.setMockedBlockNumber(1003000);
      await real.setMockedBlockNumber(1003000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 49950);

      await real.sendTransaction({value: web3.toWei(100), gas: 300000, from: addressTest2}); //50050
      balanceTest2 = await real.balanceOf(addressTest2);
      assert.equal(web3.fromWei(balanceTest2).toNumber(), 10*220*1.20+(50*220*1.20)+(50*220*1.15));
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 50050);

      await real.sendTransaction({value: web3.toWei(250), gas: 300000, from: addressTestDummy}); //50300
      await realCrowdsale.setMockedBlockNumber(1004000);
      await real.setMockedBlockNumber(1004000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 50300);

      await real.sendTransaction({value: web3.toWei(10), gas: 300000, from: addressTest3}); //50310
      var balanceTest3 = await real.balanceOf(addressTest3);
      assert.equal(web3.fromWei(balanceTest3).toNumber(), 10*220*1.15);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 50310);

      await real.sendTransaction({value: web3.toWei(49640), gas: 300000, from: addressTestDummy});//99950
      await realCrowdsale.setMockedBlockNumber(1005000);
      await real.setMockedBlockNumber(1005000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 99950);

      await real.sendTransaction({value: web3.toWei(100), gas: 300000, from: addressTest3}); //100050
      balanceTest3 = await real.balanceOf(addressTest3);
      assert.equal(web3.fromWei(balanceTest3).toNumber(), 10*220*1.15+(50*220*1.15)+(50*220*1.05));
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 100050);

      await real.sendTransaction({value: web3.toWei(250), gas: 300000, from: addressTestDummy}); //100300
      await realCrowdsale.setMockedBlockNumber(1006000);
      await real.setMockedBlockNumber(1006000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 100300);

      await real.sendTransaction({value: web3.toWei(10), gas: 300000, from: addressTest4}); //100310
      var balanceTest4 = await real.balanceOf(addressTest4);
      assert.equal(web3.fromWei(balanceTest4).toNumber(), 10*220*1.05);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 100310);

      await real.sendTransaction({value: web3.toWei(49640), gas: 300000, from: addressTestDummy}); //149950
      await realCrowdsale.setMockedBlockNumber(1007000);
      await real.setMockedBlockNumber(1007000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 149950);

      await real.sendTransaction({value: web3.toWei(100), gas: 300000, from: addressTest4}); //150050
      balanceTest4 = await real.balanceOf(addressTest4);
      assert.equal(web3.fromWei(balanceTest4).toNumber(), 10*220*1.05+(50*220*1.05)+(50*220));
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 150050);

      await real.sendTransaction({value: web3.toWei(250), gas: 300000, from: addressTestDummy}); //150300
      await realCrowdsale.setMockedBlockNumber(1008000);
      await real.setMockedBlockNumber(1008000);
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 150300);

      await real.sendTransaction({value: web3.toWei(100), gas: 300000, from: addressTest4}); //150400
      balanceTest4 = await real.balanceOf(addressTest4);
      assert.equal(web3.fromWei(balanceTest4).toNumber(), 10*220*1.05+(50*220*1.05)+(150*220));
      currentTotalCollected = await realCrowdsale.totalCollected();
      // console.log(web3.fromWei(currentTotalCollected).toNumber());
      assert.equal(web3.fromWei(currentTotalCollected).toNumber(), 150400);
    });
});
