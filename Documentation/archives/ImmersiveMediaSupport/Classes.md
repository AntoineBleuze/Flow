# Classes.pdf

## Page 1

This class is associated with the calibration type ‘usdzMesh’ and is used for calibration performed
by camera lens provider using usdz.
init(name: String, usdzData: Data)
Creates an instance of ImmersiveCameraMeshCalibration.
let name: String
let usdzData: Data
Overview
Topics
Initializers
Instance Properties
Relationships
Immersive Media Support / ImmersiveCameraMeshCalibration
Class
ImmersiveCameraMeshCalibration
Calibration mesh geometry based on USDZ data.
macOS 26.0+
visionOS 26.0+


## Page 2

Decodable
Encodable
Sendable
SendableMetatype
Conforms To


## Page 3

An image file containing the alpha values is used to generate the image mask.
init(name: String, maskData: Data?)
init(name: String, maskURL: URL)
let maskData: Data?
let name: String
Overview
Topics
Initializers
Instance Properties
Relationships
Immersive Media Support / ImmersiveImageMask
Class
ImmersiveImageMask
An object that holds all the information needed to load immersive media masks
from image data or from a file.
macOS 26.0+
visionOS 26.0+


## Page 4

Decodable
Encodable
Sendable
SendableMetatype
Conforms To


## Page 5

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


## Page 6

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


## Page 7

The apps have to implement the protocol ImmersiveMediaPreviewMessagingProtocol so
that messages exchanged between sender and receivers are in the correct format for processing
The apps need to provide this as custom protocol when establishing the network connection
between the sender and the receivers.
It’s also important to configure the NWParameters to be secure by adding TLS security options as
the example below.
Overview
Immersive Media Support / ImmersiveMediaRemotePreviewSender
Class
ImmersiveMediaRemotePreviewSender
An observable object that helps an app send the required data to all connected
receiver apps to help facilitate the complete preview of the immersive media
playback.
macOS 26.0+


## Page 8

init(networkParameters: NWParameters?) async throws
Creates a preview sender using the specified network parameters, if any.
var connectedReceiverNames: [String]
An array with the names of all receives currently receiving data from this instance. When a
receiver goes offline, this array will be automatically updated.
var isReadyToSendData: Bool
A Boolean value that indicates whether this preview sender is ready to send data.
var preferredFrameRate: Int
The preferred frame rate to use when sending and previewing frames. This is optional; a valu
of -1 enables the system to decide the best framerate based on network quality.
var preferredVideoHeight: Int
The preferred video height to be used when sending and previewing frames. This is optional
value of -1 enables the system to decide the best resolution.
var preferredVideoWidth: Int
The preferred video width to use when sending and previewing frames. This is optional; a
value of -1 enables the system to decide the best resolution.
func connectReceiver(name: String, endpoint: NWEndpoint) async throws
Adds an ImmersiveMediaRemotePreviewReceiver to the sender as an active
participant of the network preview. Any updates on the sender will be propagated to all activ
Topics
Initializers
Instance Properties
Instance Methods


## Page 9

receivers (frames, camera information, static metadata).
func disconnectReceiver(name: String) async
Disconnects a specific remote preview receiver associated with the name provided when
connectReceiver(name:endpoint:) was called.
func send(audioBuffer: CMSampleBuffer) async throws
Sends an audio frame to all connected receivers.
func send(taggedBuffers: [CMTaggedBuffer], presentationTimeStamp: CMTim
, frameDuration: CMTime) async throws
Sends a video frame to all the connected receivers using its tagged buffers representation.
func send(venueDescriptor: VenueDescriptor) async throws
Sends a venue descriptor to all connected receivers.
func send(videoBuffer: CMSampleBuffer) async throws
Sends the video frame to the receivers.
func send(videoFrame: ImmersiveVideoFrame, presentationTimeStamp: CMTim
, frameDuration: CMTime, metadata: [PresentationCommand]) async throws
Sends a video frame to all the connected receivers using its sample buffer representation.
func sendVenueDescriptor(at: URL) async throws
Sends an AIME to all connected receivers.
func start() async
Starts the sender.
func stop() async
Stops the sender - all current connected receivers will be disconnected and streaming will
stop.
Copyable
Observable
Sendable
Relationships
Conforms To


## Page 10

SendableMetatype


