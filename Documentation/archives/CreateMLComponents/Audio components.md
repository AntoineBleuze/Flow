# Audio components.pdf

## Page 1

init(configuration: AudioReader.Configuration)
Creates an audio reader.
var configuration: AudioReader.Configuration
The audio reader configuration
struct AsyncBuffers
An async sequence of audio buffers read from an audio file.
struct Configuration
The configuration of the audio reader.
struct MicrophoneAsyncBuffers
An async sequence of audio frames.
Topics
Creating an audio reader
Getting the properties
Managing buffers
Create ML Components / AudioReader
Structure
AudioReader
An audio file reader.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

static func read(contentsOf: URL, configuration: AudioReader.
Configuration) throws -> AudioReader.AsyncBuffers
Reads an audio file as an async sequence of audio buffers.
static read(_:configuration:)
Reads a sequence of annotated files as a lazy sequence of results each containing an audio
buffers or an error.
static func readMicrophone(configuration: AudioReader.Configuration)
async throws -> AudioReader.MicrophoneAsyncBuffers
Reads an async sequence of audio frames captured with a microphone.
func applied(to: URL, eventHandler: EventHandler?) throws -> AudioReade
.AsyncBuffers
Reads an audio file as an async sequence of audio buffers.
Sendable, SendableMetatype, Transformer
struct AudioFeaturePrint
A stream transformer that extracts audio features from audio buffers.
struct AudioConvertingTransformer
Reading audio
Applying
Relationships
Conforms To
See Also
Audio components


## Page 3

A transformer for audio conversion.


## Page 4

init(windowDuration: TimeInterval, overlapFactor: Double)
Creates an audio feature print feature extractor.
let overlapFactor: Double
The overlap factor of the extractor.
let windowDuration: TimeInterval
The window duration of the extractor.
func applied<S>(to: S, eventHandler: EventHandler?) throws -> Audio
FeaturePrint.FeatureSequence
Extracts audio features from an a sequence of audio buffers
struct FeatureSequence
Topics
Creating a transformer
Getting the properties
Performing the transformation
Create ML Components / AudioFeaturePrint
Structure
AudioFeaturePrint
A stream transformer that extracts audio features from audio buffers.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 5

An async sequence of audio buffers.
Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
TemporalTransformer
struct AudioReader
An audio file reader.
struct AudioConvertingTransformer
A transformer for audio conversion.
Relationships
Conforms To
See Also
Audio components


## Page 6

init(targetFormat: AVAudioFormat)
Creates an audio conversion transformer to convert the format of the buffers.
let targetFormat: AVAudioFormat
The target audio format for the output buffers. It must have an AVAudioPCMFormat as its
common format type.
func applied(to: AVAudioPCMBuffer, eventHandler: EventHandler?) throws 
> AVAudioPCMBuffer
Performs conversion of the input audio buffer.
Topics
Creating the transformer
Getting the properties
Applying the transformer
Relationships
Create ML Components / AudioConvertingTransformer
Structure
AudioConvertingTransformer
A transformer for audio conversion.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 7

Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
Transformer
struct AudioReader
An audio file reader.
struct AudioFeaturePrint
A stream transformer that extracts audio features from audio buffers.
Conforms To
See Also
Audio components


