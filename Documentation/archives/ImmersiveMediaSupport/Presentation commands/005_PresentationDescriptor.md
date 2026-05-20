# 005_PresentationDescriptor.pdf

## Page 1

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


## Page 2

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


