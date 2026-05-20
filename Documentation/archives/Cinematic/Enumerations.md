# Enumerations.pdf

## Page 1

Enum used to generate settings dictionary for export using AssetReader and AssetWriter with
Spatial Audio effects burned in
case spatial
Export settings to generate an asset with spatial audio and effect burned in
case stereo
Export settings to generate an asset with stereo audio and effect burned in
init?(rawValue: Int)
Overview
Topics
Enumeration Cases
Initializers
Relationships
Cinematic / CNSpatialAudioContentType
Enumeration
CNSpatialAudioContentType
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+


## Page 2

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Conforms To


## Page 3

Standard rendering styles for Audio Mix type effects
case cinematic
Isolates the ambience and place it in a spatial stem. Isolates all voices and place them in a
mono stem.
case cinematicBackgroundStem
Isolates the ambience when foreground is cinematic Audio Mix and place it in a spatial stem.
There is no voice stem.
case cinematicForegroundStem
Isolates all voices and places them in a mono stem. There is no ambience stem.
case inFrame
Isolates the ambience and place it in a spatial stem. Isolates only voices from the camera fie
of view and place them in a mono stem.
Overview
Topics
Enumeration Cases
Cinematic / CNSpatialAudioRenderingStyle
Enumeration
CNSpatialAudioRenderingStyle
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+


## Page 4

case inFrameBackgroundStem
Isolates the ambience and foreground that is out of frame and place it in a spatial stem. Ther
is no voice stem.
case inFrameForegroundStem
Isolates only voices from the camera field of view and place them in a mono stem. There is n
ambience stem.
case standard
This produces a spatial stem of the original recording that is unprocessed. This is the defaul
rendering style.
case studio
Isolates the ambience and place it in a spatial stem. Isolates all voices, add a studio/proximity
effect in the voice track and place them in a mono stem.
case studioBackgroundStem
Isolates the ambience when foreground is studio Audio Mix and place it in a spatial stem.
There is no voice stem.
case studioForegroundStem
Isolates all voices, add a studio/proximity effect in the voice track and place them in a mono
stem. There is no ambience stem.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Initializers
Relationships
Conforms To


