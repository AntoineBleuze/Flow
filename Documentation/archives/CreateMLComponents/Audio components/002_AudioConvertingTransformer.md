# 002_AudioConvertingTransformer.pdf

## Page 1

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


## Page 2

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


