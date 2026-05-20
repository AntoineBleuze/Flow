# 000_SpatialAudioExperience.pdf

## Page 1

Anchoring sound to a window or volume
All audio playback APIs support 3D spatial rendering using SpatialAudioExperience. For example,
with AVAudioPlayer:
Mentioned in
Overview
Audio Toolbox / SpatialAudioExperience
Protocol
SpatialAudioExperience
Configure an audio stream for spatial computing.
visionOS 26.0+


## Page 2

See Also
SpatialAudioExperiences.AnchoringStrategy
SpatialAudioExperiences.SoundStageSize
static var automatic: AutomaticSpatialAudio
An automatic spatial experience.
static var bypassed: BypassedSpatialAudio
A bypassed spatial audio experience.
static var fixed: FixedSpatialAudio
A fixed spatial audio experience with an automatic sound stage size.
static var headTracked: HeadTrackedSpatialAudio
A head-tracked spatial audio experience with an automatic anchoring strategy and automati
sound stage size.
static func fixed(soundStageSize: SpatialAudioExperiences.SoundStageSiz
) -> Self
Create a fixed spatial audio experience with a specific sound stage size.
static func headTracked(SpatialAudioExperiences.AnchoringStrategy, soun
StageSize: SpatialAudioExperiences.SoundStageSize) -> Self
Create a head-tracked spatial audio experience with a specific anchoring strategy and sound
stage size.
Topics
Type Properties
Type Methods
Relationships
Inherits From


## Page 3

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
AutomaticSpatialAudio
BypassedSpatialAudio
FixedSpatialAudio
HeadTrackedSpatialAudio
Conforming Types


