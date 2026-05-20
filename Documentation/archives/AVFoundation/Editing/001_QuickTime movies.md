# 001_QuickTime movies.pdf

## Page 1

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


## Page 2

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


## Page 3

Composite assets
Combine tracks and segments of tracks from multiple assets into a composite asset that you
can play or process.
Video effects
Define standard video transition effects, synchronize layer animations with media timing, and
create custom video compositors.
Audio mixing
Define how to mix the audio levels from multiple audio tracks over an asset’s duration.


