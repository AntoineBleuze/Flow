# Editing.pdf

## Page 1

class AVComposition
An object that combines and arranges media from multiple assets into a single composite
asset that you can play or process.
class AVCompositionTrack
A track in a composition that presents media of a uniform type.
class AVCompositionTrackSegment
A track segment that maps a time from the source media track to the composition track.
class AVMutableComposition
An object that you use to create a new composition from existing assets.
class AVMutableCompositionTrack
A mutable track in a composition that you use to insert, remove, and scale track segments
without affecting their low-level representation.
Topics
Compositions
Mutable compositions
See Also
AVFoundation / Composite assets
API Collection
Composite assets
Combine tracks and segments of tracks from multiple assets into a composite
asset that you can play or process.


## Page 2

QuickTime movies
Access the contents of a QuickTime movie file, and perform sample-level edits of its media
tracks.
Video effects
Define standard video transition effects, synchronize layer animations with media timing, and
create custom video compositors.
Audio mixing
Define how to mix the audio levels from multiple audio tracks over an asset’s duration.
Editing


## Page 3

class AVMovie
An object that represents an audiovisual container that conforms to the QuickTime movie file
format or a related format like MPEG-4.
class AVMovieTrack
A track in a movie that conforms to the QuickTime or ISO base media file format.
class AVMutableMovie
A mutable object that represents an audiovisual container that conforms to the QuickTime
movie file format or a related format like MPEG-4.
class AVMutableMovieTrack
A mutable track that conforms to the QuickTime or ISO base media file format.
class AVFragmentedMovie
An object that represents a fragmented movie file.
class AVFragmentedMovieTrack
Topics
Movies
Mutable movies
Fragmented movies
AVFoundation / QuickTime movies
API Collection
QuickTime movies
Access the contents of a QuickTime movie file, and perform sample-level edits of
its media tracks.


## Page 4

An object that represents a track in a fragmented movie.
class AVFragmentedMovieMinder
An object that checks whether a fragmented movie appends additional movie fragments.
protocol AVFragmentMinding
A protocol that defines whether an asset supports fragment minding.
class AVSampleCursor
An object that provides information about the media sample at the cursor’s current position.
struct AVSampleCursorSyncInfo
A structure that describes the attributes of media samples to consider when resynchronizing
a decoder.
struct AVSampleCursorDependencyInfo
A value for describing dependencies between a media sample and other media samples in th
same sample sequence.
struct AVSampleCursorAudioDependencyInfo
A structure that describes the independent decodability of audio samples.
struct AVSampleCursorStorageRange
A structure that indicates the offset and length of storage for a media sample or its chunk.
struct AVSampleCursorChunkInfo
A value that provides information about a chunk of media samples.
class AVMediaDataStorage
An object that represents the media sample data storage file.
Sample cursors
Media data storage
See Also
Editing


## Page 5

Composite assets
Combine tracks and segments of tracks from multiple assets into a composite asset that you
can play or process.
Video effects
Define standard video transition effects, synchronize layer animations with media timing, and
create custom video compositors.
Audio mixing
Define how to mix the audio levels from multiple audio tracks over an asset’s duration.


## Page 6

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


## Page 7

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


## Page 8

class AVAudioMix
An object that manages the input parameters for mixing audio tracks.
class AVMutableAudioMix
An object that manages the input parameters for mixing audio tracks.
class AVAudioMixInputParameters
An object that represents the parameters that you apply when adding an audio track to a mix
class AVMutableAudioMixInputParameters
The parameters you use when adding an audio track to a mix.
Composite assets
Combine tracks and segments of tracks from multiple assets into a composite asset that you
can play or process.
Topics
Mixing
See Also
Editing
AVFoundation / Audio mixing
API Collection
Audio mixing
Define how to mix the audio levels from multiple audio tracks over an asset’s
duration.


## Page 9

QuickTime movies
Access the contents of a QuickTime movie file, and perform sample-level edits of its media
tracks.
Video effects
Define standard video transition effects, synchronize layer animations with media timing, and
create custom video compositors.


