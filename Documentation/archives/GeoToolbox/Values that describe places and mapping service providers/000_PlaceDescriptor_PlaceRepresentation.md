# 000_PlaceDescriptor_PlaceRepresentation.pdf

## Page 1

var address: String?
A full address, that one could use in postal or administrative scenarios.
var coordinate: CLLocationCoordinate2D?
The latitude and longitude for a place.
case address(String)
Full address, as you’d use in postal or administrative scenarios.
case coordinate(CLLocationCoordinate2D)
A physical location described by its latitude and longitude.
case deviceLocation(CLLocation)
Physical location in a coordinate system that a device would collect.
Topics
Place representations
Enumeration cases
GeoToolbox / PlaceDescriptor / PlaceDescriptor.PlaceRepresentation
Enumeration
PlaceDescriptor.PlaceRepresentation
Values that represent a physical place, suitable for use when searching or
retrieving rich data.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

Decodable
Encodable
Equatable
Sendable
SendableMetatype
enum SupportingPlaceRepresentation
Values that describe the representation of a physical place using proprietary attributes, such
as an alphanumeric location identifier from a mapping service provider.
Relationships
Conforms To
See Also
Values that describe places and mapping service providers


