# Sample Hardhat Project

NOTE:- While deploying contract using hardhat we have to give contract name not contract file name in deployment script.

This project demonstrates a Twiter Contract deployment using Hardhat. 

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

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
TO Push Code:-
…or create a new repository on the command line
echo "# Twiter_SmartContract_Project" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/samiejumade/Twiter_SmartContract_Project.git
git push -u origin main


…or push an existing repository from the command line
git remote add origin https://github.com/samiejumade/Twiter_SmartContract_Project.git
git branch -M main
git push -u origin main