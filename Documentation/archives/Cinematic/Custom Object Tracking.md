# Custom Object Tracking.pdf

## Page 1

var confidence: Float
A number between 0.0 and 1.0 representing the probability that a defined object is within the
bounds.
var normalizedBounds: CGRect
The bounds of the detected object in normalized coordinates where (0.0, 0.0) is the upper-le
corner, and (1.0, 1.0) is the lower-right.
Sendable, SendableMetatype
Topics
Instance Properties
Relationships
Conforms To
Cinematic / CNBoundsPrediction
Structure
CNBoundsPrediction
A structure representing the bounds of the predicted subject.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 2

class CNObjectTracker
An object that converts a normalized point or rectangle into a detection track that tracks an
object over time.
See Also
Custom Object Tracking


## Page 3

init(commandQueue: any MTLCommandQueue)
Creates a new detection track builder.
func continueTracking(at: CMTime, sourceImage: CVPixelBuffer, source
Disparity: CVPixelBuffer) -> CNBoundsPrediction?
An object that continues to track an object that you’ve started tracking, and adds a new
detection to the detection track you’re building.
func findObject(at: CGPoint, sourceImage: CVPixelBuffer) -> CNBounds
Prediction?
An object that finds the bounds of an object at the given point.
func finishDetectionTrack() -> CNDetectionTrack
Finish constructing the detection track and return it.
func resetDetectionTrack()
Topics
Initializers
Instance Methods
Cinematic / CNObjectTracker
Class
CNObjectTracker
An object that converts a normalized point or rectangle into a detection track that
tracks an object over time.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 4

Resets the builder to construct a new detection track.
func startTracking(at: CMTime, within: CGRect, sourceImage: CVPixel
Buffer, sourceDisparity: CVPixelBuffer) -> Bool
Starts creating a detection track to track an object within the given bounds.
static var isSupported: Bool
Indicates whether the current device supports object detection and tracking.
struct CNBoundsPrediction
A structure representing the bounds of the predicted subject.
Type Properties
See Also
Custom Object Tracking


