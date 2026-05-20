# Spatial Photos.pdf

## Page 1

Spatial photos are High-Efficiency Image Codec (HEIC) files containing a pair of left- and right-ey
images, together with a stereo pair group and additional spatial metadata. Spatial metadata
describes properties of the left- and right-eye cameras that captured the stereo scene. Adding
spatial metadata to a stereo HEIC prompts Apple platforms to consider the image as spatial instea
of just stereo, and opts the image into visual treatments on Apple Vision Pro that help minimize
common causes of stereo viewing discomfort.
To learn more about why you might want to package a pair of stereo images as a spatial photo an
the metadata values you provide, see Creating spatial photos and videos with spatial metadata.
This sample app demonstrates how to use Image I/O APIs to convert two separate images into a
spatial photo, saving the output as a HEIC file. The app’s SpatialPhotoConverter class
performs this conversion process.
Note
This sample app is a macOS command-line application, but you can also perform the spatial
photo conversion process on other Apple platforms such as visionOS and iOS.
To run the app in Xcode, add the input file locations, output file location, and spatial metadata for
your images as arguments to the project’s scheme. Select Product > Scheme > Edit Scheme
Overview
Configure the sample code project
Image I/O / Writing spatial photos
Sample Code
Writing spatial photos
Create spatial photos for visionOS by packaging a pair of left- and right-eye
images as a stereo HEIC file with related spatial metadata.
Download
macOS 14.0+
Xcode 16.0+


## Page 2

(Command-<), and add the arguments described below to Arguments Passed On Launch:
--leftImage (or -l) followed by a path to a local left-eye image file
--rightImage (or -r) followed by a path to a local right-eye image file
--outputImage (or -o) followed by the output path for the spatial photo, with a file extension
of .heic (for example, ~/Documents/spatial_photo.heic)
--baseline (or -b) to provide a baseline in millimeters (for example, --baseline 64.0 for
64mm baseline)
--fov (or -f) to provide a horizontal field of view in degrees (for example, --fov 80.0 for a
80-degree field of view)
--disparityAdjustment (or -d) to provide a disparity adjustment value as a fraction of the
image’s width (for example, --disparityAdjustment 0.02 for a 2% positive disparity shif
By default, the project’s scheme loads a pair of left- and right-eye images from the Xcode project
folder: Hummingbird_Left.png and Hummingbird_Right.png. These images are renders o
a 3D scene of a hummingbird model. The virtual cameras that created these renders were
positioned 64mm apart, with a horizontal field of view of 80 degrees, which means the value for t
--baseline argument is 64.0, and the value of the --fov argument is 80.0.
For these images, a disparity adjustment of +2% of the image width produces a comfortable dept
effect when the spatial photo is presented in a window on Apple Vision Pro. This 2% disparity
adjustment value positions the nearest object in the spatial photo — the hummingbird — just behi
the front of the window, while still keeping an effective illusion of depth between the hummingbird
and the background. The scheme’s arguments express the +2% disparity adjustment with a --
disparityAdjustment value of 0.02.
The app starts by creating a CGImageSource for each of the left- and right-eye images. An
initializer on StereoPairImage performs the following steps:
1. Opens the image as a CGImageSource by calling CGImageSourceCreateWithURL
2. Discovers the primary image index for the image source by calling CGImageSourceGet
PrimaryImageIndex
3. Discovers the pixel width and height of the image by calling CGImageSourceCopy
PropertiesAtIndex for the primary image index, and looking for kCGImageProperty
PixelWidth and kCGImagePropertyPixelHeight values in the returned properties
dictionary
4. Stores the results of the above steps as properties on the StereoPairImage
Load the left- and right-eye images


## Page 3

The app next validates that the left and right StereoPairImage have the same pixel width and
height.
Important
The left- and right-eye images in a spatial photo must have the same pixel size.
The app converts the provided baseline distance from millimeters to meters.
Define an extrinsic position for each image


## Page 4

Then, the app uses this baseline distance to define a left extrinsic position (at the origin) and a rig
extrinsic position (offset from the origin by baselineInMeters in the positive x-axis) to describ
how the left and right cameras are positioned relative to each other in 3D space.
Important
The distance in 3D space between the left- and right-eye camera extrinsic positions must
always represent the baseline in meters between the two cameras that captured the images.
The position of the right-eye camera must always be positioned to the right of the left-eye
camera in the left-eye camera’s coordinate space.
The app uses the provided horizontal field of view, plus the known width and height of each input
image, to compute a 3x3 camera intrinsics matrix that describes the characteristics of the left and
right cameras.
The app calculates the 3x3 intrinsics matrix using a convenience method,
intrinsics(horizontalFOV:), on StereoPairImage. This method defines an intrinsics
matrix with the same focal length in both X and Y (to represent a spherical lens), with the principa
point of the camera located at the center of the image, and no shear.
Compute a camera intrinsics matrix


## Page 5

The app already validated the left-eye and right-eye images to confirm that they have the same
pixel size. As a result, the app calculates the intrinsics matrix for the left-eye image and uses it as
the intrinsics matrix for both images below.
The app encodes the provided disparity adjustment value as a signed integer, converting it from a
signed floating-point value in the range [-1.0, +1.0] (as a fraction of image width) to a signed
integer value in the range [-10000, +10000].
Before adding the left-eye and right-eye images to the image destination, the app defines a
properties dictionary for each image, which expresses the spatial metadata for that image as
expected ImageIO properties.
A convenience method, propertiesDictionary(isLeft:encodedDisparity
Adjustment:position:intrinsics:), defines these property dictionaries.
Encode the disparity adjustment
Define an image properties dictionary for each image


## Page 6

The properties dictionary has two sub-dictionaries for each image:
A groups dictionary (kCGImagePropertyGroups) that defines the image as part of a stereo
pair group, and specifies a disparity adjustment for that group
A HEIF dictionary (kCGImagePropertyHEIFDictionary) that defines the extrinsics and
camera model for the camera that created the image
For the groups dictionary, the convenience method defines a single stereo pair group with the
following properties:
A kCGImagePropertyGroupIndex of 0, because this is the first and only group in the outpu
file
A kCGImagePropertyGroupType of kCGImagePropertyGroupTypeStereoPair to
indicate that this group defines a stereo pair of images
A flag indicating if this image is the left-eye image (kCGImagePropertyGroupImageIsLeft
Image) or the right-eye image (kCGImagePropertyGroupImageIsRightImage) in the
stereo pair group
The kCGImagePropertyGroupImageDisparityAdjustment to use when presenting this
stereo pair group


## Page 7

Important
The stereo pair group for a spatial photo must always define a disparity adjustment offset.
Disparity adjustment and group index are provided as part of the image properties for each
image, so the app includes the same index and disparity adjustment value in the groups
dictionary for both the left- and right-eye images.
For the HEIF dictionary, the convenience method defines:
A camera extrinsics (kIIOMetadata_CameraExtrinsicsKey) dictionary that contains the
extrinsic position and rotation for the camera
A camera model (kIIOMetadata_CameraModelKey) dictionary that contains the camera
intrinsics matrix and camera model type for the camera that captured the image
The camera extrinsics dictionary specifies an identity rotation to indicate that the app defines
camera extrinsics with a position offset only.
Important
The camera model dictionary for the left- and right-eye images in a spatial photo must always
define a camera model type of either kIIOCameraModelType_SimplifiedPinhole or k
IIOCameraModelType_GenericPinhole.
The properties dictionary also specifies a kCGImagePropertyHasAlpha value of false to
indicate that the system should ignore any alpha channel data in the source image when adding
that source image to the image destination.
The app calls CGImageDestinationCreateWithURL to create an output CGImage
Destination at the provided URL for the output spatial photo. The app creates the image
destination with the uniform type identifier for a HEIC image and an expected image count of 2 to
indicate that the app writes both a left- and right-eye image to a single HEIC file.
Write the images to an output image destination


## Page 8

The app creates an image destination with a destinationProperties dictionary that specifie
a primary image index of 0 for the output HEIC file. This primary image index specifies which imag
in the output HEIC file is preferred for display when an app or system needs a single image to
represent the file’s content (for example, on a nonstereo platform such as iOS). However, not all
apps and operating systems use the primary image index when displaying a HEIC file, and instead
display the first image in the HEIC by default. For this reason, the app sets the primary image inde
to 0, so that apps that use the primary image index select the same image as apps that don’t.
Next, the app calls CGImageDestinationAddImageFromSource to copy the left- and right-e
image sources into the image destination, passing in an appropriate properties dictionary for each
image. The app adds the left-eye image first, which means the left-eye image is the primary imag
for the output HEIC file, because it appears at image index 0 in the output file.
It’s valid to write either the left- or right-eye image as the first image in a spatial photo. visionOS
detects the appropriate images to use for left- and right-eye presentation based on the kCGImag
PropertyGroupImageIsLeftImage or kCGImagePropertyGroupImageIsRightImage
properties in the groups dictionary for each image, regardless of the order in which the images ar
added to the HEIC file. If the system should prefer the right-eye image as the primary image to
display when it shows the spatial photo in a nonstereo environment, modify the app to add the
right-eye image to the image destination first, so that it appears at index 0 in the output HEIC file.
Finally, the app calls CGImageDestinationFinalize to write the image destination to disk as 
self-contained spatial photo.


## Page 9

Creating spatial photos and videos with spatial metadata
Add spatial metadata to stereo photos and videos to create spatial media for viewing on App
Vision Pro.
See Also
Spatial Photos


## Page 10

iPhone 15 Pro and Apple Vision Pro can capture spatial photos and videos, a new type of
stereoscopic content that immerses people in a moment and gives them a greater sense of
presence in a scene.
Spatial photos and videos are stereo media with additional spatial metadata:
A spatial photo is a multi-image HEIC file containing a left-eye image and a right-eye image, a
stereo pair group, plus spatial metadata.
A spatial video is a QuickTime movie with a stereo MV-HEVC video track, plus spatial metadata
Add spatial metadata to stereo photos or videos created by your app to prompt Apple platforms t
consider that media as spatial instead of just stereo. Doing so enables presentation of that media
two complementary viewing modes on Apple Vision Pro that provide alternate viewing methods fo
the same content:
By default, spatial photos and videos present in a window, with the stereoscopic content inset.
People can also choose to fully immerse themselves in a spatial photo or video by tapping the
Immersive button to present the stereo scene at real-world scale.
Both modes contain visual treatments that can help minimize common causes of stereo viewing
discomfort.
While people can use devices like iPhone 15 Pro and Apple Vision Pro to capture spatial media, yo
can also create and write spatial photos and videos in your own apps. For example:
Overview
Create spatial photos and videos from your own media
Image I/O / Creating spatial photos and videos with spatial metadata
Article
Creating spatial photos and videos with
spatial metadata
Add spatial metadata to stereo photos and videos to create spatial media for
viewing on Apple Vision Pro.


## Page 11

A stereo camera app can export camera captures as spatial media.
A video editing app can import, edit, and export spatial videos.
A 3D game can export spatial screenshots or gameplay videos.
A 3D rendering engine can render spatial images or video sequences of a 3D scene.
Spatial photos and videos both use the same spatial metadata, but encode it in different ways. Fo
examples of how to write spatial metadata to stereo photos and videos your app creates, check o
Writing spatial photos and Converting side-by-side 3D video to multiview HEVC and spatial video
For visionOS to consider a stereo photo or video as spatial, the media must include three properti
of the cameras that captured it:
The horizontal field of view of each camera
The baseline of the cameras
The projection of the captured images
The horizontal field of view defines how much of the scene in front of each camera is visible acros
the width of each image. The horizontal field of view must be the same for both cameras.
The baseline defines how far apart the centers of the cameras were (also known as the interaxial
distance). Baselines that approximate the average distance between human eyes (64 mm) produc
content that feels “real-world size” when viewed with immersive presentation. However, a wide
range of baselines can produce compelling results. For example, the cameras used to capture
spatial videos on iPhone 15 Pro have a baseline of 19.2 mm.
The projection defines the relationship between objects in the world and pixels in the image. Spat
photos and videos always use a rectilinear projection.
Spatial media must also define a horizontal disparity adjustment (also known as a convergence
adjustment). This modifies the perceived stereo depth of the scene by shifting the left- and right-
eye images horizontally when you present them in a window in visionOS. As the two images shift
horizontally, the perceived 3D scene shifts in depth along the z-axis, with a negative value making
content appear closer, and a positive value pushing it farther away.
Horizontal disparity adjustment is expressed as a positive or negative fraction of the image’s widt
A positive value pushes the left image to the left, and the right image to the right; a negative value
pushes them in the opposite direction. Each image is shifted by half of the provided adjustment
value, so a positive adjustment of 2 percent moves the left image 1 percent to the left, and the rig
image 1 percent to the right.
Specify camera properties
Choose a horizontal disparity adjustment


## Page 12

When writing your own spatial media, choose a disparity adjustment value that pushes the closes
objects just behind the front of the window, to avoid depth conflicts with other content and UI,
while maintaining a sense of depth. The ideal horizontal disparity adjustment value depends on th
distance of objects from the camera at capture-time, plus the field of view and aspect ratio of the
media. A positive horizontal disparity adjustment of 2 percent typically provides a good default
adjustment for many types of stereo media.
Determining whether to create spatial media in your app depends on the source content and the
experience you want to create.
People can experience spatial media immersively at true scale. Consider adding spatial metadata 
stereo content that benefits from the viewer being “in the moment,” such as reliving a memory at
the same size and scale as the original experience.
Spatial metadata needs to reflect the true camera properties. Ensure you know enough about the
capture-time characteristics of the left- and right-eye cameras to provide accurate spatial
metadata for them.
Camera properties in spatial videos need to be constant throughout the duration of the video. Do
write spatial metadata to a stereo video if the baseline, horizontal field of view, or recommended
disparity adjustment of your stereo video varies over time. For example, a movie or TV show that
was captured on multiple stereo cameras with different fields of view might not have consistent
spatial metadata across its entire duration, and might not be appropriate for spatial presentation.
For this kind of content, prefer VideoPlayer or AVPlayerViewController for stereo playba
presentation.
Spatial media is always rectilinear, typically with a field of view less than 90 degrees. If your conte
uses an equirectangular, fisheye, or other non-rectilinear projection, don’t encode it as spatial
media.
Writing spatial photos
Create spatial photos for visionOS by packaging a pair of left- and right-eye images as a
stereo HEIC file with related spatial metadata.
Decide when to create spatial media
See Also
Spatial Photos


## Page 13



