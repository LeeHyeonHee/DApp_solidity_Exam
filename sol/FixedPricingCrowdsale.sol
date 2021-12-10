pragma solidity ^0.4.24;
import "./SimpleCrowdsale.sol"

contract FixedPricingCrowdsale is SimpleCrowdsale {
    constructor(uint256 _startTime, uint256 _endTime, uint256 _weiTokenPrice, uint256 _etherInvestmentObjective, uint256 _fundingCap)
        SimpleCrowdsale(_startTime, _endTime, _weiTokenPrice, _etherInvestmentObjective)
        payable public {

        }

        function calculateNumberOfTokens (uint256 investment)
            internal returns (uint256) {
                return investment / weiTokenPrice;
            }
}