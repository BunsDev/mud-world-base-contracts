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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("geoweb"), bytes16("AnchorComponent")));
bytes32 constant AnchorComponentTableId = _tableId;

struct AnchorComponentData {
  bytes32 anchor;
  bytes position;
  bytes orientation;
}

library AnchorComponent {
  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES;
    _schema[2] = SchemaType.BYTES;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "anchor";
    fieldNames[1] = "position";
    fieldNames[2] = "orientation";
  }

  /** Register the table's key schema, value schema, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table's key schema, value schema, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get anchor */
  function getAnchor(bytes32 key) internal view returns (bytes32 anchor) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (Bytes.slice32(_blob, 0));
  }

  /** Get anchor (using the specified store) */
  function getAnchor(IStore _store, bytes32 key) internal view returns (bytes32 anchor) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (Bytes.slice32(_blob, 0));
  }

  /** Set anchor */
  function setAnchor(bytes32 key, bytes32 anchor) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((anchor)), getValueSchema());
  }

  /** Set anchor (using the specified store) */
  function setAnchor(IStore _store, bytes32 key, bytes32 anchor) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((anchor)), getValueSchema());
  }

  /** Get position */
  function getPosition(bytes32 key) internal view returns (bytes memory position) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getValueSchema());
    return (bytes(_blob));
  }

  /** Get position (using the specified store) */
  function getPosition(IStore _store, bytes32 key) internal view returns (bytes memory position) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getValueSchema());
    return (bytes(_blob));
  }

  /** Set position */
  function setPosition(bytes32 key, bytes memory position) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 1, bytes((position)), getValueSchema());
  }

  /** Set position (using the specified store) */
  function setPosition(IStore _store, bytes32 key, bytes memory position) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 1, bytes((position)), getValueSchema());
  }

  /** Get the length of position */
  function lengthPosition(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, getValueSchema());
    unchecked {
      return _byteLength / 1;
    }
  }

  /** Get the length of position (using the specified store) */
  function lengthPosition(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, getValueSchema());
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * Get an item of position
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemPosition(bytes32 key, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        1,
        getValueSchema(),
        _index * 1,
        (_index + 1) * 1
      );
      return (bytes(_blob));
    }
  }

  /**
   * Get an item of position (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemPosition(IStore _store, bytes32 key, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, getValueSchema(), _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /** Push a slice to position */
  function pushPosition(bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, bytes((_slice)), getValueSchema());
  }

  /** Push a slice to position (using the specified store) */
  function pushPosition(IStore _store, bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 1, bytes((_slice)), getValueSchema());
  }

  /** Pop a slice from position */
  function popPosition(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 1, getValueSchema());
  }

  /** Pop a slice from position (using the specified store) */
  function popPosition(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 1, 1, getValueSchema());
  }

  /**
   * Update a slice of position at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updatePosition(bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)), getValueSchema());
    }
  }

  /**
   * Update a slice of position (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updatePosition(IStore _store, bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)), getValueSchema());
    }
  }

  /** Get orientation */
  function getOrientation(bytes32 key) internal view returns (bytes memory orientation) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2, getValueSchema());
    return (bytes(_blob));
  }

  /** Get orientation (using the specified store) */
  function getOrientation(IStore _store, bytes32 key) internal view returns (bytes memory orientation) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2, getValueSchema());
    return (bytes(_blob));
  }

  /** Set orientation */
  function setOrientation(bytes32 key, bytes memory orientation) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 2, bytes((orientation)), getValueSchema());
  }

  /** Set orientation (using the specified store) */
  function setOrientation(IStore _store, bytes32 key, bytes memory orientation) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 2, bytes((orientation)), getValueSchema());
  }

  /** Get the length of orientation */
  function lengthOrientation(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getValueSchema());
    unchecked {
      return _byteLength / 1;
    }
  }

  /** Get the length of orientation (using the specified store) */
  function lengthOrientation(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getValueSchema());
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * Get an item of orientation
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemOrientation(bytes32 key, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        2,
        getValueSchema(),
        _index * 1,
        (_index + 1) * 1
      );
      return (bytes(_blob));
    }
  }

  /**
   * Get an item of orientation (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemOrientation(IStore _store, bytes32 key, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getValueSchema(), _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /** Push a slice to orientation */
  function pushOrientation(bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, bytes((_slice)), getValueSchema());
  }

  /** Push a slice to orientation (using the specified store) */
  function pushOrientation(IStore _store, bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 2, bytes((_slice)), getValueSchema());
  }

  /** Pop a slice from orientation */
  function popOrientation(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 1, getValueSchema());
  }

  /** Pop a slice from orientation (using the specified store) */
  function popOrientation(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 2, 1, getValueSchema());
  }

  /**
   * Update a slice of orientation at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateOrientation(bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)), getValueSchema());
    }
  }

  /**
   * Update a slice of orientation (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateOrientation(IStore _store, bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)), getValueSchema());
    }
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (AnchorComponentData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getValueSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (AnchorComponentData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getValueSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 key, bytes32 anchor, bytes memory position, bytes memory orientation) internal {
    bytes memory _data = encode(anchor, position, orientation);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getValueSchema());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 key, bytes32 anchor, bytes memory position, bytes memory orientation) internal {
    bytes memory _data = encode(anchor, position, orientation);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setRecord(_tableId, _keyTuple, _data, getValueSchema());
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, AnchorComponentData memory _table) internal {
    set(key, _table.anchor, _table.position, _table.orientation);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, AnchorComponentData memory _table) internal {
    set(_store, key, _table.anchor, _table.position, _table.orientation);
  }

  /**
   * Decode the tightly packed blob using this table's schema.
   * Undefined behaviour for invalid blobs.
   */
  function decode(bytes memory _blob) internal pure returns (AnchorComponentData memory _table) {
    // 32 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 32));

    _table.anchor = (Bytes.slice32(_blob, 0));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 32) {
      // skip static data length + dynamic lengths word
      uint256 _start = 64;
      uint256 _end;
      unchecked {
        _end = 64 + _encodedLengths.atIndex(0);
      }
      _table.position = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(1);
      }
      _table.orientation = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    bytes32 anchor,
    bytes memory position,
    bytes memory orientation
  ) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(bytes(position).length, bytes(orientation).length);
    }

    return abi.encodePacked(anchor, _encodedLengths.unwrap(), bytes((position)), bytes((orientation)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }
}
