Tweeter Contract
This is a simple social media contract written in Solidity. It allows for the creation of tweets, sending messages, following users, and granting profile access to other users.

Contract Structure
The contract contains two main structs: Tweet and Message. Each has properties relevant to their roles in the social media platform.

Functions
tweet
This function allows a user to create a new tweet. It takes the content of the tweet as a parameter.

sendMessage
This function allows a user to send a message to another user. It takes the recipient's address and the content of the message as parameters.

follow
This function allows a user to follow another user. It takes the address of the user to be followed as a parameter.

allow
This function allows a user to grant another user access to their profile. It takes the address of the user to be granted access as a parameter.

disallow
This function allows a user to revoke another user's access to their profile. It takes the address of the user to have their access revoked as a parameter.

getLatestTweet
This function returns the latest tweets. It takes the number of tweets to return as a parameter.

getLatestofUser
This function returns the latest tweets of a specific user. It takes the user's address and the number of tweets to return as parameters.

Usage
To use this contract, deploy it on the Ethereum network. Users can then create tweets, send messages, follow other users, and grant or revoke profile access. Users can also view the latest tweets or the latest tweets of a specific user.

NOTE:- While deploying contract using hardhat we have to give contract name not contract file name in deployment script.

This project demonstrates a Twiter Contract deployment using Hardhat. 

# Tweeter Smart Contract

This is a smart contract for a decentralized Twitter-like application, written in Solidity.

## Structures

- `Tweet`: Represents a tweet, with an ID, author, content, and creation timestamp.
- `Message`: Represents a direct message between users, with an ID, content, sender, recipient, and creation timestamp.

## State Variables

- `tweets`: A mapping to store tweets by their unique identifiers.
- `tweetsOf`: A mapping to store all tweet IDs for each user.
- `conversation`: A mapping to store messages exchanged between users.
- `operators`: A mapping to allow users to give access of their profile to others.
- `following`: A mapping to store users followed by each user.
- `nextId`: The next available ID for a tweet.
- `nextMessageId`: The next available ID for a message.

## Functions

- `_tweet`: Internal function to create a new tweet.
- `_sendMessage`: Internal function to send a message.
- `tweet`: Function to create a new tweet.
- `tweet`: Function to create a new tweet on behalf of another address.
- `sendMessage`: Function to send a message.
- `sendMessage`: Function to send a message on behalf of another address.
- `follow`: Function to follow another user.
- `allow`: Function to allow another address to access the profile.
- `disallow`: Function to disallow another address from accessing the profile.
- `getLatestTweet`: Function to get the latest tweets.
- `getLatestofUser`: Function to get the latest tweets of a specific user.

## License

This project is licensed under the MIT License.

Try running some of the following tasks:

```shell deploy contract on local network
npx hardhat clean 
npx hardhat compile
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```
Deploied contract Address:
TwiterContract deployed to: 0xe605F5Fc756E25b8B9fb5dD42D78E94e7ad0Fcc5
Above contract is verified contract on sepolia test network

```shell deploy contract on test sepolia network
npx hardhat clean 
npx hardhat compile
npx hardhat run scripts/deploy.js --network sepolia 
npx hardhat help
npx hardhat test
```

To verify your contract on the Sepolia test network using Hardhat, you need to use the hardhat-etherscan plugin.
1.npm install --save-dev @nomiclabs/hardhat-etherscan

2. Then, add the following to your hardhat.config.js:
require('@nomiclabs/hardhat-etherscan');

module.exports = {
  networks: {
    sepolia: {
      url: "https://sepolia.etherscan.io", // replace with the correct URL
      accounts: ["your-private-key"] // replace with your private key
    }
  },
  etherscan: {
    apiKey: "your-etherscan-api-key" // replace with your Etherscan API key
  }
};

