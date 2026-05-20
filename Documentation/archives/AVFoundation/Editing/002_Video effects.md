# 002_Video effects.pdf

## Page 1

class AVVideoCompositionCoreAnimationTool
An object used to incorporate Core Animation into a video composition.
Editing and playing HDR video
Support high-dynamic-range (HDR) video content in your app by using the HDR editing and
playback capabilities of AVFoundation.
Debugging AVFoundation audio mixes, compositions, and video compositions
Resolve common problems when creating compositions, video compositions, and audio
mixes.
class AVVideoComposition
An object that describes how to compose video frames at particular points in time.
class AVVideoCompositionInstruction
An operation that a compositor performs.
class AVVideoCompositionLayerInstruction
An object used to modify the transform, cropping, and opacity ramps applied to a given trac
in a composition.
Topics
Core Animation integration
Built-in video compositing
AVFoundation / Video effects
API Collection
Video effects
Define standard video transition effects, synchronize layer animations with media
timing, and create custom video compositors.


## Page 2

class AVMutableVideoComposition
A mutable video composition subclass.
Deprecated
class AVMutableVideoCompositionInstruction
A mutable video composition instruction subclass.
Deprecated
class AVMutableVideoCompositionLayerInstruction
An object used to modify the transform, cropping, and opacity ramps applied to a given trac
in a mutable composition.
Deprecated
Processing spatial video with a custom video compositor
Create a custom video compositor to edit spatial video for playback and export.
protocol AVVideoCompositing
A protocol that defines the methods custom video compositors must implement.
Composite assets
Combine tracks and segments of tracks from multiple assets into a composite asset that you
can play or process.
QuickTime movies
Access the contents of a QuickTime movie file, and perform sample-level edits of its media
tracks.
Audio mixing
Define how to mix the audio levels from multiple audio tracks over an asset’s duration.
Custom video compositing
See Also
Editing


