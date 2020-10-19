Token name: Real Coin

Token ticker: ADG

Token decimals: 18

Multisig wallet address: 0xXXXXX

*****************************

Crowdsale rate: 1000000000

Crowdsale start time: 2018-02-23T20:00 (GMT - 5)

Crowdsale end time: 2018-02-24T00:46:00 (GMT - 5)

Compiler Version: 0.4.19

Is optimization enabled?: true

*****************************

Crowdsale contract name: MintedTokenCappedCrowdsaleExt

Crowdsale contract address for Tier 1: 0xXXX

*****************************

****Crowdsale contract ABI:**** 

[{"constant":true,"inputs":[],"name":"ownerTestValue","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"invest","outputs":[],"payable":true,"type":"function"},{"constant":true,"inputs":[{"name":"addr","type":"address"},{"name":"tokenAmount","type":"uint256"}],"name":"isBreakingInvestorCap","outputs":[{"name":"limitBroken","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addrs","type":"address[]"}],"name":"updateJoinedCrowdsalesMultiple","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isPricingSane","outputs":[{"name":"sane","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"endsAt","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isUpdatable","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"addr","type":"address"}],"name":"isAddressWhitelisted","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"minimumFundingGoal","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getState","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"setFinalizeAgent","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"whitelistedParticipantsLength","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"investedAmountOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"finalizeAgent","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"addr","type":"address"}],"name":"isTierJoined","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"areReservedTokensDistributed","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"tokens","type":"uint256"}],"name":"setMaximumSellableTokens","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"maximumSellableTokens","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"weiRaised","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isCrowdsale","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"finalize","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_pricingStrategy","type":"address"}],"name":"setPricingStrategy","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"tokensSold","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"halt","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"MAX_INVESTMENTS_BEFORE_MULTISIG_CHANGE","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newOneTokenInWei","type":"uint256"}],"name":"updateRate","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"time","type":"uint256"}],"name":"setEndsAt","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"pricingStrategy","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isMinimumGoalReached","outputs":[{"name":"reached","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"joinedCrowdsalesLenMax","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"},{"name":"status","type":"bool"},{"name":"minCap","type":"uint256"},{"name":"maxCap","type":"uint256"}],"name":"setEarlyParticipantWhitelist","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"multisigWallet","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"tokenAmountOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"weiAmount","type":"uint256"},{"name":"tokenAmount","type":"uint256"},{"name":"weiRaisedTotal","type":"uint256"},{"name":"tokensSoldTotal","type":"uint256"}],"name":"isBreakingCap","outputs":[{"name":"limitBroken","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"buy","outputs":[],"payable":true,"type":"function"},{"constant":true,"inputs":[],"name":"isFinalizerSane","outputs":[{"name":"sane","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"startsAt","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"addr","type":"address"}],"name":"getTierPosition","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addrs","type":"address[]"},{"name":"statuses","type":"bool[]"},{"name":"minCaps","type":"uint256[]"},{"name":"maxCaps","type":"uint256[]"}],"name":"setEarlyParticipantWhitelistMultiple","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"finalized","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"halted","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"canDistributeReservedTokens","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"joinedCrowdsales","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"time","type":"uint256"}],"name":"setStartsAt","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"},{"name":"tokensBought","type":"uint256"}],"name":"updateEarlyParticipantWhitelist","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getLastTier","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"earlyParticipantWhitelist","outputs":[{"name":"status","type":"bool"},{"name":"minCap","type":"uint256"},{"name":"maxCap","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"unhalt","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"reservedTokensDistributionBatch","type":"uint256"}],"name":"distributeReservedTokens","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isCrowdsaleFull","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"investorCount","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"whitelistedParticipants","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"joinedCrowdsalesLen","outputs":[{"name":"","type":"uint8"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isWhiteListed","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"setMultisig","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"token","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"inputs":[{"name":"_name","type":"string"},{"name":"_token","type":"address"},{"name":"_pricingStrategy","type":"address"},{"name":"_multisigWallet","type":"address"},{"name":"_start","type":"uint256"},{"name":"_end","type":"uint256"},{"name":"_minimumFundingGoal","type":"uint256"},{"name":"_maximumSellableTokens","type":"uint256"},{"name":"_isUpdatable","type":"bool"},{"name":"_isWhiteListed","type":"bool"}],"payable":false,"type":"constructor"},{"payable":true,"type":"fallback"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newMaximumSellableTokens","type":"uint256"}],"name":"MaximumSellableTokensChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"investor","type":"address"},{"indexed":false,"name":"weiAmount","type":"uint256"},{"indexed":false,"name":"tokenAmount","type":"uint256"},{"indexed":false,"name":"customerId","type":"uint128"}],"name":"Invested","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"addr","type":"address"},{"indexed":false,"name":"status","type":"bool"},{"indexed":false,"name":"minCap","type":"uint256"},{"indexed":false,"name":"maxCap","type":"uint256"}],"name":"Whitelisted","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"addr","type":"address"},{"indexed":false,"name":"status","type":"bool"},{"indexed":false,"name":"minCap","type":"uint256"},{"indexed":false,"name":"maxCap","type":"uint256"}],"name":"WhitelistItemChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newStartsAt","type":"uint256"}],"name":"StartsAtChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newEndsAt","type":"uint256"}],"name":"EndsAtChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"previousOwner","type":"address"},{"indexed":true,"name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"}]

****Crowdsale contract ABI encoded constructor arguments for Tier 1:**** 

0000000000000000000000000000000000000000000000000000000000000140000000000000000000000000e583a3ab93be76ddcf8937ed621288d14ed9495f000000000000000000000000350de920beeb78c84b3b2e72edd5d10c5dd15c7100000000000000000000000019d00c34910d1c91efcd73a0bb8c93a7a98c9104000000000000000000000000000000000000000000000000000000005a8629c8000000000000000000000000000000000000000000000000000000005a8bb618000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000052b7d2dcc80cd2e40000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065469657220310000000000000000000000000000000000000000000000000000
