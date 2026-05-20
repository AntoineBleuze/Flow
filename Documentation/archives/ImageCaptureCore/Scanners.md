# Scanners.pdf

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


## Page 4

func scannerDeviceDidBecomeAvailable(ICScannerDevice)
Tells the client when another client closes the current open session on the scanner.
func scannerDevice(ICScannerDevice, didSelect: ICScannerFunctionalUnit,
error: (any Error)?)
Tells the client when a functional unit is selected on the scanner.
func scannerDevice(ICScannerDevice, didCompleteOverviewScanWithError:
(any Error)?)
Tells the client when the scanner completes an overview scan.
func scannerDevice(ICScannerDevice, didCompleteScanWithError: (any Erro
)?)
Topics
Determining Scanner Availability
Selecting a Functional Unit
Performing a Scan
ImageCaptureCore / ICScannerDeviceDelegate
Protocol
ICScannerDeviceDelegate
Methods for determining availability, selecting a functional unit, and performing
scans on connected scanners.
macOS 10.4+


## Page 5

Tells the client when the scanner completes a scan.
func scannerDevice(ICScannerDevice, didScanTo: ICScannerBandData)
Tells the client when the scanner receives the requested scan progress notification and a
band of data is sent for each notification received.
func scannerDevice(ICScannerDevice, didScanTo: URL)
Tells the client when the scanner receives the requested scan.
ICDeviceDelegate, NSObjectProtocol
class ICScannerDevice
An object that represents a scanner.
Scanner Configuration
Examine a scanner’s functional units and features.
Relationships
Inherits From
See Also
Scanners


## Page 6

class ICScannerBandData
The options for each band of data that the scanner reads.
enum ICScannerBitDepth
The number of bits per channel in the scanned image.
enum ICScannerColorDataFormatType
The color data formats relevant to multichannel data.
enum ICScannerDocumentType
The supported document size types.
enum ICScannerMeasurementUnit
The unit of measurement used by the scanner.
Topics
Band Data
Bit Depth
Color Formats
Document Sizes
Features
ImageCaptureCore / Scanner Configuration
API Collection
Scanner Configuration
Examine a scanner’s functional units and features.


## Page 7

class ICScannerFeature
An abstract class that describes a scanner feature.
class ICScannerFeatureBoolean
A feature with a value of YES or NO.
class ICScannerFeatureEnumeration
A feature that can have one of several discrete values, strings or numbers.
class ICScannerFeatureRange
A feature with a value that lies within a range.
class ICScannerFeatureTemplate
A group of one or more rectangular scan areas that can be used with a scanner functional
unit.
enum ICScannerFeatureType
The types of scanner features.
class ICScannerFunctionalUnit
An abstract class that represents a scanner functional unit.
class ICScannerFunctionalUnitDocumentFeeder
An object that represents the document feeder unit on a scanner.
class ICScannerFunctionalUnitFlatbed
An object that represents the flatbed unit on a scanner.
class ICScannerFunctionalUnitNegativeTransparency
An object that represents the transparency unit for scanning negatives on the scanner.
class ICScannerFunctionalUnitPositiveTransparency
An object that represents the transparency unit for scanning positives on the scanner.
enum ICScannerTransferMode
The modes for transferring scan data from the scanner functional unit.
enum ICScannerPixelDataType
Functional Units
Pixel Data Types


## Page 8

The pixel data types.
let ICScannerStatusRequestsOverviewScan: String
A nonlocalized notification string to indicate that the scanner is requesting an overview scan
let ICScannerStatusWarmingUp: String
A nonlocalized notification string to indicate that the scanner is warming up.
let ICScannerStatusWarmUpDone: String
A nonlocalized notification string to indicate that the scanner has warmed up.
let ICButtonTypeCopy: String
A nonlocalized notification string to indicate that the Copy button on the device was pressed
let ICButtonTypeMail: String
A nonlocalized notification string to indicate that the Mail button on the device was pressed.
let ICButtonTypePrint: String
A nonlocalized notification string to indicate that the Print button on the device was pressed
let ICButtonTypeScan: String
A nonlocalized notification string to indicate that the Scan button on the device was pressed
let ICButtonTypeTransfer: String
A nonlocalized notification string to indicate that the Transfer button on the device was
pressed.
let ICButtonTypeWeb: String
A nonlocalized notification string to indicate that the Web button on the device was pressed
class ICScannerDevice
Scanner States
Buttons
See Also
Scanners


## Page 9

An object that represents a scanner.
protocol ICScannerDeviceDelegate
Methods for determining availability, selecting a functional unit, and performing scans on
connected scanners.


