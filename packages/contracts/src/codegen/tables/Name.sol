// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("geoweb"), bytes16("Name")));
bytes32 constant NameTableId = _tableId;

library Name {
  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](0);

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](0);
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "value";
  }

  /** Register the table's key schema, value schema, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table's key schema, value schema, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get value */
  function get() internal view returns (string memory value) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (string(_blob));
  }

  /** Get value (using the specified store) */
  function get(IStore _store) internal view returns (string memory value) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (string(_blob));
  }

  /** Set value */
  function set(string memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.setField(_tableId, _keyTuple, 0, bytes((value)), getValueSchema());
  }

  /** Set value (using the specified store) */
  function set(IStore _store, string memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.setField(_tableId, _keyTuple, 0, bytes((value)), getValueSchema());
  }

  /** Get the length of value */
  function length() internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getValueSchema());
    unchecked {
      return _byteLength / 1;
    }
  }

  /** Get the length of value (using the specified store) */
  function length(IStore _store) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getValueSchema());
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * Get an item of value
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        0,
        getValueSchema(),
        _index * 1,
        (_index + 1) * 1
      );
      return (string(_blob));
    }
  }

  /**
   * Get an item of value (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItem(IStore _store, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getValueSchema(), _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /** Push a slice to value */
  function push(string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, bytes((_slice)), getValueSchema());
  }

  /** Push a slice to value (using the specified store) */
  function push(IStore _store, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.pushToField(_tableId, _keyTuple, 0, bytes((_slice)), getValueSchema());
  }

  /** Pop a slice from value */
  function pop() internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 1, getValueSchema());
  }

  /** Pop a slice from value (using the specified store) */
  function pop(IStore _store) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.popFromField(_tableId, _keyTuple, 0, 1, getValueSchema());
  }

  /**
   * Update a slice of value at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 1, bytes((_slice)), getValueSchema());
    }
  }

  /**
   * Update a slice of value (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function update(IStore _store, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 0, _index * 1, bytes((_slice)), getValueSchema());
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(string memory value) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(bytes(value).length);
    }

    return abi.encodePacked(_encodedLengths.unwrap(), bytes((value)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple() internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](0);

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord() internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store) internal {
    bytes32[] memory _keyTuple = new bytes32[](0);

    _store.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }
}
