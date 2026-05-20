# Animations.pdf

## Page 1

url
The URL of the image file.
options
Additional playback options. Include the kCGImageAnimationDelayTime or kCGImage
AnimationLoopCount keys to override the timing information in the image file. Include the
CGImageAnimationStartIndex key to specify the index of the first image in the animatio
block
The animation block to execute for each image frame. The system executes this block on the
main queue, and at the intervals indicated by the image’s delay time metadata. Use this block
to display the provided image in your interface.
A status code indicating the success or failure of the animation.
Parameters
Return Value
Image I/O / CGAnimateImageAtURLWithBlock(_:_:_:)
Function
CGAnimateImageAtURLWithBlock(_:_:_:)
Animate the sequence of images in the Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file at the specified URL.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

The function executes the provided block for each frame of the animation. By default, the functi
uses the timing information contained in the image’s metadata. This information includes the
number of seconds between individual frames, and the number of times to loop the animation. Fo
example, the function uses the kCGImagePropertyGIFDelayTime and kCGImageProperty
GIFLoopCount tags from a GIF file’s metadata. To override the default timing information, provid
the appropriate keys in the options dictionary.
func CGAnimateImageDataWithBlock(CFData, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images using data from a Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file file.
typealias CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
let kCGImageAnimationStartIndex: CFString
A property that specifies the index of the first frame of an animation.
let kCGImageAnimationDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImageAnimationLoopCount: CFString
The number of times to repeat the animated sequence.
enum CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.
Discussion
See Also
Animations


## Page 3

data
The image data to animate.
options
Additional playback options. Include the kCGImageAnimationDelayTime or kCGImage
AnimationLoopCount keys to override the timing information in the image file. Include the
CGImageAnimationStartIndex key to specify the index of the first image in the animatio
block
The animation block to execute for each image frame. The system executes this block on the
main queue, and at the intervals indicated by the image’s delay time metadata. Use this block
to display the provided image in your interface.
A status code indicating the success or failure of the animation.
Parameters
Return Value
Image I/O / CGAnimateImageDataWithBlock(_:_:_:)
Function
CGAnimateImageDataWithBlock(_:_:_:)
Animate the sequence of images using data from a Graphics Interchange Format
(GIF) or Animated Portable Network Graphics (APNG) file file.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 4

The function executes the provided block for each frame of the animation. By default, the functi
uses the timing information contained in the image’s metadata. This information includes the
number of seconds between individual frames, and the number of times to loop the animation. Fo
example, the function uses the kCGImagePropertyGIFDelayTime and kCGImageProperty
GIFLoopCount tags from a GIF image’s metadata. To override the default timing information,
provide the appropriate keys in the options dictionary.
func CGAnimateImageAtURLWithBlock(CFURL, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images in the Graphics Interchange Format (GIF) or Animated
Portable Network Graphics (APNG) file at the specified URL.
typealias CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
let kCGImageAnimationStartIndex: CFString
A property that specifies the index of the first frame of an animation.
let kCGImageAnimationDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImageAnimationLoopCount: CFString
The number of times to repeat the animated sequence.
enum CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.
Discussion
See Also
Animations


## Page 5

index
The index of the image in the file.
image
The image to display.
stop
A Boolean flag set to false on input. To stop the animation, set the value of this parameter t
true.
During the animation of an image, the system calls this block for each successive frame of the
animation. Use this block to display the new image in your app’s interface, and to update any
additional details.
Parameters
Discussion
See Also
Image I/O / CGImageSourceAnimationBlock
Type Alias
CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 6

func CGAnimateImageAtURLWithBlock(CFURL, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images in the Graphics Interchange Format (GIF) or Animated
Portable Network Graphics (APNG) file at the specified URL.
func CGAnimateImageDataWithBlock(CFData, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images using data from a Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file file.
let kCGImageAnimationStartIndex: CFString
A property that specifies the index of the first frame of an animation.
let kCGImageAnimationDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImageAnimationLoopCount: CFString
The number of times to repeat the animated sequence.
enum CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.
Animations


## Page 7

The value of this property is a CFNumber that contains an unsigned integer. To override the start
index value in the image file, include this property in the options dictionary when animating an
image.
func CGAnimateImageAtURLWithBlock(CFURL, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images in the Graphics Interchange Format (GIF) or Animated
Portable Network Graphics (APNG) file at the specified URL.
func CGAnimateImageDataWithBlock(CFData, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images using data from a Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file file.
typealias CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
Discussion
See Also
Animations
Image I/O / kCGImageAnimationStartIndex
Global Variable
kCGImageAnimationStartIndex
A property that specifies the index of the first frame of an animation.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 8

let kCGImageAnimationDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImageAnimationLoopCount: CFString
The number of times to repeat the animated sequence.
enum CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.


## Page 9

The value of this property is a CFNumber with a floating-point value. To override the delay time
value in the image file, include this property in the options dictionary when animating an image.
func CGAnimateImageAtURLWithBlock(CFURL, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images in the Graphics Interchange Format (GIF) or Animated
Portable Network Graphics (APNG) file at the specified URL.
func CGAnimateImageDataWithBlock(CFData, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images using data from a Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file file.
typealias CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
Discussion
See Also
Animations
Image I/O / kCGImageAnimationDelayTime
Global Variable
kCGImageAnimationDelayTime
The number of seconds to wait before displaying the next image in an animated
sequence.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 10

let kCGImageAnimationStartIndex: CFString
A property that specifies the index of the first frame of an animation.
let kCGImageAnimationLoopCount: CFString
The number of times to repeat the animated sequence.
enum CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.


## Page 11

The value of this property is a CFNumber that contains an unsigned integer. To override the loop
count value in the image file, include this property in the options dictionary when animating an
image.
You may specify kCFNumberPositiveInfinity for this property to animate the images
continuously.
func CGAnimateImageAtURLWithBlock(CFURL, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images in the Graphics Interchange Format (GIF) or Animated
Portable Network Graphics (APNG) file at the specified URL.
func CGAnimateImageDataWithBlock(CFData, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images using data from a Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file file.
Discussion
See Also
Animations
Image I/O / kCGImageAnimationLoopCount
Global Variable
kCGImageAnimationLoopCount
The number of times to repeat the animated sequence.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 12

typealias CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
let kCGImageAnimationStartIndex: CFString
A property that specifies the index of the first frame of an animation.
let kCGImageAnimationDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
enum CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.


## Page 13

case allocationFailure
case corruptInputImage
case incompleteInputImage
case parameterError
case unsupportedFormat
init?(rawValue: OSStatus)
BitwiseCopyable
Topics
Animation Status
Initializers
Relationships
Conforms To
Image I/O / CGImageAnimationStatus
Enumeration
CGImageAnimationStatus
Constants that indicate the result of animating an image sequence.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 14

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
func CGAnimateImageAtURLWithBlock(CFURL, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images in the Graphics Interchange Format (GIF) or Animated
Portable Network Graphics (APNG) file at the specified URL.
func CGAnimateImageDataWithBlock(CFData, CFDictionary?, CGImageSource
AnimationBlock) -> OSStatus
Animate the sequence of images using data from a Graphics Interchange Format (GIF) or
Animated Portable Network Graphics (APNG) file file.
typealias CGImageSourceAnimationBlock
The block to execute for each frame of an image animation.
let kCGImageAnimationStartIndex: CFString
A property that specifies the index of the first frame of an animation.
let kCGImageAnimationDelayTime: CFString
The number of seconds to wait before displaying the next image in an animated sequence.
let kCGImageAnimationLoopCount: CFString
The number of times to repeat the animated sequence.
See Also
Animations


