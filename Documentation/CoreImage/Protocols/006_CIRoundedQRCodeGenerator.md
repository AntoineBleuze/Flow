# 006_CIRoundedQRCodeGenerator.pdf

## Page 1

Generate a QR Code image for message data.
var centerSpaceSize: Float
The fraction of the center space of the QRCode to fill with Color 1. If the size is 0.0 or the
Correction Level is L or M, the center of the QRCode will be unaltered. The size will be limite
to 0.25 if the Correction Level is Q. The size will be limited to 0.33 if the Correction Level is H
Required
var color0: CIColor
The background color for the QRCode
Required
var color1: CIColor
The foreground color for the QRCode
Required
Overview
Topics
Instance Properties
Core Image / CIRoundedQRCodeGenerator
Protocol
CIRoundedQRCodeGenerator
The protocol for the Rounded QR Code Generator filter.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 2

var correctionLevel: String
QR Code correction level L, M, Q, or H.
Required
var message: Data
The message to encode in the QR Code
Required
var roundedData: Bool
If true then the data points in the QRCode should have a rounded appearance.
Required
var roundedMarkers: Int
If 1, then the Finder Patterns in the QRCode should have a rounded appearance. If 2, then th
Alignment Patterns will also be rounded
Required
var scale: Float
The scale factor to enlarge the QRCode by.
Required
CIFilterProtocol
Relationships
Inherits From


