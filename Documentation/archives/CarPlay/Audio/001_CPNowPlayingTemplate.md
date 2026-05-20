# 001_CPNowPlayingTemplate.pdf

## Page 1

The Now Playing template displays information from MPNowPlayingInfoCenter and MPNow
PlayingSession. Instead of instantiating your own Now Playing template, CarPlay provides a
shared instance that you configure. The template displays a series of playback control buttons, as
well as information about the current album and artist, and what’s coming up next.
When enabling your Now Playing template’s Album-Artist and Up Next buttons, you must create a
object that implements the CPNowPlayingTemplateObserver protocol and register it as an
observer by calling the template’s add(_:) method.
To display the Now Playing template, call your interface controller’s pushTemplate(_:
animated:completion:) method to push it onto your navigation hierarchy. You can’t display
the Now Playing template modally.
When CarPlay presents Now Playing information for your app, it uses the shared instance of this
template.
Note
CPNowPlayingTemplate is only available in apps with the audio entitlement.
Overview
CarPlay / CPNowPlayingTemplate
Class
CPNowPlayingTemplate
A shared system template that displays Now Playing information.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 2

class var shared: CPNowPlayingTemplate
The Now Playing template the system provides.
var nowPlayingButtons: [CPNowPlayingButton]
The Now Playing template’s playback control buttons.
func updateNowPlayingButtons([CPNowPlayingButton])
Updates the playback control buttons the template displays.
class CPNowPlayingButton
The abstract base class that Now Playing template buttons use.
class CPNowPlayingImageButton
A button that displays an image.
class CPNowPlayingAddToLibraryButton
A button for adding the current playing item to a collection.
class CPNowPlayingMoreButton
A button for presenting more options to the user.
class CPNowPlayingPlaybackRateButton
A button for cycling through the available playback rates.
class CPNowPlayingRepeatButton
A button for cycling through the available repeat modes.
class CPNowPlayingShuffleButton
A button for cycling through the available shuffle modes.
var isAlbumArtistButtonEnabled: Bool
A Boolean value that indicates whether the album and artist string is a button.
Topics
Managing the Shared Template
Managing the Template’s Buttons
Managing Albums, Artists, and Up Next


## Page 3

var isUpNextButtonEnabled: Bool
A Boolean value that manages the display of the Up Next button.
var upNextTitle: String
The title for the Up Next button.
func add(any CPNowPlayingTemplateObserver)
Registers an observer that receives Now Playing template events.
func remove(any CPNowPlayingTemplateObserver)
Removes an observer from receiving Now Playing template events.
protocol CPNowPlayingTemplateObserver
The methods for responding to the user interacting with the Now Playing template.
var nowPlayingMode: CPNowPlayingMode?
The currently-active now playing mode. See @c CPNowPlayingMode.
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Observing Now Playing Events
Instance Properties
Relationships
Inherits From
Conforms To


## Page 4

SendableMetatype
Integrating CarPlay with Your Music App
Configure your music app to work with CarPlay by displaying a custom UI.
See Also
Audio


