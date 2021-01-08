// contracts/BlindTestGame.sol
// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.22 <0.7.0;

contract BlindTestGame {

    address private _owner;
    string private _name;
    string private _originalMusicFileIntegrityHash;
    string private _originalMusicFileURLIntegrityHash;
    uint8 private _maxParticipants;
    uint8 private _participantsCount;
    bool private _isOpen;
    mapping (address => string) private _participants;

    constructor(
        string memory name_,
        string memory originalMusicFileIntegrityHash_,
        string memory originalMusicFileURLIntegrityHash_,
        uint8 maxParticipants_
    ) public {
        _owner = msg.sender;
      _name = name_;
      _originalMusicFileIntegrityHash = originalMusicFileIntegrityHash_;
      _originalMusicFileURLIntegrityHash = originalMusicFileURLIntegrityHash_;
      _maxParticipants = maxParticipants_;
      _participantsCount = 0;
      _isOpen = true;
    }

    function name() public view returns (string memory) {
      return _name;
    }

    function originalMusicFileIntegrityHash() public view returns (string memory) {
      return _originalMusicFileIntegrityHash;
    }

    function originalMusicFileURLIntegrityHash() public view returns (string memory) {
      return _originalMusicFileURLIntegrityHash;
    }

    function maxParticipants() public view returns (uint8) {
      return _maxParticipants;
    }

    function isOpen() public view returns (bool) {
      return _isOpen;
    }

    modifier onlyWhenOpen() {
      require(_isOpen, "Game is closed.");
      _;
    }

    modifier onlyOwner() {
      require(_isOpen, "Only owner can call this function.");
      _;
    }

    function participate() public onlyWhenOpen{
        _participants[msg.sender] = "";
    }

    function close() public onlyOwner{
        _isOpen = false;
    }
}
