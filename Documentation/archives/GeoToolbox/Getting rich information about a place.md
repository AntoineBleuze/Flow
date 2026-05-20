# Getting rich information about a place.pdf

## Page 1

A PlaceDescriptor allows you to construct a collection of metadata about a place, including a
least one PlaceDescriptor.PlaceRepresentation which contains common geographic
concepts like an address or coordinate. PlaceDescriptor may optionally include a
supportingRepresentations which contains identifiers that match the place for mapping
service providers. Use PlaceDescriptor in conjunction with a mapping service to request rich
information about a place.
For example to create a PlaceDescriptor that describes an address with a common name use
init(representations:commonName:supportingRepresentations:) as shown here.
You can also initialize a PlaceDescriptor using an MKMapItem as shown below.
Discussion
GeoToolbox / PlaceDescriptor
Structure
PlaceDescriptor
A structure that contains identifying information about a place that a mapping
service may use to attempt to find rich place information such as phone numbers
websites, and so on.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

init(representations: [PlaceDescriptor.PlaceRepresentation], commonName
String?, supportingRepresentations: [PlaceDescriptor.SupportingPlace
Representation])
Creates a place descriptor, suitable for use when searching or retrieving rich data about a
place.
init?(item: MKMapItem)
Creates a place descriptor from a map item.
let commonName: String?
Publicly known name of the area or place of interest.
var address: String?
A full address, that one could use in postal or administrative scenarios.
var coordinate: CLLocationCoordinate2D?
The latitude and longitude for a place.
let representations: [PlaceDescriptor.PlaceRepresentation]
An array of representations of the place using common mapping concepts.
let supportingRepresentations: [PlaceDescriptor.SupportingPlace
Representation]
An array of proprietary or non-uniform representations of the place, such as representations
you can use with other mapping services.
func serviceIdentifier(for: String) -> String?
Retrieves the identifier for the specified service provider, if available.
enum PlaceRepresentation
Topics
Creating place descriptors
Getting the attributes of a place descriptor
Enumeration values that describe places and mapping service
representations


## Page 3

Values that represent a physical place, suitable for use when searching or retrieving rich data
enum SupportingPlaceRepresentation
Values that describe the representation of a physical place using proprietary attributes, such
as an alphanumeric location identifier from a mapping service provider.
typealias Specification
typealias UnwrappedType
typealias ValueType
static var defaultResolverSpecification: some ResolverSpecification
Copyable
CustomLocalizedStringResourceConvertible
Decodable
DisplayRepresentable
Encodable
Equatable
InstanceDisplayRepresentable
PersistentlyIdentifiable
Sendable
SendableMetatype
TypeDisplayRepresentable
Type Aliases
Type Properties
Relationships
Conforms To


