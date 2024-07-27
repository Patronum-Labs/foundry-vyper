# pragma version ~=0.4.0
"""
@title Greeting Contract
@license MIT
@author PatronumLabs YamenMerhi
@notice This contract implements contracts around Greeting.
"""

greeting: public(String[100])

@deploy
def __init__(_greeting: String[100]):
    """
    @notice Initializes the contract with a greeting
    @dev Sets the initial greeting when the contract is deployed
    @param _greeting The initial greeting message
    """
    self.greeting = _greeting

@external
def setGreeting(_newGreeting: String[100]):
    """
    @notice Changes the current greeting
    @dev Updates the greeting to a new message
    @param _newGreeting The new greeting message
    """
    self.greeting = _newGreeting