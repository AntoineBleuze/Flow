# 004_ShotFlopCommand.pdf

## Page 1

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


## Page 2

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


