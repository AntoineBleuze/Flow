# 000_BEAudioSession.pdf

## Page 1

init(audioSession: AVAudioSession)
Creates a BE audio session from an AV audio session
var availableOutputs: [AVAudioSessionPortDescription]?
Gets the set of output ports that are available for routing.
var preferredOutput: AVAudioSessionPortDescription?
Get the preferred output port. Will be nil if no preference has been set.
func setPreferredOutput(AVAudioSessionPortDescription?) throws
Topics
Initializers
Instance Properties
Instance Methods
Relationships
BrowserEngineCore / BEAudioSession
Class
BEAudioSession
An object that represents an audio session
iOS 26.0+
iPadOS 26.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


