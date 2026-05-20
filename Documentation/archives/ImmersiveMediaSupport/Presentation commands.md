# Presentation commands.pdf

## Page 1

These are commands that dictate part of the presentation of the video frames during immersive
media playback. These commands have all the necessary properties like command identifier,
command type, command time in seconds (when it needs to be processed), command duration in
seconds, command offset from the start of the command time (if they are offset based), a flag to
indicate if commands are offset based or not, command argument list, which might carry addition
properties based on the type of the presentation command.
var duration: CMTime
var id: Int
var offset: CMTime?
var time: CMTime
Overview
Topics
Instance Properties
Enumeration Cases
Immersive Media Support / PresentationCommand
Enumeration
PresentationCommand
A set of properties that define the interface for a presentation command.
macOS 26.0+
visionOS 26.0+


## Page 2

case fade(FadeCommand)
A value that represents a command that adds fade-in and fade-out effects during scene
transitions.
case fadeEnvironment(FadeEnvironmentCommand)
A value that represents a command that adds fade-in and fade-out effects to backdrop
transitions.
case setCamera(SetCameraCommand)
A value that represents a command that specifies the camera ID for a specific frame during
playback.
case shotFlop(ShotFlopCommand)
A value that represents a command that mirrors a whole frame horizontally for the duration o
the command.
Decodable
Encodable
Sendable
SendableMetatype
struct FadeCommand
A command type for color fading during immersive media playback.
struct FadeEnvironmentCommand
A command type for opacity fading environment backdrops during immersive media playbac
struct SetCameraCommand
A command type for immersive camera switching during playback.
Relationships
Conforms To
See Also
Presentation commands


## Page 3

struct ShotFlopCommand
A command type to flip the video frames horizontally (mirrored horizontally) during playback
for the duration of the command.
struct PresentationDescriptor
A structure that represents dynamic metadata used during playback or when outputting the
metadata track for an immersive video file.
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.


## Page 4

Color fades are used to either fading in into the video frame from the requested color or fading ou
of the video frame to the requested color. The fade commands are usually used for fading in at th
start of the playback and fading out at the end of the playback. These commands are also used
during immersive camera view switches during the playback.
Fade commands can be absolute time based or offset based. If fade commands are absolute time
based, then property time dictates the time it needs to start executing and keep fading until the
duration property value. On the other hand if they are offset based, then offset property dictates
the fade percentage from the start time of the fade command till the duration of the fade. If the
fade has to start at time 0.0 second of the playback for duration of 1.0 seconds and if the media
FPS is 90, then first frame should be accompanied with presentation metadata with fade comman
which has 0.011 as offset. Second frame should have fade command with offset 0.022 and so on.
For the 90th frame, we should receive offset 1.0.
init(from: any Decoder) throws
Overview
Topics
Initializers
Immersive Media Support / FadeCommand
Structure
FadeCommand
A command type for color fading during immersive media playback.
macOS 26.0+
visionOS 26.0+


## Page 5

init(id: Int, time: CMTime, duration: CMTime, direction: FadeCommand.
FadeDirection, color: simd_float3, offset: CMTime?)
Initializes a color fade command.
var color: simd_float3
The fade color value ranging from 0.0 to 1.0 for each color channel representing RGB colo
space. If the color is set to black, and the direction is in, then it fades from black to the vide
frame.
var direction: FadeCommand.FadeDirection
Fade direction for this command instance.
var duration: CMTime
The duration of the command.
var id: Int
A unique command ID for the entire immersive media file.
var offset: CMTime?
The offset from the start time of this command.
var time: CMTime
The time this command starts during playback.
func encode(to: any Encoder) throws
enum FadeDirection
A value that represents the direction of the fade command.
Instance Properties
Instance Methods
Enumerations
Relationships
Conforms To


## Page 6

Sendable, SendableMetatype
enum PresentationCommand
A set of properties that define the interface for a presentation command.
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
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.
See Also
Presentation commands


## Page 7

Opacity fade is used to apply requested opacity to the AIV environment backdrops. Fade
environment commands can be absolute time based or offset based. If fade commands are
absolute time based, then property time dictates the time it needs to start executing and keep
fading until the duration property value. On the other hand if they are offset based, then offset
property dictates the fade percentage from the start time of the fade command till the duration of
the fade. If the fade has to start at time 0.0 second of the playback for duration of 1.0 seconds an
if the media FPS is 90, then first frame should be accompanied with presentation metadata with
fade command which has 0.011 as offset. Second frame should have fade command with offset
0.022 and so on. For the 90th frame, we should receive offset 1.0.
init(from: any Decoder) throws
Creates a FadeEnvironmentCommand instance from the specified decoder.
init(id: Int, time: CMTime, duration: CMTime, direction: FadeEnvironmen
Command.FadeDirection, opacity: Float, offset: CMTime?)
Overview
Topics
Initializers
Immersive Media Support / FadeEnvironmentCommand
Structure
FadeEnvironmentCommand
A command type for opacity fading environment backdrops during immersive
media playback.
macOS 26.0+
visionOS 26.0+


## Page 8

Creates a fade environment command instance.
var direction: FadeEnvironmentCommand.FadeDirection
Fade direction for this command instance.
var duration: CMTime
The duration of the command - this can be .zero if the command has no duration
var id: Int
A unique command ID for the immersive media file.
var offset: CMTime?
The offset from the start time of this command.
var opacity: Float
The fade opacity value between 0.0 to 1.0. This value represents the target opacity of the
environment backdrops during playback after fading completes.
var time: CMTime
The time this command starts during playback.
func encode(to: any Encoder) throws
Encodes an instance of fade environment command.
enum FadeDirection
A value that represents the direction of the fade environment command.
Instance Properties
Instance Methods
Enumerations
Relationships
Conforms To


## Page 9

Sendable, SendableMetatype
enum PresentationCommand
A set of properties that define the interface for a presentation command.
struct FadeCommand
A command type for color fading during immersive media playback.
struct SetCameraCommand
A command type for immersive camera switching during playback.
struct ShotFlopCommand
A command type to flip the video frames horizontally (mirrored horizontally) during playback
for the duration of the command.
struct PresentationDescriptor
A structure that represents dynamic metadata used during playback or when outputting the
metadata track for an immersive video file.
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.
See Also
Presentation commands


## Page 10

The property cameraID has been added to this type to hold camera identifier string, so that we
can switch from one immersive camera to another using these camera identifiers.
init(from: any Decoder) throws
init(id: Int, time: CMTime, cameraID: String)
Creates a command with a specific ID, cameraID and start time.
var cameraID: String
The camera ID to use for the duration of this command.
var duration: CMTime
The duration of the command.
Overview
Topics
Initializers
Instance Properties
Immersive Media Support / SetCameraCommand
Structure
SetCameraCommand
A command type for immersive camera switching during playback.
macOS 26.0+
visionOS 26.0+


## Page 11

var id: Int
A unique command ID for the entire immersive media file.
var offset: CMTime?
Reserved for later use.
var time: CMTime
The time this command starts during playback.
func encode(to: any Encoder) throws
Sendable, SendableMetatype
enum PresentationCommand
A set of properties that define the interface for a presentation command.
struct FadeCommand
A command type for color fading during immersive media playback.
struct FadeEnvironmentCommand
A command type for opacity fading environment backdrops during immersive media playbac
struct ShotFlopCommand
A command type to flip the video frames horizontally (mirrored horizontally) during playback
for the duration of the command.
struct PresentationDescriptor
Instance Methods
Relationships
Conforms To
See Also
Presentation commands


## Page 12

A structure that represents dynamic metadata used during playback or when outputting the
metadata track for an immersive video file.
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.


## Page 13

init(from: any Decoder) throws
init(id: Int, time: CMTime, duration: CMTime, offset: CMTime?)
Creates a command instance for a certain time, duration and offset.
var duration: CMTime
The duration of the command.
var id: Int
A unique command ID for the immersive media file.
var offset: CMTime?
The offset from the start time of this command.
var time: CMTime
The time this command starts during playback.
Topics
Initializers
Instance Properties
Immersive Media Support / ShotFlopCommand
Structure
ShotFlopCommand
A command type to flip the video frames horizontally (mirrored horizontally) durin
playback for the duration of the command.
macOS 26.0+
visionOS 26.0+


## Page 14

func encode(to: any Encoder) throws
Sendable, SendableMetatype
enum PresentationCommand
A set of properties that define the interface for a presentation command.
struct FadeCommand
A command type for color fading during immersive media playback.
struct FadeEnvironmentCommand
A command type for opacity fading environment backdrops during immersive media playbac
struct SetCameraCommand
A command type for immersive camera switching during playback.
struct PresentationDescriptor
A structure that represents dynamic metadata used during playback or when outputting the
metadata track for an immersive video file.
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.
Instance Methods
Relationships
Conforms To
See Also
Presentation commands


## Page 15

init(commands: [PresentationCommand])
Creates an instance that contains the commands specified in the given array.
init(duration: CMTime?, commands: [PresentationCommand])
Creates an instance that contains the commands specified in the array:
var commands: [PresentationCommand]
An array of presentation commands.
var duration: CMTime?
The total duration of the presentation commands.
Topics
Initializers
Instance Properties
Relationships
Immersive Media Support / PresentationDescriptor
Structure
PresentationDescriptor
A structure that represents dynamic metadata used during playback or when
outputting the metadata track for an immersive video file.
macOS 26.0+
visionOS 26.0+


## Page 16

Sendable, SendableMetatype
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
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.
Conforms To
See Also
Presentation commands


## Page 17

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


## Page 18

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


## Page 19

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


