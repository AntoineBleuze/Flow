# Geocoding.pdf

## Page 1

The CLLocationManager object reports locations as a latitude/longitude pair. While these value
uniquely represent any location on the planet, they are not values that users immediately associat
with the location. Users are more familiar with names that describe a location, such as street nam
or city names. The CLGeocoder class lets you convert between geographic coordinates and the
user-friendly names associated with that location. You can convert from either a latitude/longitude
pair to a user friendly place name, or the other way around.
Overview
Core Location / Converting between coordinates and user-friendly place names
Article
Converting between coordinates and
user-friendly place names
Convert between a latitude and longitude pair and a more user-friendly descriptio
of that location.


## Page 2

User place names are represented by a CLPlacemark object, which contains properties for
specifying the street name, city name, country or region name, postal code, and many others.
Placemarks also contain properties describing relevant geographic features or points of interest a
the location, such as the names of mountains, rivers, businesses, or landmarks.
Geocoder objects are one-shot objects—that is, you use each object to make a single conversion
You can create multiple geocoder objects and perform multiple conversions, but Apple rate limits
the number of conversions you can perform. Making too many requests in a short period of time
may cause some of those requests to fail. For tips on how to manage any conversions, see the
overview of CLGeocoder.
If you have a CLLocation object, call the reverseGeocodeLocation(_:completion
Handler:) method of your geocoder object to retrieve a CLPlacemark object for that location
Typically, you convert coordinates into placemarks when you want to display information about th
location to the user. For example, if the user selects a location on a map, you might want to show
the address at that location.
Convert a coordinate into a placemark


## Page 3

Listing 1 shows how to obtain placemark information for the last location reported by the
CLLocationManager object. Because calls to the geocoder object are asynchronous, the caller
of this method passes in a completion handler, which is executed with the results.
Listing 1. Reverse geocoding a coordinate
If you have user-provided address information, call the methods of CLGeocoder to obtain the
corresponding location data. The CLGeocoder class provides options for converting a user-type
string or for converting a dictionary of address-related information. That information is forwarded
to Apple servers, which interpret the information and return the results.
Depending on the precision of the user-provided information, you may receive one result or
multiple results. For example, passing a string of “100 Main St., USA” may return many results
unless you also specify a search region or additional details. To help you decide which result is
correct, the geocoder actually returns CLPlacemark objects, which contain both the coordinate
and the original information that you provided.
Convert a placemark into a coordinate


## Page 4

Listing 2 shows how you might obtain a coordinate value from a user-provided string. The examp
calls the provided completion handler with only the first result. If the string does not correspond t
any location, the method calls the completion handler with an error and an invalid coordinate.
Listing 2. Getting a coordinate from an address string
Converting a user’s location to a descriptive placemark
Transform the user’s location that displays on a map into an informative textual description b
reverse geocoding.
class CLGeocoder
An interface for converting between geographic coordinates and place names.
Deprecated
class CLPlacemark
A user-friendly description of a geographic coordinate, often containing the name of the
place, its address, and other relevant information.
See Also
Geocoding


## Page 5

You can show a user’s location on a map in order to orient them to elements of your app that use
map content. For instance, a user’s current location can be a point of reference for retrieving
search results or calculating directions. Additionally, you can display location information outside 
the map, such as a search field pre-filled with the user’s current city or street address. To provide
this information in your app, configure your map view to display the user’s location, and then
translate the location to informative, user-friendly data.
To provide user-friendly place information, configure your map view to display the user’s current
location by enabling showsUserLocation. After enabling this property, the map delegate begin
receiving updates to the user’s location, represented with a MKUserLocation object, through
mapView(_:didUpdate:).
CLPlacemark objects represent user place names, and include properties for street name, city
name, country or region name, and many other location identifiers. When mapView(_:did
Update:) receives updates on the user’s location, convert the MKUserLocation object to a
CLPlacemark by reverse geocoding the location property with a CLGeocoder. Readable
descriptions of the user’s location are available as properties on the placemark, such as the city
information stored in the locality property.
Overview
Display the user location annotation
Geocode the user location annotation
Core Location / Converting a user’s location to a descriptive placemark
Article
Converting a user’s location to a
descriptive placemark
Transform the user’s location that displays on a map into an informative textual
description by reverse geocoding.


## Page 6

Important
Geocoding requests are rate-limited for each app. Issue new geocoding requests only when
the user has moved a significant distance and after a reasonable amount of time has passed.
See also
Related Documentation


## Page 7

Converting between coordinates and user-friendly place names
Converting between coordinates and user-friendly place names
Convert between a latitude and longitude pair and a more user-friendly description of that
location.
class CLGeocoder
An interface for converting between geographic coordinates and place names.
Deprecated
class CLPlacemark
A user-friendly description of a geographic coordinate, often containing the name of the
place, its address, and other relevant information.
See Also
Geocoding


## Page 8

Deprecated
Use MapKit
Converting between coordinates and user-friendly place names
Converting a user’s location to a descriptive placemark
The CLGeocoder class provides services for converting between a coordinate (specified as a
latitude and longitude) and the user-friendly representation of that coordinate. A user-friendly
representation of the coordinate typically consists of the street, city, state, and country or region
information corresponding to the given location, but it may also contain a relevant point of interes
landmarks, or other identifying information. A geocoder object is a single-shot object that works
with a network-based service to look up placemark information for its specified coordinate value.
To use a geocoder object, you create it and call one of its forward- or reverse-geocoding method
to begin the request. Reverse-geocoding requests take a latitude and longitude value and find a
user-readable address. Forward-geocoding requests take a user-readable address and find the
Mentioned in
Overview
Core Location / CLGeocoder Deprecated
Class
CLGeocoder Deprecated
An interface for converting between geographic coordinates and place names.
iOS 5.0–26.0 Deprecated
iPadOS 5.0–26.0 Deprecated
Mac Catalyst 13.1–26.0 Deprecated
macOS 10.8–26.0 Deprecated
tvOS 9.0–26.0 Deprecated
visionOS 1.0–26.0 Deprecated
watchOS 2.0–26.0 Deprecated


## Page 9

corresponding latitude and longitude value. Forward-geocoding requests may also return
additional information about the specified location, such as a point of interest or building at that
location. For both types of request, the results are returned using a CLPlacemark object. In the
case of forward-geocoding requests, multiple placemark objects may be returned if the provided
information yielded multiple possible locations.
To make smart decisions about what types of information to return, the geocoder server uses all
the information provided to it when processing the request. For example, if the user is moving
quickly along a highway, it might return the name of the overall region, and not the name of a sma
park that the user is passing through.
Apps must be conscious of how they use geocoding. Geocoding requests are rate-limited for eac
app, so making too many requests in a short period of time may cause some of the requests to fa
(When the maximum rate is exceeded, the geocoder returns an error object with the CLError
.Code.network error to the associated completion handler.) Here are some rules of thumb for
using this class effectively:
Send at most one geocoding request for any one user action.
If the user performs multiple actions that involve geocoding the same location, reuse the result
from the initial geocoding request instead of starting individual requests for each action.
When you want to update the user’s current location automatically (such as when the user is
moving), issue new geocoding requests only when the user has moved a significant distance a
after a reasonable amount of time has passed. For example, in a typical situation, you should n
send more than one geocoding request per minute.
Do not start a geocoding request at a time when the user will not see the results immediately.
For example, do not start a request if your application is inactive or in the background.
The computer or device must have access to the network in order for the geocoder object to retu
detailed placemark information. Although, the geocoder stores enough information locally to repo
the localized country or region name and ISO country code for many locations. If this information
isn’t available for a specific location, the geocoder may still report an error to your completion
block.
You can use geocoder objects either in conjunction with, or independent of, the classes of the
MapKit framework.
Tips for Using a Geocoder Object
Topics
Reverse geocoding a location


## Page 10

func reverseGeocodeLocation(CLLocation, preferredLocale: Locale?,
completionHandler: ([CLPlacemark]?, (any Error)?) -> Void)
Submits a reverse-geocoding request for the specified location and locale.
func reverseGeocodeLocation(CLLocation, completionHandler: ([CLPlacemar
]?, (any Error)?) -> Void)
Submits a reverse-geocoding request for the specified location.
typealias CLGeocodeCompletionHandler
A block to be called when a geocoding request is complete.
func geocodeAddressString(String, in: CLRegion?, preferredLocale: Local
?, completionHandler: ([CLPlacemark]?, (any Error)?) -> Void)
Submits a forward-geocoding requesting using the specified address string and locale
information.
func geocodeAddressString(String, completionHandler: ([CLPlacemark]?,
(any Error)?) -> Void)
Submits a forward-geocoding request using the specified string.
func geocodeAddressString(String, in: CLRegion?, completionHandler: ([
CLPlacemark]?, (any Error)?) -> Void)
Submits a forward-geocoding request using the specified string and region information.
func geocodePostalAddress(CNPostalAddress, completionHandler: ([
CLPlacemark]?, (any Error)?) -> Void)
Submits a forward-geocoding requesting using the specified Contacts framework informatio
func geocodePostalAddress(CNPostalAddress, preferredLocale: Locale?,
completionHandler: ([CLPlacemark]?, (any Error)?) -> Void)
Submits a forward-geocoding requesting using the specified locale and Contacts framework
information.
func geocodeAddressDictionary([AnyHashable : Any], completionHandler: (
CLPlacemark]?, (any Error)?) -> Void)
Submits a forward-geocoding request using the specified address dictionary.
func cancelGeocode()
Geocoding an address
Managing geocoding requests


## Page 11

Cancels a pending geocoding request.
var isGeocoding: Bool
A Boolean value indicating whether the receiver is in the middle of geocoding its value.
func geocodeAddressString(String, inRegionCenteredAt: CLLocation
Coordinate2D, inRegionRadius: CLLocationDistance, preferredLocale:
Locale?, completionHandler: ([CLPlacemark]?, (any Error)?) -> Void)
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Converting between coordinates and user-friendly place names
Convert between a latitude and longitude pair and a more user-friendly description of that
location.
Converting a user’s location to a descriptive placemark
Transform the user’s location that displays on a map into an informative textual description b
reverse geocoding.
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Geocoding


## Page 12

class CLPlacemark
A user-friendly description of a geographic coordinate, often containing the name of the
place, its address, and other relevant information.


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


