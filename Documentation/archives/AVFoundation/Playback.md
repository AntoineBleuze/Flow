# Playback.pdf

## Page 1

You use a player to manage the playback and timing of a media asset, for example starting and
stopping playback, and seeking to a particular time. A player manages the playback of a single
media asset at a time. The framework also provides a queue player that queues media assets to
play sequentially.
Note
When you use AVFoundation, Apple may collect metrics to help improve the framework.
You create an instance of AVPlayerItem to play a media asset. A player item manages the timin
and presentation state of an asset played by the player. A player item also contains player item
tracks that correspond to the tracks in the asset. You direct the output of a player to a specialized
Core Animation layer, a player layer, or a synchronized layer.
Important
You must call the VTRegisterProfessionalVideoWorkflowVideoDecoders()
function if your app requires Afterburner accelerated playback and decoding of ProRes and
ProRes RAW video files.
Overview
Topics
AVFoundation / Media playback
API Collection
Media playback
Manage the playback of media assets and interstitial content, independent of how
you present that content in your interface.


## Page 2

Configuring your app for media playback
Configure apps to enable standard media playback behavior.
Observing playback state in SwiftUI
Keep your user interface in sync with state changes from playback objects.
Controlling the transport behavior of a player
Play, pause, and seek through a media presentation.
Creating a seamless multiview playback experience
Build advanced multiview playback experiences with the AVFoundation and AVRouting
frameworks.
class AVPlayer
An object that provides the interface to control the player’s transport behavior.
class AVPlayerItem
An object that models the timing and presentation state of an asset during playback.
class AVPlayerItemTrack
An object that represents the presentation state of an asset track during playback.
class AVQueuePlayer
An object that plays a sequence of player items.
class AVPlayerLooper
An object that loops media content using a queue player.
Destination Video
Leverage SwiftUI to build an immersive media experience in a multiplatform app.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
class AVPlaybackCoordinator
Essentials
Playback control
SharePlay


## Page 3

An object that coordinates the playback of players in a connected group.
class AVPlayerPlaybackCoordinator
A playback coordinator subclass that coordinates the playback of player objects in a
connected group.
class AVDelegatingPlaybackCoordinator
A playback coordinator subclass that coordinates the playback of custom player objects in a
connected group.
class AVPlaybackCoordinationMedium
Monitoring playback progress in your app
Observe the playback of a media asset to update your app’s user-interface state.
Using HEVC video with alpha
Play, write, and export HEVC video with an alpha channel to add overlay effects to your video
processing.
class AVPlayerLayer
An object that presents the visual contents of a player object.
class AVSynchronizedLayer
A Core Animation layer that derives its timing from a player item so that you can synchronize
layer animations with media playback.
Selecting subtitles and alternative audio tracks
Extend your app’s appeal to users by adding subtitles and alternative audio tracks in their
native language.
class AVMediaSelection
An object that represents a complete rendition of media selection options on an asset.
class AVMediaSelectionGroup
An object that represents a collection of mutually exclusive options for the presentation of
media within an asset.
class AVMediaSelectionOption
Presentation
Media selection


## Page 4

An object that represents a specific option for the presentation of media within a group of
options.
class AVMutableMediaSelection
A mutable object that represents a complete rendition of media selection options on an asse
class AVPlayerMediaSelectionCriteria
An object that specifies the preferred languages and media characteristics for a player.
class AVCustomMediaSelectionScheme
For content that has been authored with the express intent of offering an alternative selectio
interface for AVMediaSelectionOptions, AVCustomMediaSelectionScheme provides a
collection of custom settings for controlling the presentation of the media.
class AVMediaPresentationSelector
For content that has been authored with the express intent of offering an alternative selectio
interface for AVMediaSelectionOptions, AVMediaPresentationSelector represents a collectio
of mutually exclusive settings.
class AVMediaPresentationSetting
For content that has been authored with the express intent of offering an alternative selectio
interface for AVMediaSelectionOptions, AVMediaPresentationSetting represents a selectable
setting for controlling the presentation of the media.
Providing an integrated view of your timeline when playing HLS interstitials
Go beyond simple ad insertion with point and fill occupancy HLS interstitials.
class AVPlayerInterstitialEvent
An object that provides instructions for how a player presents interstitial content.
class AVPlayerInterstitialEventController
An object that schedules interstitial events for items played by the primary player.
class AVPlayerInterstitialEventMonitor
An object that monitors the scheduling and progress of interstitial events.
class AVPlayerItemIntegratedTimeline
An object that models the timeline and playback sequence of a primary player item and
scheduled interstitial events.
Interstitials


## Page 5

struct AVMetrics
An asynchronous stream of metric information.
struct AVMergedMetrics
An asynchronous stream of metric information from different publishers.
class AVVideoPerformanceMetrics
An object that provides metrics related to video playback quality.
protocol AVMetricEventStreamPublisher
A type for objects that publish metric events to the event stream.
class AVMetricEvent
A base class that represents a metric event.
class AVMetricErrorEvent
An object that represents a metric event when an error occurs.
Metric event types
Supporting remote interactions in tvOS
Set up your app to support remote commands and events in a variety of scenarios by using
the relevant approach.
Presenting chapter markers
Add chapter markers to enable users to quickly navigate your content.
class AVMetadataGroup
A collection of metadata items associated with a timeline segment.
class AVTimedMetadataGroup
A collection of metadata items that are valid for use during a specific time range.
class AVMutableTimedMetadataGroup
A mutable collection of metadata items that are valid for use during a specific time range.
Metrics
Remote controls
Timed metadata


## Page 6

class AVDateRangeMetadataGroup
A collection of metadata items that are valid for use within a specific date range.
class AVMutableDateRangeMetadataGroup
A mutable collection of metadata items that are valid for use within a specific range of dates
class AVPlayerItemMediaDataCollector
The abstract base for media data collectors.
class AVPlayerItemMetadataCollector
An object used to capture the date range metadata defined for an HTTP Live Streaming asse
class AVPlayerVideoOutput
An object that receives video data from a player object.
class AVVideoOutputSpecification
An object that specifies the pixel buffer attributes and tag collections handled by a player
video output.
class AVPlayerItemOutput
An abstract class that defines the common interface to output media data from a player item
class AVPlayerItemVideoOutput
An object that outputs video frames from a player item.
class AVPlayerItemLegibleOutput
An object that vends attributed strings for media with a legible characteristic.
class AVPlayerItemRenderedLegibleOutput
A player item output that vends media with a legible characteristic as rendered pixel buffers.
class AVRenderedCaptionImage
An object that provides a rendered pixel buffer and its position in pixels.
class AVPlayerItemMetadataOutput
An object that vends collections of metadata items that a player item’s tracks carry.
protocol AVPlayerItemOutputPushDelegate
A protocol that defines the methods to implement to respond to changes in the media data
sequence.
Media output


## Page 7

class AVAssetPlaybackAssistant
An object that provides playback information for an asset.
struct AVAssetPlaybackConfigurationOption
A structure that defines playback configuration options for an asset.
Offline playback and storage
Download streamed content to disk to allow offline playback, and define policies to
automatically remove downloaded assets.
Streaming and AirPlay
Stream content wirelessly to other devices using AirPlay, and handle requests involving
FairPlay-protected assets.
Sample buffer playback
Create custom controllers to play and synchronize the timing of sample buffer streams.
Utilities
See Also
Playback


## Page 8

Using AVFoundation to play and persist HTTP live streams
Play HTTP Live Streams and persist streams on disk for offline playback using AVFoundation
class AVAssetDownloadURLSession
A URL session that creates and executes asset download tasks.
class AVAssetDownloadTask
A session used to download HTTP Live Streaming assets.
class AVAggregateAssetDownloadTask
A task that downloads multiple media selections for an asset.
class AVAssetDownloadStorageManager
An object that manages policies to automatically purge downloaded assets.
class AVAssetDownloadStorageManagementPolicy
An object that defines a policy to automatically manage the storage of downloaded assets.
class AVMutableAssetDownloadStorageManagementPolicy
A mutable object that you use to create a new storage management policy.
Topics
Asset downloading
Offline storage management
AVFoundation / Offline playback and storage
API Collection
Offline playback and storage
Download streamed content to disk to allow offline playback, and define policies t
automatically remove downloaded assets.


## Page 9

class AVAssetCache
An object that you use to inspect locally cached media data.
Media playback
Manage the playback of media assets and interstitial content, independent of how you prese
that content in your interface.
Streaming and AirPlay
Stream content wirelessly to other devices using AirPlay, and handle requests involving
FairPlay-protected assets.
Sample buffer playback
Create custom controllers to play and synchronize the timing of sample buffer streams.
Cache monitoring
See Also
Playback


## Page 10

Supporting AirPlay in your app
Set up your app to use AirPlay to send content wirelessly.
class AVRouteDetector
An object that detects available media playback routes.
Implementing simple enhanced buffering for your content
Configure your app for simple enhanced buffering to stream content faster to AirPlay-enable
devices and supported CarPlay vehicles.
Implementing flexible enhanced buffering for your content
Configure your app for flexible enhanced buffering to stream content faster to AirPlay-enabl
devices and supported CarPlay vehicles.
Integrating AirPlay for long-form video apps
Integrate AirPlay features and implement a dedicated external playback experience by
preparing the routing system for long-form video playback.
Topics
Essentials
Route selection
Buffered playback
AVFoundation / Streaming and AirPlay
API Collection
Streaming and AirPlay
Stream content wirelessly to other devices using AirPlay, and handle requests
involving FairPlay-protected assets.


## Page 11

class AVAssetResourceLoader
An object that mediates resource requests from a URL asset.
protocol AVAssetResourceLoaderDelegate
Methods you can implement to handle resource-loading requests coming from a URL asset.
class AVAssetResourceLoadingRequest
An object that encapsulates information about a resource request from a resource loader
object.
class AVAssetResourceRenewalRequest
An object that encapsulates information about a resource request from a resource loader to
renew a previously issued request.
class AVAssetResourceLoadingRequestor
An object that contains information about the originator of a resource-loading request.
class AVAssetResourceLoadingDataRequest
An object for requesting data from a resource that an asset resource-loading request
references.
class AVAssetResourceLoadingContentInformationRequest
A query for retrieving essential information about a resource that an asset resource-loading
request references.
class AVContentKeySession
An object that creates and tracks decryption keys for media data.
protocol AVContentKeySessionDelegate
A protocol that handles content key requests.
class AVContentKey
An object that represents the content key decryptor.
class AVContentKeySpecifier
An object that uniquely identifies a content key.
Resource loading
FairPlay streaming


## Page 12

class AVContentKeyRequest
An object that encapsulates information about a content decryption key request issued from
content key session object.
class AVPersistableContentKeyRequest
An object that encapsulates information about a persistable content decryption key request
issued from a content key session.
class AVContentKeyResponse
An object that encapsulates information about a response to a content decryption key
request.
enum AVExternalContentProtectionStatus
Constants that specify whether sufficient protection exists to display the content.
func AVSampleBufferAttachContentKey(CMSampleBuffer, AVContentKey,
NSErrorPointer) -> Bool
Attaches a content key to a sample buffer for the purpose of content decryption.
Media playback
Manage the playback of media assets and interstitial content, independent of how you prese
that content in your interface.
Offline playback and storage
Download streamed content to disk to allow offline playback, and define policies to
automatically remove downloaded assets.
Sample buffer playback
Create custom controllers to play and synchronize the timing of sample buffer streams.
See Also
Playback


## Page 13

Playing custom audio with your own player
Construct an audio player to play your custom audio data, and optionally take advantage of
the advanced features of AirPlay 2.
class AVSampleBufferRequest
An object that describes a sample buffer creation request.
class AVSampleBufferGenerator
An object that creates sample buffers.
class AVSampleBufferGeneratorBatch
An object that generates sample buffers in a batch.
protocol AVQueuedSampleBufferRendering
Methods you can implement to enqueue sample buffers for presentation.
class AVSampleBufferRenderSynchronizer
An object used to synchronize multiple queued sample buffers to a single timeline.
class AVSampleBufferDisplayLayer
An object that displays compressed or uncompressed video frames.
Topics
Sample buffer generation
Presentation
AVFoundation / Sample buffer playback
API Collection
Sample buffer playback
Create custom controllers to play and synchronize the timing of sample buffer
streams.


## Page 14

class AVSampleBufferVideoRenderer
An object that enqueues video sample buffers for rendering.
class AVSampleBufferAudioRenderer
An object used to decompress audio and play compressed or uncompressed audio.
Media playback
Manage the playback of media assets and interstitial content, independent of how you prese
that content in your interface.
Offline playback and storage
Download streamed content to disk to allow offline playback, and define policies to
automatically remove downloaded assets.
Streaming and AirPlay
Stream content wirelessly to other devices using AirPlay, and handle requests involving
FairPlay-protected assets.
See Also
Playback


