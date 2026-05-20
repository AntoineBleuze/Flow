# Status.pdf

## Page 1

Important
This enumeration is available in iOS 12.5, and in iOS 13.5 and later.
case authorized
Authorization is granted.
case notAuthorized
Authorization is denied.
case restricted
Authorization is restricted.
case unknown
Authorization is not determined.
Overview
Topics
Authorization States
Exposure Notification / ENAuthorizationStatus
Enumeration
ENAuthorizationStatus
A set of cases that indicates the authorization status for the app.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 2

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
enum ENStatus
A set of cases that represents the overall status of exposure notification on the system.
Initializers
Relationships
Conforms To
See Also
Status


## Page 3

Important
This enumeration is available in iOS 12.5, and in iOS 13.5 and later.
case active
Notification is active.
case bluetoothOff
Bluetooth is turned off.
case disabled
Notification is disabled.
Overview
Topics
States
Exposure Notification / ENStatus
Enumeration
ENStatus
A set of cases that represents the overall status of exposure notification on the
system.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 4

case restricted
Notification is not active due to system restrictions, such as parental controls.
case unknown
Notification is unknown.
case paused
The user paused Exposure Notification.
case unauthorized
The user hasn’t authorized Exposure Notification.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
enum ENAuthorizationStatus
A set of cases that indicates the authorization status for the app.
Initializers
Relationships
Conforms To
See Also
Status


