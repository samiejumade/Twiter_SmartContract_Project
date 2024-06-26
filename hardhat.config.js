require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
// module.exports = {
//   networks: {
//     localhost: {
//       url: "http://localhost:8545"
//     }
//   },
//   solidity: "0.8.24",
//   paths: {
//     artifacts: './artifacts',
//   },
// };


require('dotenv').config();

module.exports = {
    networks: {
      sepolia: {
          url: process.env.INFURA_API_KEY,
          accounts: { mnemonic: process.env.MNEMONIC }
        }
    },
    solidity: {
        version: "0.8.24",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    etherscan: {
      apiKey: process.env.ETHERSCAN_API_KEY,
    },
};
