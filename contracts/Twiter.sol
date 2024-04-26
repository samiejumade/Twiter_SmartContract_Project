// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TweeterContract {
    struct Tweet {
        uint id; // Unique identifier for the tweet
        address author; // Address of the user who authored the tweet
        string content; // Content of the tweet
        uint createdAt; // Timestamp of when the tweet was created
    }

    struct Message {
        uint id; // Unique identifier for the message
        string content; // Content of the message
        address from; // Address of the sender
        address to; // Address of the recipient
        uint createdAt; // Timestamp of when the message was created
    }

    // Mapping to store tweets by their unique identifiers
    mapping (uint => Tweet) public tweets;
    // Mapping to store all tweet IDs for each user
    mapping (address => uint[]) public tweetsOf;
    // Mapping to store messages exchanged between users
    mapping (address => Message[]) public conversation;
    // Mapping to allow users to give access of their profile to others
    mapping (address => mapping (address => bool)) public operators;
    // Mapping to store users followed by each user
    mapping (address => address[]) public following;

    uint nextId; // Next available ID for a tweet
    uint nextMessageId; // Next available ID for a message

    // Internal function to create a new tweet
    function _tweet(address _from, string memory _content) internal {
        tweets[nextId] = Tweet(nextId, _from, _content, block.timestamp);
        tweetsOf[_from].push(nextId);
        nextId++;
    }

    // Internal function to send a message
    function _sendMessage(address _from, address _to, string memory _content) internal {
        conversation[_from].push(Message(nextMessageId, _content, _from, _to, block.timestamp));
        nextMessageId++;
    }

    // Function to create a new tweet
    function tweet(string memory _content) public {
        _tweet(msg.sender, _content);
    }

    // Function to create a new tweet on behalf of another address
    function tweet(address _from, string memory _content) public {
        _tweet(_from, _content);
    }

    // Function to send a message
    function sendMessage(address _to, string memory _content) public {
        _sendMessage(msg.sender, _to, _content);
    }

    // Function to send a message on behalf of another address
    function sendMessage(address _from, address _to, string memory _content) public {
        _sendMessage(_from, _to, _content);
    }

    // Function to follow another user
    function follow(address _followed) public {
        following[msg.sender].push(_followed);
    }

    // Function to allow another address to access the profile
    function allow(address _operator) public {
        operators[msg.sender][_operator] = true;
    }

    // Function to disallow another address from accessing the profile
    function disallow(address _operator) public {
        operators[msg.sender][_operator] = false;
    }

    // Function to get the latest tweets
    function getLatestTweet(uint count) public view returns (Tweet[] memory) {
        require(count > 0 && count < nextId, "Count is not valid");
        Tweet[] memory _tweets = new Tweet[](count);
        uint j;

        for (uint i = nextId - count; i < nextId; i++) {
            Tweet storage _structure = tweets[i];
            _tweets[j] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );
            j++;
        }
        return _tweets;
    }

    // Function to get the latest tweets of a specific user
    function getLatestofUser(address _user, uint count) public view returns (Tweet[] memory) {
        Tweet[] memory _tweets = new Tweet[](count);
        uint[] memory ids = tweetsOf[_user];
        require(count > 0 && count <= ids.length, "Count is not valid");
        uint j;

        for (uint i = ids.length - count; i < ids.length; i++) {
            Tweet storage _structure = tweets[ids[i]];
            _tweets[j] = Tweet(
                _structure.id,
                _structure.author,
                _structure.content,
                _structure.createdAt
            );
            j++;
        }

        return _tweets;
    }
}
