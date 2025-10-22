// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";



contract PandaNFT is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable   {
    uint256 private _nextTokenId;

    uint256 public MAX_AMOUNT = 100;

    string constant matadata = "https://independent-green-asp.myfilebase.com/ipfs/QmStz8RKdxEnatE97uendr3mMaA7Mns9LpJj7Bi8F4jvLE";

    mapping (address=>bool) public whiteList;



    mapping(uint256 => uint256) reqIdToTokenId;

    constructor(address initialOwner)
    ERC721("Panda", "PAD")
    Ownable(initialOwner){
    
    }

    function preMint() public payable {
        require(msg.value == 0.001 ether,"the price is 0.005 ether");
        require(totalSupply() <= MAX_AMOUNT,"the max amount is 3");
        require(whiteList[msg.sender],"you are not in the white list");
        // require(balanceOf(msg.sender) < 1,"Max amount bigger then 1");
        uint256 tokenId = _nextTokenId++;
        _setTokenURI(tokenId, matadata);
        //request(false,tokenId);
    }

    function mint()public payable  returns (uint256){
        require(msg.value == 0.005 ether,"the price is 0.005 ether");
        require(totalSupply() <= MAX_AMOUNT,"the max amount is 3");
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, matadata);
        return tokenId;
    }
    function withdraw(address addr) external  onlyOwner {
        payable(addr).transfer(address(this).balance);
    }


    function addToWhiteList(address[] calldata  addrs) public onlyOwner {
        for (uint i = 0; i<addrs.length; i++) {
            whiteList[addrs[i]] = true;
        }
    }
    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)internal override(ERC721, ERC721Enumerable) returns (address){
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}