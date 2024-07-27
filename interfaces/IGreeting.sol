// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IGreeting
 * @dev Interface used to interact with the Greeting contract deployed (tests, scripts, etc ..)
 */
interface IGreeting {
    /**
     * @notice Changes the current greeting
     * @dev Updates the greeting to a new message
     * @param _newGreeting The new greeting message
     */
    function setGreeting(string calldata _newGreeting) external;

    /**
     * @notice Retrieves the current greeting
     * @dev Returns the current greeting message
     * @return The current greeting message
     */
    function greeting() external view returns (string memory);
}
