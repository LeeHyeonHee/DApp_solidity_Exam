pragma solidity ^0.4.24;

import "./FundingLimitStrategy.sol";

contract CappedFundingStrategy is FundingLimitStrategy {
    uint256 fundingCap;

    constructor(uint256 _fundingCap) public {
        require(_fundingCap > 0);
        fundingCap = _fundingCap;
    }

    function isFullInvestmentWithinLimit(
        uint256 _investment,
        uint256 _fullInvestmentReceived)
        public view returns (bool) {
            bool check =_fullInvestmentReceived + _investment < fundingCap;
            return check;
        }
}