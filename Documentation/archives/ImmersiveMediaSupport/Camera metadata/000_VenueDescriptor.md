# 000_VenueDescriptor.pdf

## Page 1

This type contains information that includes camera definitions such as the lens calibration
information, as well as data necessary for the rendering of the video frames.
init(device: (any MTLDevice)?)
Creates an empty venue descriptor instance.
convenience init(aimeURL: URL, device: (any MTLDevice)?) async throws
Creates a venue descriptor instance from an AIME file.
var cameras: [ImmersiveCamera]
An array of all the immersive cameras contained in the venue descriptor.
Overview
Topics
Creating a venue descriptor
Configuring cameras
Immersive Media Support / VenueDescriptor
Class
VenueDescriptor
The Apple Immersive Media Venue Descriptor is a collection of static metadata
necessary for every Apple Immersive Video.
macOS 26.0+
visionOS 26.0+


## Page 2

func addCamera(ImmersiveCamera) throws
Adds a new immersive camera definition to the venue descriptor.
func removeCamera(id: String) throws
Removes an immersive camera definition from the venue descriptor.
func cameraViewModel(for: String) -> ImmersiveCameraViewModel?
Returns the camera view model for the given immersive camera identifier.
func save(to: URL) throws
Generates an AIME file at the specified location.
var aimeData: Data?
Property holding the complete static metadata needed for the immersive media playback.
init(aimeData: Data, device: (any MTLDevice)?) async throws
Creates a venue descriptor instance from memory.
Actor, Sendable, SendableMetatype
struct ImmersiveCamera
A structure that holds the required information for an immersive media camera to process an
render video frames.
Saving a venue descriptor data
Initializers
Relationships
Conforms To
See Also
Camera metadata


## Page 3

struct ImmersiveCameraCalibration
A structure that represents immersive media camera calibration data.
enum ImmersiveCameraMask
A structure that holds the camera mask type information and its relevant mask name.
struct ImmersiveDynamicMask
A type that holds the information required to dynamically generate an immersive media mask
at load time.


