# 000_CPPointOfInterestTemplate.pdf

## Page 1

The Point of Interest template displays selectable instances of CPPointOfInterest as
annotations on the template’s map, and as items in a scrollable picker that the template overlays o
the map. When the user selects a point of interest, the template displays a detail card that contain
secondary information and optional actions the user can perform. The template manages
clustering points of interest, selecting a point of interest, and zooming and panning the map.
To create a Point of Interest template, you call the init(title:pointsOfInterest:
selectedIndex:) method and provide an array of CPPointOfInterest objects to display in
the template’s map. Then call your interface controller’s pushTemplate(_:animated:
completion:) method to push it onto the navigation hierarchy, or add the template as a tab in
your CPTabBarTemplate.
You must create an object that implements the CPPointOfInterestTemplateDelegate
protocol and set it as the template’s delegate using the pointOfInterestDelegate property.
The template informs its delegate about changes to the map’s visible region so you can update th
points of interest the map displays.
Overview
Topics
Creating a Point of Interest Template
CarPlay / CPPointOfInterestTemplate
Class
CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 2

init(title: String, pointsOfInterest: [CPPointOfInterest], selectedInde
: Int)
Creates a Point of Interest template with a title, the points of interest to display, and the initia
selection’s index.
class CPPointOfInterest
An object that describes a point of interest on the template’s map and in its scrollable picker
var pointOfInterestDelegate: (any CPPointOfInterestTemplateDelegate)?
The object that serves as the template’s delegate.
protocol CPPointOfInterestTemplateDelegate
The methods to handle a Point of Interest template’s events.
var title: String
The scrollable picker’s title.
var pointsOfInterest: [CPPointOfInterest]
The points of interest the template displays on the map and in the scrollable picker.
func setPointsOfInterest([CPPointOfInterest], selectedIndex: Int)
Updates the points of interest and the current selection.
var selectedIndex: Int
The current selection’s index.
CPTemplate
Handling Template Events
Managing the Picker’s Title
Managing the Points of Interest
Relationships
Inherits From


## Page 3

CPBarButtonProviding
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CPInformationTemplate
A template that provides information for a point of interest, food order, parking location, or
charging location.
class CPTextButton
A button that displays a stylized title.
Integrating CarPlay with your quick-ordering app
Configure your food-ordering app to work with CarPlay.
Conforms To
See Also
Location and Information


