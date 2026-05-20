# 001_ICScannerDeviceDelegate.pdf

## Page 1

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


## Page 2

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


