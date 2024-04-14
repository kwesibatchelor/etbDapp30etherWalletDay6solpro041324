//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherWallet {

    address public owner; // authorized sender 

    // initialize variable by calling a special function that is called only once, when the smart contract is deployed
    constructor(address _owner) public { // accepts and argument that sets the owner variable 
        owner = _owner; 
    }

    // need a way to send ether to this smart contract by
    // declaring a function that can receive the ethers
    function deposit() payable public { // payable - in order to make function able to receive ethers 
    } 

    // function to send ether from wallet to another ethereum address
    function send (address payable to, uint amount) public { // takes two arguments 1) recipient adddress and 2) how much ether we will send to this address
        // before we send, check that the sender is authorized sender (which is the value contained in the owner variable)
        if(msg.sender == owner) {
            // executed if the sender of the transaction is the authorized sender
            to.transfer(amount); // use the to variable to send the transfer and the transfer function availahle tomthe address keyword. take one argument 1) the amount to be sent 
            return; // stops the execution
        }
        revert("sender is not allowed"); // optional argument for error catching
    }

    // create a function to give us the ether balance of the smart contract 
    function balanceOf() view public returns(uint) { // read only function that can be called outside the smart contract 
        return address(this).balance; // "this" - represents the smart contract 
    }
}