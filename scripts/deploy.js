const { ethers } = require("hardhat");

async function main() {
    const TweeterContract = await ethers.getContractFactory("TweeterContract");
    const tweeterContract = await TweeterContract.deploy();

    console.log("TwiterContract deployed to:", tweeterContract.target);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });




    