pragma solidity ^0.5.0;

import '../REALCrowdsale.sol';

// @dev REALCrowdsaleMock mocks current block number

contract REALCrowdsaleMock is REALCrowdsale {

    function REALCrowdsaleMock() REALCrowdsale() {}

    function getBlockNumber() internal constant returns (uint) {
        return mock_blockNumber;
    }

    function setMockedBlockNumber(uint _b) public {
        mock_blockNumber = _b;
    }

    uint mock_blockNumber = 1;

}
