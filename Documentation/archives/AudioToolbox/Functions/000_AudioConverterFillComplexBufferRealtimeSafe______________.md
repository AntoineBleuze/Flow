# 000_AudioConverterFillComplexBufferRealtimeSafe______________.pdf

## Page 1

Identical to AudioConverterFillComplexBuffer, with the addition of a realtime-safety guarantee.
Conversions involving only PCM formats – interleaving, deinterleaving, channel count changes,
sample rate conversions – are realtime-safe. Such conversions may use this API in order to obtain
compiler checks involving the CA_REALTIME_API attributes.
At runtime, this function returns kAudioConverterErr_OperationNotSupported if the
conversion requires non-realtime-safe functionality.
Discussion
Audio Toolbox / AudioConverterFillComplexBufferRealtimeSafe(_:_:_:_:_:_:)
Function
AudioConverterFillComplexBuffer
RealtimeSafe(_:_:_:_:_:_:)
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


