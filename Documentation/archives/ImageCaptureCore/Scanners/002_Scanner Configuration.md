# 002_Scanner Configuration.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

An object that represents a scanner.
protocol ICScannerDeviceDelegate
Methods for determining availability, selecting a functional unit, and performing scans on
connected scanners.


