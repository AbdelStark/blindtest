// contracts/BlindTestGame.sol
// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.22 <0.7.0;

contract BlindTestGame {

    string private _name;
    string private _originalMusicFileIntegrityHash;
    string private _originalMusicFileURLIntegrityHash;
    uint8 private _maxParticipants;

    constructor(
        string memory name_,
        string memory originalMusicFileIntegrityHash_,
        string memory originalMusicFileURLIntegrityHash_,
        uint8 maxParticipants_
    ) public {
      _name = name_;
      _originalMusicFileIntegrityHash = originalMusicFileIntegrityHash_;
      _originalMusicFileURLIntegrityHash = originalMusicFileURLIntegrityHash_;
      _maxParticipants = maxParticipants_;
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
}
