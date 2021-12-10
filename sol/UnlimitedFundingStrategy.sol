pragma solidity ^0.4.24;

import "./FundingLimitStrategy.sol";
contract UnlimitedFundingStrategy is FundingLimitStrategy {

    function isFullInvestmentWithinLimit(
        uint256 _investment,
        uint256 _fullInvestmentReceived)
        public view returns (bool) {
            return true;
        }
}