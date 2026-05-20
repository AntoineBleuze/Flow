# 001_FadeCommand.pdf

## Page 1

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


## Page 2

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


## Page 3

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


