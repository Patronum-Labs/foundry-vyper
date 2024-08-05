// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {VyperDeployer} from "../lib/utils/VyperDeployer.sol";
import {IGreeting} from "../interfaces/IGreeting.sol";

contract GreetingTest is Test {
    VyperDeployer public vyperDeployer;
    IGreeting public greetingContract;
    string public constant INITIAL_GREETING = "yoSnakes";

    function setUp() public {
        vyperDeployer = new VyperDeployer();
        greetingContract = IGreeting(
            vyperDeployer.deployContract(
                "src/",
                "Greeting",
                abi.encode(INITIAL_GREETING)
            )
        );
    }

    function test_getGreeting() public view {
        string memory greeting = greetingContract.greeting();
        assertEq(greeting, INITIAL_GREETING);
    }

    function test_setGreeting() public {
        string memory newGreeting = "HelloWorld!";
        greetingContract.setGreeting(newGreeting);
        string memory greeting = greetingContract.greeting();
        assertEq(greeting, newGreeting);
    }
}
