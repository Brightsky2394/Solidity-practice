// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC721 {
    function transferFrom(address _from, address _to, uint _nftId) external;
}

contract DutchAuction {
    uint public constant DURATION = 7 days;
    address payable public immutable seller;
    IERC721 public immutable nft;
    uint public immutable nftId;
    uint public immutable startAt;
    uint public immutable expiresAt;
    uint public immutable discountRate;
    uint public immutable startingPrice;

    constructor(
        address _nft,
        uint _nftId,
        uint _startingPrice,
        uint _discountRate
    ) {
        nft = IERC721(_nft);
        nftId = _nftId;
        startingPrice = _startingPrice;
        discountRate = _discountRate;
        require(
            _startingPrice >= _discountRate * DURATION,
            "Starting price < discount"
        );
        startAt = block.timestamp;
        expiresAt = block.timestamp + DURATION;
        seller = payable(msg.sender);
    }

    function getPrice() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        uint discount = discountRate * timeElapsed;
        return startingPrice - discount;
    }

    function buy() external payable {
        require(block.timestamp >= expiresAt, "Auction expired");

        uint price = getPrice();
        require(msg.value >= price, "ETH < price");
        nft.transferFrom(seller, msg.sender, nftId);
        uint refund = msg.value - price;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
        selfdestruct(seller);
    }
}
