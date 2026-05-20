# 006_PresentationDescriptorReader.pdf

## Page 1

Immersive commands are packed as an array of PresentationCommand objects contained in a
PresentationDescriptor. This object is used during an Immersive Video playback as a sourc
of rendering values its published variables, or the application can pull presentation commands by
time to write an output metadata track.
init(presentationDescriptor: PresentationDescriptor, isSideloaded: Bool
Initializes an instance that contains the specified presentation descriptor.
var cameraID: String?
The current camera ID string of the immersive camera to use when rendering playback for th
PTS specified in the last call to the update method.
Overview
Topics
Initializers
Instance Properties
Immersive Media Support / PresentationDescriptorReader
Class
PresentationDescriptorReader
An object that provides the functionality required to understand and process
immersive presentation commands.
macOS 26.0+
visionOS 26.0+


## Page 2

var colorFade: simd_float3
The current fade color for color fading of the video frames during playback for the PTS
specified in the last call to the update method.
var colorFadeOpacity: Float
The current color fade opacity of the video frames during playback for the PTS specified in
the last call to the update method.
var environmentFadeOpacity: Float
The current opacity of the environment backdrops during playback for the PTS specified in
the last call to the update method.
var isShotFlopped: Bool
A Boolean value that indicates whether to horizontally flip the video frame for the PTS
specified in the last call to the update method.
var isSideloaded: Bool
A Boolean value that indicates whether the reader input is sideloaded or is it set during
playback.
var presentationCommands: [PresentationCommand]
The active presentation commands for the PTS specified in the last call to the update metho
var presentationDescriptor: PresentationDescriptor
The presentation descriptor that contains the presentation commands to process.
func outputPresentationCommands(for: CMTime) -> [PresentationCommand]?
This function returns all presentation commands to be muxed into an MOV during an
AVAssetWriter session. Don’t use this function for playback rendering.
func processPresentationCommands(for: CMTime)
Processes the commands and updates the publishers exported by this reader when called b
the application (e.g. render/playback loop)
Instance Methods
Relationships
Conforms To


## Page 3

Copyable
Observable
Sendable
SendableMetatype
enum PresentationCommand
A set of properties that define the interface for a presentation command.
struct FadeCommand
A command type for color fading during immersive media playback.
struct FadeEnvironmentCommand
A command type for opacity fading environment backdrops during immersive media playbac
struct SetCameraCommand
A command type for immersive camera switching during playback.
struct ShotFlopCommand
A command type to flip the video frames horizontally (mirrored horizontally) during playback
for the duration of the command.
struct PresentationDescriptor
A structure that represents dynamic metadata used during playback or when outputting the
metadata track for an immersive video file.
See Also
Presentation commands


