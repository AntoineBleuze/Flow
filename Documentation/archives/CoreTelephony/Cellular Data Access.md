# Cellular Data Access.pdf

## Page 1

This property represents all access to cellular data. If the restrictedState is CTCellular
DataRestrictedState.restricted, the app cannot use the cellular network.
var restrictedState: CTCellularDataRestrictedState
The current state of cellular data restrictions.
enum CTCellularDataRestrictedState
The possible states of the cellular data policy.
var cellularDataRestrictionDidUpdateNotifier: CellularDataRestrictionDi
UpdateNotifier?
A block that handles cellular data restriction state changes.
Overview
Topics
Determining the Cellular Data Restricted State
Handling Policy Changes
Core Telephony / CTCellularData
Class
CTCellularData
An object indicating whether the app can access cellular data.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+


## Page 2

typealias CellularDataRestrictionDidUpdateNotifier
A block to provide updates on the app’s cellular data restriction state.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To


