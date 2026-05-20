# Values.pdf

## Page 1

var mMaximum: Float64
The maximum value.
var mMinimum: Float64
The minimum value.
init()
init(mMinimum: Float64, mMaximum: Float64)
Topics
Inspecting a range
Initializers
Relationships
Conforms To
Core Audio Types / AudioValueRange
Structure
AudioValueRange
A structure that represents a continuous range of values.
iOS 2.0+
iPadOS 2.0+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

BitwiseCopyable, Sendable
struct AudioValueTranslation
A structure that stores buffers to use in translation operations.
See Also
Values


## Page 3

init(mInputData: UnsafeMutableRawPointer, mInputDataSize: UInt32, m
OutputData: UnsafeMutableRawPointer, mOutputDataSize: UInt32)
var mInputData: UnsafeMutableRawPointer
The buffer containing the data to be translated.
var mInputDataSize: UInt32
The number of bytes in the buffer pointed at by mInputData.
var mOutputData: UnsafeMutableRawPointer
The buffer to hold the result of the translation.
var mOutputDataSize: UInt32
The number of bytes in the buffer pointed at by mOutputData.
Topics
Initializers
Instance Properties
Core Audio Types / AudioValueTranslation
Structure
AudioValueTranslation
A structure that stores buffers to use in translation operations.
iOS 2.0+
iPadOS 2.0+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 4

BitwiseCopyable
struct AudioValueRange
A structure that represents a continuous range of values.
Relationships
Conforms To
See Also
Values


