# 011_CATapDescription.pdf

## Page 1

This class describes a tap object that contains an input stream. The input stream is a mix of all of
the specified processes output audio.
init()
convenience init(excludingProcesses: [AudioObjectID], deviceUID: String
stream: UInt)
convenience init(monoGlobalTapButExcludeProcesses: [AudioObjectID])
convenience init(monoMixdownOfProcesses: [AudioObjectID])
convenience init(processes: [AudioObjectID], deviceUID: String, stream:
UInt)
convenience init(stereoGlobalTapButExcludeProcesses: [AudioObjectID])
convenience init(stereoMixdownOfProcesses: [AudioObjectID])
Overview
Topics
Initializers
Instance Properties
Core Audio / CATapDescription
Class
CATapDescription
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+


## Page 2

var bundleIDs: [String]
var deviceUID: String?
var isExclusive: Bool
var isMixdown: Bool
var isMono: Bool
var isPrivate: Bool
var isProcessRestoreEnabled: Bool
var muteBehavior: CATapMuteBehavior
var name: String
var processes: [AudioObjectID]
var stream: UInt?
var uuid: UUID
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


