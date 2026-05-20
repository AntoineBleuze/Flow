# 000_PresentationCommand.pdf

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


