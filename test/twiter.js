const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TweeterContract", function () {
  let TwiterContract;
  let twiter;
  let owner;
  let addr1;

  beforeEach(async function () {
    TwiterContract = await ethers.getContractFactory("TweeterContract");
    [owner, addr1] = await ethers.getSigners();
    twiter = await TwiterContract.deploy();
  });

  it("Should create a new tweet", async function () {
    const tweetContent = "Hello, world!";
    await twiter.connect(owner).tweet(tweetContent);

    // Get the tweet with id 0
    const tweet = await twiter.tweets(0);

    // Check that the content of the tweet is correct
    expect(tweet.content).to.equal(tweetContent);

    // Check that the author of the tweet is correct
    expect(tweet.author).to.equal(owner.address);
  });

//   it("Should send a message", async function () {
//     const messageContent = "Hello, user!";
//     await twiter.connect(owner).sendMessage(addr1.address, messageContent);

//     // Get the messages of the owner
//     const messages = await twiter.conversation(owner.address);

//     // Get the last message
//     const message = messages[messages.length - 1];

//     // Check that the content of the message is correct
//     expect(message.content).to.equal(messageContent);

//     // Check that the sender of the message is correct
//     expect(message.from).to.equal(owner.address);
// });

// it("Should follow another user", async function () {
//     await twiter.connect(owner).follow(addr1.address);

//     // Get the users followed by the owner
//     const followedUsers = await twiter.following(owner.address);

//     // Check that the last followed user is correct
//     expect(followedUsers[followedUsers.length - 1]).to.equal(addr1.address);
// });

  it("Should allow another address to access the profile", async function () {
    await twiter.connect(owner).allow(addr1.address);

    // Check the operator status
    const operator = await twiter.operators(owner.address, addr1.address);

    // Check that the operator status is correct
    expect(operator).to.equal(true);
  });

  it("Should disallow another address from accessing the profile", async function () {
    await twiter.connect(owner).disallow(addr1.address);

    // Check the operator status
    const operator = await twiter.operators(owner.address, addr1.address);

    // Check that the operator status is correct
    expect(operator).to.equal(false);
  });
});