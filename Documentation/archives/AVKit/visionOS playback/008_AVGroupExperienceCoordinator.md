# 008_AVGroupExperienceCoordinator.pdf

## Page 1

Access an experience coordinator by querying a player view controller for its groupExperience
Coordinator object.
func coordinateWithSession<T>(GroupSession<T>)
Begins coordinating viewing environment state with a group session.
NSObject
Overview
Topics
Coordinating state changes
Relationships
Inherits From
AVKit / AVGroupExperienceCoordinator
Class
AVGroupExperienceCoordinator
An object that synchronizes viewing environment state across participants in a
SharePlay session.
visionOS 1.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Playing immersive media with AVKit
Adopt the system playback interface to provide an immersive video watching experience.
Creating a multiview video playback experience in visionOS
Build an interface that plays multiple videos simultaneously and handles transitions to
different experience types gracefully.
Adopting the system player interface in visionOS
Provide an optimized viewing experience for watching 3D video content.
Trimming and exporting media in visionOS
Display standard controls in your app to edit the timeline of the currently playing media.
class AVPlayerViewController
A view controller that displays content from a player and presents a native user interface to
control playback.
protocol AVPlayerViewControllerDelegate
A protocol that defines the methods to implement to respond to player view controller event
class AVExperienceController
An object that controls video experiences.
class AVMultiviewManager
An object that manages viewing multiple videos at once.
Conforms To
See Also
visionOS playback


## Page 3



