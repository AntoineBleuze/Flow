# Classes.pdf

## Page 1

init(image: UIImage, showsImageFullHeight: Bool, title: String?,
subtitle: String?, tintColor: UIColor?)
Initialize an element that is constituted of an image, boolean to entirely cover the element wi
the image, title, subtitle and a tint color.
var showsImageFullHeight: Bool
A Boolean value indicating whether the element should be fill with the image.
var subtitle: String?
The subtitle associated with this element.
var tintColor: UIColor?
A UIColor used to tint the element. When @c showsImageFullHeight is true, the tint color is
applied behind the labels at the bottom of the card. Otherwise, this color is part of the
gradient color at the bottom of the card.
var title: String
The title associated with this element.
Topics
Initializers
Instance Properties
CarPlay / CPListImageRowItemCardElement
Class
CPListImageRowItemCardElement
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 2

class var maximumFullHeightImageSize: CGSize
The expected image size for the image in your @c CPListImageRowItemCardElement when
@c showsImageFullHeight is true. Images provided will be resized to this size.
class var maximumImageSize: CGSize
The expected image size for the image in your @c CPListImageRowItemCardElement when
@c showsImageFullHeight is false. Images provided will be resized to this size.
CPListImageRowItemElement
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Type Properties
Relationships
Inherits From
Conforms To


## Page 3

init(image: UIImage, imageShape: CPListImageRowItemCondensedElement.
Shape, title: String, subtitle: String?, accessorySymbolName: String?)
Initialize a list image row condensed element with an image, an image shape, a title, subtitle
and a system symbol name.
var accessorySymbolName: String?
The name of the system symbol image to use as accessory.
var imageShape: CPListImageRowItemCondensedElement.Shape
Shape used to draw the image of the element.
var subtitle: String?
The subtitle associated with this element.
var title: String
The title associated with this element.
Topics
Initializers
Instance Properties
CarPlay / CPListImageRowItemCondensedElement
Class
CPListImageRowItemCondensedElement
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 4

enum Shape
Types of shape used to draw a condensed row element.
CPListImageRowItemElement
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Enumerations
Relationships
Inherits From
Conforms To


## Page 5

var image: UIImage
The image associated with this element.
var isEnabled: Bool
A Boolean value indicating whether the list element is enabled.
class var maximumImageSize: CGSize
The expected image size for the image in your @c CPListImageRowItemElement. Images
provided will be resized to this size.
Topics
Instance Properties
Type Properties
Relationships
Inherits From
CarPlay / CPListImageRowItemElement
Class
CPListImageRowItemElement
Abstract superclass for a a row item element object.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 6

NSObject
CPListImageRowItemCardElement
CPListImageRowItemCondensedElement
CPListImageRowItemGridElement
CPListImageRowItemImageGridElement
CPListImageRowItemRowElement
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
Inherited By
Conforms To


## Page 7

init(image: UIImage)
Initialize an element that is constituted of an image.
CPListImageRowItemElement
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Initializers
Relationships
Inherits From
Conforms To
CarPlay / CPListImageRowItemGridElement
Class
CPListImageRowItemGridElement
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 8

Sendable
SendableMetatype


## Page 9

init(image: UIImage, imageShape: CPListImageRowItemImageGridElement.
Shape, title: String, accessorySymbolName: String?)
Initialize an element that is constituted of an image and an image shape.
var accessorySymbolName: String?
The name of the system symbol image to use as accessory.
var imageShape: CPListImageRowItemImageGridElement.Shape
Shape used to draw the image of the element.
var title: String
The title associated with this element.
enum Shape
Topics
Initializers
Instance Properties
Enumerations
CarPlay / CPListImageRowItemImageGridElement
Class
CPListImageRowItemImageGridElement
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 10

Types of shape used to draw a list item.
CPListImageRowItemElement
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To


## Page 11

init(image: UIImage, title: String?, subtitle: String?)
Initialize an element that is constituted of an image, title and subtitle. Only image is required
while the two others can be omitted.
var subtitle: String?
The subtitle associated with this element.
var title: String?
The title associated with this element.
CPListImageRowItemElement
Topics
Initializers
Instance Properties
Relationships
Inherits From
CarPlay / CPListImageRowItemRowElement
Class
CPListImageRowItemRowElement
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 12

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Conforms To


## Page 13

init(conversationIdentifier: String, unread: Bool)
Initialize a @c CPMessageGridItemConfiguration for use in a @c CPListTemplate.
var conversationIdentifier: String
var isUnread: Bool
NSObject
CVarArg
Topics
Initializers
Instance Properties
Relationships
Inherits From
Conforms To
CarPlay / CPMessageGridItemConfiguration
Class
CPMessageGridItemConfiguration
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 14

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol


## Page 15

class var `default`: CPNowPlayingMode
The default now playing mode. While this mode is active, your app will display now playing
metadata as donated to the shared system now playing info center.
NSObject
CPNowPlayingModeSports
CVarArg
Topics
Type Properties
Relationships
Inherits From
Inherited By
Conforms To
CarPlay / CPNowPlayingMode
Class
CPNowPlayingMode
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 16

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable


## Page 17

init(leftTeam: CPNowPlayingSportsTeam, rightTeam: CPNowPlayingSportsTea
, eventStatus: CPNowPlayingSportsEventStatus?, backgroundArtwork:
UIImage?)
Initialize a sports mode for display on the CarPlay now playing screen.
var backgroundArtwork: UIImage?
A large colorful image for the background of the now playing screen. A gradient or crossfade
image works best, especially when it includes the primary colors of each team. Provide an
image no larger than 500x500.
var eventStatus: CPNowPlayingSportsEventStatus?
A representation of the current event status. See
var leftTeam: CPNowPlayingSportsTeam
Topics
Initializers
Instance Properties
CarPlay / CPNowPlayingModeSports
Class
CPNowPlayingModeSports
The sports mode represents a layout for now playing suited to live-streaming or
recorded playback of a sporting event that features exactly two teams.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 18

The sports team that should appear on the left side of the now playing screen. This is
commonly (but not always) the AWAY or VISITING team. This team will be on the left in all
layouts; it does not flip to the right side when in a right-to-left language or a right-hand-drive
vehicle.
var rightTeam: CPNowPlayingSportsTeam
The sports team that should appear on the right side of the now playing screen. This is
commonly (but not always) the HOME team. This team will be on the right in all layouts; it do
not flip to the left side when in a right-to-left language or a right-hand-drive vehicle.
CPNowPlayingMode
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
Relationships
Inherits From
Conforms To


## Page 19

Or, a representation of the amount of time remaining in the event, or a section of the event
(period/quarter/etc.) for events where the clock counts DOWN.
init(elapsedTime: TimeInterval, paused: Bool)
Represents a duration of time that has elapsed so far in this event, or play period of the even
(quarter/inning/period).
init(timeRemaining: TimeInterval, paused: Bool)
Represents an amount of time remaining in the event, or play period of the event
(quarter/inning/period).
Overview
Topics
Initializers
Instance Properties
CarPlay / CPNowPlayingSportsClock
Class
CPNowPlayingSportsClock
A representation of the amount of time elapsed so far in this event, for events
where the clock counts UP.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 20

var countsUp: Bool
If true, the timer is counting UP, so as to indicate an amount of time elapsed so far in this
event.
var isPaused: Bool
Whether the clock should be paused, e.g. due to a stoppage in play.
var timeValue: TimeInterval
The time value in the clock; either elapsed time or time remaining.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Relationships
Inherits From
Conforms To


## Page 21

init(eventStatusText: [String]?, eventStatusImage: UIImage?, eventClock
CPNowPlayingSportsClock?)
Initialize an event status with optional event status text, an optional event status image, and 
optional event clock.
var eventClock: CPNowPlayingSportsClock?
The event timer, if it applies to this event. See @c CPNowPlayingSportsClock.
var eventStatusImage: UIImage?
An optional event status image for this event, if it applies to this event. For example, a baseb
game could display a representation of the bases and outs, indicating how many bases are
loaded and the number of outs in the current inning.
var eventStatusText: [String]?
Up to three separate strings for event status may be displayed.
Topics
Initializers
Instance Properties
CarPlay / CPNowPlayingSportsEventStatus
Class
CPNowPlayingSportsEventStatus
A representation of the status of a sporting event.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 22

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Relationships
Inherits From
Conforms To


## Page 23

init(name: String, logo: CPNowPlayingSportsTeamLogo, teamStandings:
String?, eventScore: String, possessionIndicator: UIImage?, favorite:
Bool)
Initialize a sports team for display on the now playing screen.
var eventScore: String
The numeric score string for this team in the current event. Depending on the size of the car
screen, a maximum of 3 to 5 characters may be displayed.
var isFavorite: Bool
If true, the team is marked with a star to indicate it has been saved as a user favorite.
var logo: CPNowPlayingSportsTeamLogo
The team logo or, if no logo is available, the initials/abbreviation for this team. See @c
CPNowPlayingSportsTeamLogo.
Topics
Initializers
Instance Properties
CarPlay / CPNowPlayingSportsTeam
Class
CPNowPlayingSportsTeam
A representation of a sports team for the now playing screen, in sports that have
exactly two teams.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 24

var name: String
A localized, user-visible name for this sports team.
var possessionIndicator: UIImage?
An optional indicator used to indicate possession by this team. Only one team should have
possession at a given time.
var teamStandings: String?
An optional additional label displayed near the team name. This could be a win-loss ratio
string, team standings, or other statistics relevant to this team. Depending on the size of the
car screen, a maximum of 15-20 characters may be displayed.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Relationships
Inherits From
Conforms To


## Page 25

init(teamInitials: String)
If no team logo image is available, initialize a team logo with an abbreviation or initialism for
this team.
init(teamLogo: UIImage)
Initialize a team logo with an image representation of this team. Provide an image no larger
than 350x350; larger images will be resized down.
var initials: String?
An abbreviation or initialism for this team, used only if no logo image is available for this team
var logo: UIImage?
A team logo image for this team.
Topics
Initializers
Instance Properties
CarPlay / CPNowPlayingSportsTeamLogo
Class
CPNowPlayingSportsTeamLogo
A logo image or, if no image is available, an abbreviation or initialism for this team.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 26

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Relationships
Inherits From
Conforms To


