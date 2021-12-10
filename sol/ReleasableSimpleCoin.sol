pragma solidity ^0.4.18;
import "./SimpleCoin.sol";//#A
contract ReleasableSimpleCoin is SimpleCoin { //#B
    bool public released = false;//#C
    bool public paused = false;//#B

    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    function pause() onlyOwner whenNotPaused public {//#C
        paused = true;
    }

    function unpause() onlyOwner whenPaused public {//#C
        paused = false;
    }

    modifier isReleased() { //#D
        if(!released) {
            revert();
        }

        _;
    }

    constructor(uint256 _initialSupply) 
        SimpleCoin(_initialSupply) public {} //#E

    function release() onlyOwner public { //#F
        released = true;
    }

    function transfer(address _to, uint256 _amount) 
        isReleased whenNotPaused public {//#D
        super.transfer(_to, _amount); 
    }

    function transferFrom(address _from, address _to, uint256 _amount) 
        isReleased whenNotPaused public returns (bool) {//#D
        super.transferFrom(_from, _to, _amount); 
    }  
}
/*
#A ReleasableSimpleCoin is now inherited from SimpleCoin
#B directive to reference the file where SimpleCoin is defined
#C flag determining whether the token is released
#D modifier encapsulating check on released flag
#E The ReleasableSimpleCoin constructor calls the base constructor to initialize the initialSupply state variable in SImpleCoin
#F new function to release the coin; it can be called only by the contract owner
#G this is overriding the original implementation; thanks to the can transfer modifier, this  can be called successfully only if the token has been released
#H the original SimpleCoin implementation is called through super
*/