# 001_init_representations_commonName_supportingRepresentations__.pdf

## Page 1

representations
A list of ways to reference the place using common mapping concepts.
commonName
Publicly known name of the area or place of interest, such as “City Hall”, “Times Square”, or
“The New York Public Library”.
supportingRepresentations
List of ways to represent a place that are proprietary or non-uniform, such as a dictionary of
mapping service identifiers and their related place identifiers.
Parameters
Discussion
GeoToolbox / PlaceDescriptor / init(representations:commonName:supportingRepresentations:)
Initializer
init(representations:commonName:
supportingRepresentations:)
Creates a place descriptor, suitable for use when searching or retrieving rich data
about a place.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

The representations property needs to have at least one member. Sort arrays with original or
most accurate representations first.
init?(item: MKMapItem)
Creates a place descriptor from a map item.
See Also
Creating a place descriptor


