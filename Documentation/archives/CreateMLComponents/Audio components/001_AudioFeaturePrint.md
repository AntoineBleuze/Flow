# 001_AudioFeaturePrint.pdf

## Page 1

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


## Page 2

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


