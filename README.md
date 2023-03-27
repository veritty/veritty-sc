Raffle contract documentation
===================

The following functions are present:
-------------

###### openRaffle
Only admin sets the raffle opened.
###### stopRaffle
Only admin sets the raffle stopped. People can't enter the raffle when it's stopped.
###### setEntranceFee
Parameters: newEntranceFee - amount of ether in wei https://eth-converter.com/.
Sets the new price to enter the raffle
###### setSubscriptionId
Parameters: newId - this subscription is used by Chainlink. There must always be money on this subscription
###### setKeyHash
Parameters: bytes32 newKeyHash
Used to update Chainlink parameter. In usual conditions don't use it
###### setPriceFeed
Parameters: new priceFeedAddress
Updates price oracle. In usual conditions don't use it
##### setReffererShare
Parameters: new reffererShare in tens (20% == 200)
Use to update refferer's share
###### finalGame
Asserts that raffle is closed, and returns top 20 addresses. Then admin manually repays the prize.
###### pay
Only admin can execute. Function uses Chainlink price feed oracle usdt/eth.
Parameters: target - address to send money, amountInUsdt - amount of usdt to send.Such that to send $5 you put amountInUsdt = 5.
Picks up the current exchange rate between the ether and the dollar and sends equivalent amount of ether to target address.
##### sendEther
Parameters: target - address to send, amount - amount of Wei to send (10^18 Wei == 1 ETH)
Use it to send ether to arbitrary address
###### enterRaffle
The main function to interact with user. Receives the ether amount not less than entranceFee. Requests Chainlink VRF Coordinator, sets refferer if not set yet, repays to refferer (if exists). 
Emits event Requested(address indexed player, uint256 requestId)

##### fulfillRandomWords
Used by VRF Coordinator to mint random ticket.
Emits event WinnerChosen(address indexed player, uint256 indexed sum, uint256 indexed tokenId)

Informational functions:
----------
###### getTicketsLeftBySum
Returns how many tickets are left for this amount. Parameter is amount in usdt.
###### getTicketsLeft
Returns array of tickets amounts. i'th index corresponds to i'th index in sums array
###### getTopPlayers
Returns top 20 players with the biggest amount of tickets.
###### ticketNft
Returns address of ticket nft.
###### entranceFee
Returns the price of entering the raffle in wei. https://eth-converter.com/
###### ticketsLeft
Returns the amount of left tickets. 
###### isOpen
Returns true when raffle is open, false when raffle is closed.
###### reffererShare
Returns share that is repayed to refferer in tens (20% == 200)
###### numWords(), requestConfirmations(), callbackGasLimit(), keyHash(), subscriptionId()
Returns parameters of Chainlink VRF
