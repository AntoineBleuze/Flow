# Playback arbitration.pdf

## Page 1

This object manages instances of AVRoutingPlaybackParticipant for arbitration of media
playback routing priorities and preferences on restricted playback interfaces. The playback routin
arbiter is responsible for collecting and applying preferences, such as priorities in non-mixable
audio routes and external playback states where the number of allowed players is limited.
var preferredParticipantForExternalPlayback: (any AVRoutingPlayback
Participant)?
The participant that has priority to play on external playback interfaces.
var preferredParticipantForNonMixableAudioRoutes: (any AVRoutingPlaybac
Participant)?
The participant that has priority to play audio when it’s not possible to play multiple audio
sources concurrently.
Overview
Topics
Instance Properties
Type Methods
AVRouting / AVRoutingPlaybackArbiter
Class
AVRoutingPlaybackArbiter
An object that manages playback routing preferences.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
tvOS 26.0+


## Page 2

class func shared() -> AVRoutingPlaybackArbiter
Returns the singleton playback arbiter instance.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol AVRoutingPlaybackParticipant
A protocol for objects that participate in playback routing arbitration.
Relationships
Inherits From
Conforms To
See Also
Playback arbitration


## Page 3

Classes conform to this protocol if they participate in media playback routing arbitration for
managing preferences such as priority on restricted playback routes.
class AVRoutingPlaybackArbiter
An object that manages playback routing preferences.
Overview
See Also
Playback arbitration
AVRouting / AVRoutingPlaybackParticipant
Protocol
AVRoutingPlaybackParticipant
A protocol for objects that participate in playback routing arbitration.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
tvOS 26.0+


