# 003_SetCameraCommand.pdf

## Page 1

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


## Page 2

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


## Page 3

A structure that represents dynamic metadata used during playback or when outputting the
metadata track for an immersive video file.
class PresentationDescriptorReader
An object that provides the functionality required to understand and process immersive
presentation commands.


