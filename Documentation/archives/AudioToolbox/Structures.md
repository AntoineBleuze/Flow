# Structures.pdf

## Page 1

Sounds with an automatic spatial audio experience that belong to an AVAudioSession inherit it
intendedSpatialExperience.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
SpatialAudioExperience
Overview
Relationships
Conforms To
Audio Toolbox / AutomaticSpatialAudio
Structure
AutomaticSpatialAudio
A spatial audio experience determined by the system.
visionOS 26.0+


## Page 2

Audio Toolbox / BypassedSpatialAudio
Structure
BypassedSpatialAudio
An experience in which the system does not apply spatial processing to the audio
stream.
visionOS 26.0+


## Page 3

Use this if implementing your own spatial audio rendering or designing an experience that should
not have spatial audio.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
SpatialAudioExperience
Overview
Relationships
Conforms To


## Page 4

The lack of spatial tracking gives the impression of a “fixed” spatial experience locked to the user
frame of reference.
For multi-channel experiences, you might also consider specifying the experience’s sound stage
size if a system-specified size is not desirable.
var soundStageSize: SpatialAudioExperiences.SoundStageSize
Overview
Topics
Instance Properties
Audio Toolbox / FixedSpatialAudio
Structure
FixedSpatialAudio
A spatial experience that does not take user motion into account.
visionOS 26.0+


## Page 5

The experience’s sound stage size.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
SpatialAudioExperience
Relationships
Conforms To


## Page 6

Anchoring sound to a window or volume
Sounds with a head-tracked experience come from a distinct location in space as defined by thei
anchoring strategy.
For multi-channel experiences, you might also consider specifying the experience’s sound stage
size if a system-specified size is not desirable.
Mentioned in
Overview
Topics
Audio Toolbox / HeadTrackedSpatialAudio
Structure
HeadTrackedSpatialAudio
A spatial experience that takes user motion into account.
visionOS 26.0+


## Page 7

var anchoringStrategy: SpatialAudioExperiences.AnchoringStrategy
The experience’s anchoring strategy.
var soundStageSize: SpatialAudioExperiences.SoundStageSize
The experience’s sound stage size.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
SpatialAudioExperience
Instance Properties
Relationships
Conforms To


