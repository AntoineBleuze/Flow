# 002_ImmersiveMediaRemotePreviewReceiver.pdf

## Page 1

This object helps applications receiving Immersive Video over the network with the intent of
rendering a preview playback.
To properly render an immersive video preview, the receiver also needs access to:
The current ImmersiveVideoFrame to render.
The current VenueDescriptor for rendering.
The current PresentationDescriptor that describes one or more Presentation
Commandinstances active for the current frame.
init() async throws
Creates a preview receiver object.
Overview
Topics
Initializers
Instance Properties
Immersive Media Support / ImmersiveMediaRemotePreviewReceiver
Class
ImmersiveMediaRemotePreviewReceiver
An observable object that helps apps handle receiving commands and data sent
from an immersive media remote preview sender object.
macOS 26.0+
visionOS 26.0+


## Page 2

var frame: ImmersiveVideoFrame?
The current remote preview of an immersive video frame.
var presentationDescriptor: PresentationDescriptor?
The current remote immersive video presentation descriptor.
var states: some AsyncSequence<ImmersiveMediaRemotePreviewReceiver.
Status, Never>
The states to use for monitoring the current state of the preview receiver so the app can
monitor events.
var venueDescriptor: VenueDescriptor?
The current remote immersive video venue descriptor.
func start(connection: NWConnection) async throws
Performs the necessary steps to start receiving remote Immersive video frames using the
given network connection.
func stop()
Stops receiving remote immersive video frames.
enum Status
A value that represents the status of the immersive media remote preview receiver object.
Copyable
Observable
Sendable
SendableMetatype
Instance Methods
Enumerations
Relationships
Conforms To


