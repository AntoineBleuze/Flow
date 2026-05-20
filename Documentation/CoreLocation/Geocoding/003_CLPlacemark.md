# 003_CLPlacemark.pdf

## Page 1

Converting between coordinates and user-friendly place names
Converting a user’s location to a descriptive placemark
A CLPlacemark object stores placemark data for a given latitude and longitude. Placemark data
includes information such as the country or region, state, city, and street address associated with
the specified coordinate. It can also include points of interest and geographically related data.
When you reverse geocode a geographic coordinate using a CLGeocoder object, you receive a
CLPlacemark object containing the descriptive information for that location. You can also create
CLPlacemark object and fill it with address information yourself, which you might do when you
want to determine the geographic coordinate associated with the location.
Mentioned in
Overview
Topics
Creating a placemark object
Core Location / CLPlacemark
Class
CLPlacemark
A user-friendly description of a geographic coordinate, often containing the name
of the place, its address, and other relevant information.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8–11.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated
watchOS 2.0–26.0 Deprecated


## Page 2

init(placemark: CLPlacemark)
Initializes and returns a placemark object from another placemark object.
var location: CLLocation?
The location object containing latitude and longitude information.
var region: CLRegion?
The geographic region associated with the placemark.
var name: String?
The name of the placemark.
var thoroughfare: String?
The street address associated with the placemark.
var subThoroughfare: String?
Additional street-level information for the placemark.
var locality: String?
The city associated with the placemark.
var subLocality: String?
Additional city-level information for the placemark.
var administrativeArea: String?
The state or province associated with the placemark.
var subAdministrativeArea: String?
Additional administrative area information for the placemark.
var postalCode: String?
The postal code associated with the placemark.
Getting the placemark’s location
Getting the placemark name
Getting the placemark details
Getting the placemark’s country


## Page 3

var isoCountryCode: String?
The abbreviated country or region name.
var country: String?
The name of the country or region associated with the placemark.
var postalAddress: CNPostalAddress?
The postal address associated with the location, formatted for use with the Contacts
framework.
var addressDictionary: [AnyHashable : Any]?
A dictionary containing the Address Book keys and values for the placemark.
Deprecated
var inlandWater: String?
The name of the inland water body associated with the placemark.
var ocean: String?
The name of the ocean associated with the placemark.
var areasOfInterest: [String]?
The relevant areas of interest associated with the placemark.
var timeZone: TimeZone?
The time zone associated with the placemark.
typealias Specification
typealias UnwrappedType
typealias ValueType
Getting the associated contact details
Getting landscape information
Getting points of interest
Getting the placemark’s time zone
Type Aliases


## Page 4

static var defaultResolverSpecification: EmptyResolverSpecification<
CLPlacemark>
convenience init(location: CLLocation, name: String?, postalAddress:
CNPostalAddress?)
NSObject
CVarArg
Copyable
CustomDebugStringConvertible
CustomLocalizedStringResourceConvertible
CustomStringConvertible
DisplayRepresentable
Equatable
Hashable
InstanceDisplayRepresentable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
TypeDisplayRepresentable
Type Properties
Initializers
Relationships
Inherits From
Conforms To
See Also


## Page 5

Converting between coordinates and user-friendly place names
Convert between a latitude and longitude pair and a more user-friendly description of that
location.
Converting a user’s location to a descriptive placemark
Transform the user’s location that displays on a map into an informative textual description b
reverse geocoding.
class CLGeocoder
An interface for converting between geographic coordinates and place names.
Deprecated
Geocoding


