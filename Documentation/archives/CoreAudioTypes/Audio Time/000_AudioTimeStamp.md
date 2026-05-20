# 000_AudioTimeStamp.pdf

## Page 1

var mFlags: AudioTimeStampFlags
A set of flags indicating which representations of the time are valid; see Audio Time Stam
Flags and Audio Time Stamp Flag Combination Constant.
var mHostTime: UInt64
The host machine’s time base (see CoreAudio/HostTime.h).
var mRateScalar: Float64
The ratio of actual host ticks per sample frame to the nominal host ticks per sample frame.
var mReserved: UInt32
Pads the structure out to force an even 8-byte alignment.
var mSMPTETime: SMPTETime
The SMPTE time (see SMPTETime).
var mSampleTime: Float64
The absolute sample frame time.
var mWordClockTime: UInt64
Topics
Accessing the Data
Core Audio Types / AudioTimeStamp
Structure
AudioTimeStamp
A structure that represents a timestamp value.
iOS 2.0+
iPadOS 2.0+
macOS 10.0+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

The word clock time.
init()
Creates an empty audio timestamp.
init(mSampleTime: Float64, mHostTime: UInt64, mRateScalar: Float64, m
WordClockTime: UInt64, mSMPTETime: SMPTETime, mFlags: AudioTimeStamp
Flags, mReserved: UInt32)
Creates an audio time stamp.
BitwiseCopyable, Sendable
struct AudioTimeStampFlags
A structure that represents flags for a timestamp.
Initializers
Relationships
Conforms To
See Also
Audio Time


