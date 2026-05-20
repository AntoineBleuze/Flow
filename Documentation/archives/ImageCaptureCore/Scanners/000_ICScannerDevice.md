# 000_ICScannerDevice.pdf

## Page 1

An instance of ICScannerDevice class is intended to be used by the ICScannerDeviceView object
The ICScannerDeviceView class encapsulates the complexities of setting scan parameters,
performing scans and saving the result. The developer should consider using
ICScannerDeviceView instead of building their own views using the ICScannerDevice object.
var availableFunctionalUnitTypes: [NSNumber]
An array of functional unit types available on this scanner.
var selectedFunctionalUnit: ICScannerFunctionalUnit
The currently selected functional unit on the scanner.
func requestSelect(ICScannerFunctionalUnitType)
Requests to select a functional unit on the scanner.
enum ICScannerFunctionalUnitType
The types of scanner functional units.
Overview
Topics
Selecting a Functional Unit
ImageCaptureCore / ICScannerDevice
Class
ICScannerDevice
An object that represents a scanner.
macOS 10.4+


## Page 2

enum ICScannerFunctionalUnitState
Flags to indicate the state of the scanner functional unit.
func requestOpenSession(withCredentials: String, password: String)
Opens a session on the protected device with the authorized username and passcode.
func requestOverviewScan()
Starts an overview scan on the selected functional unit.
func requestScan()
Starts a scan on the selected functional unit.
func cancelScan()
Cancels the current scan.
var documentName: String
The document’s name.
var documentUTI: String
The document’s uniform type identifier.
var downloadsDirectory: URL
The downloads directory.
var transferMode: ICScannerTransferMode
The transfer mode for the scanned document.
var maxMemoryBandSize: UInt32
The total maximum band size requested when performing a memory-based transfer.
var defaultUsername: String
A default username on protected scanners.
Performing a Scan
Logging into a Protected Device
Relationships


## Page 3

ICDevice
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol ICScannerDeviceDelegate
Methods for determining availability, selecting a functional unit, and performing scans on
connected scanners.
Scanner Configuration
Examine a scanner’s functional units and features.
Inherits From
Conforms To
See Also
Scanners


