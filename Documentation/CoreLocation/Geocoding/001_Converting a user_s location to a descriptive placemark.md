# 001_Converting a user_s location to a descriptive placemark.pdf

## Page 1

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


## Page 2

Important
Geocoding requests are rate-limited for each app. Issue new geocoding requests only when
the user has moved a significant distance and after a reasonable amount of time has passed.
See also
Related Documentation


## Page 3

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


