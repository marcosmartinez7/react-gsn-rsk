pragma solidity >=0.4.21 <0.7.0;

import "@openeth/gsn/contracts/RelayRecipient.sol";
import "@openeth/gsn/contracts/RelayHub.sol"; // import needed for artifact generation


contract SimpleStorage is RelayRecipient {
  uint storedData;

  function set(uint x) public {
    storedData = x;
  }

  function get() public view returns (uint) {
    return storedData;
  }

    /**
     * initialize RelayHub for our contract.
     * This call is required so the contract will recognize relayed calls from direct calls.
     * Without knowing the relay, getSender() cannot return the address of the real sender.
     * In production contracts, this call is done from the constructor, or restricted to ownerOnly.
     */
    function init_hub(IRelayHub hub_addr) public {
        setRelayHub(hub_addr);
    }

    function acceptRelayedCall(
        address relay,
        address from,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata approvalData,
        uint256 maxPossibleCharge
    )
    external
    view
    returns (uint256, bytes memory) {
        return (0, '');
        //accept everything.
    }

    //nothing to be done post-call. still, we must implement this method.
    function preRelayedCall(bytes calldata context) external returns (bytes32){
		return '';
    }

    function postRelayedCall(bytes calldata context, bool success, uint actualCharge, bytes32 preRetVal) external {
    }
}
