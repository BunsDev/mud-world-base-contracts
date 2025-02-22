// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

import { TrackedImageComponentData, ModelComponentData, PositionComponentData, ScaleComponentData, OrientationComponentData } from "./../Tables.sol";

interface IARSystem {
  function geoweb_ARSystem_addImageAnchor(
    TrackedImageComponentData memory trackedImageComponentData
  ) external returns (bytes32 key);

  function geoweb_ARSystem_addAnchoredObject(
    bytes32 anchor,
    ModelComponentData memory modelComponentData
  ) external returns (bytes32 key);

  function geoweb_ARSystem_addAnchoredObject(
    bytes32 anchor,
    PositionComponentData memory positionComponentData,
    ModelComponentData memory modelComponentData
  ) external returns (bytes32 key);

  function geoweb_ARSystem_addAnchoredObject(
    bytes32 anchor,
    PositionComponentData memory positionComponentData,
    ScaleComponentData memory scaleComponentData,
    OrientationComponentData memory orientationComponentData,
    ModelComponentData memory modelComponentData
  ) external returns (bytes32 key);

  function geoweb_ARSystem_removeImageAnchor(bytes32 key) external;

  function geoweb_ARSystem_removeObject(bytes32 key) external;
}
