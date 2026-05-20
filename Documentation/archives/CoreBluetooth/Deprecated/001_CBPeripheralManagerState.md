# 001_CBPeripheralManagerState.pdf

## Page 1

Deprecated
Use CBManagerState instead.
case unknown
A manager state that indicates the current state of the peripheral manager is unknown.
case resetting
A manager state that indicates the connection with the system service was momentarily lost
case unsupported
A manager state that indicates the platform doesn’t support the Bluetooth low energy
peripheral/server role.
case unauthorized
Topics
Constants
Core Bluetooth / CBPeripheralManagerState Deprecated
Enumeration
CBPeripheralManagerState Deprecated
Values that represent the current state of the peripheral manager.
iOS 6.0–10.0 Deprecated
iPadOS 6.0–10.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.9–10.13 Deprecated
tvOS 9.0–10.0 Deprecated
visionOS 1.0–1.0 Deprecated
watchOS 2.0–3.0 Deprecated


## Page 2

A manager state that indicates the app isn’t authorized to use the Bluetooth low energy
peripheral/server role.
case poweredOff
A manager state that indicates Bluetooth is currently powered off.
case poweredOn
A manager state that indicates Bluetooth is currently powered on and is available to use.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
enum CBCentralManagerState
Values that represent the current state of a central manager object.
Deprecated
Deprecated Constants
This document describes the constants found in the Core Bluetooth framework.
Initializers
Relationships
Conforms To
See Also
Deprecated


