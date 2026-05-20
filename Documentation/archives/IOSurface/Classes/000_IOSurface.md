# 000_IOSurface.pdf

## Page 1

init?(properties: [IOSurfacePropertyKey : any Sendable])
init(IOSurfaceRef)
var allocationSize: Int
var allowsPixelSizeCasting: Bool
var baseAddress: UnsafeMutableRawPointer
var bytesPerElement: Int
var bytesPerRow: Int
var elementHeight: Int
var elementWidth: Int
var height: Int
var isInUse: Bool
Topics
Initializers
Instance Properties
IOSurface / IOSurface
Class
IOSurface
Data type representing an IOSurface opaque object.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 11.0+
visionOS 1.0+


## Page 2

var localUseCount: Int32
var pixelFormat: OSType
var planeCount: Int
var seed: UInt32
var width: Int
var surfaceID: UInt32
func allAttachments() -> [String : any Sendable]?
func attachment(forKey: String) -> (any Sendable)?
func baseAddressOfPlane(at: Int) -> UnsafeMutableRawPointer
func bytesPerElementOfPlane(at: Int) -> Int
func bytesPerRowOfPlane(at: Int) -> Int
func decrementUseCount()
func elementHeightOfPlane(at: Int) -> Int
func elementWidthOfPlane(at: Int) -> Int
func heightOfPlane(at: Int) -> Int
func incrementUseCount()
func lock(options: IOSurfaceLockOptions, seed: UnsafeMutablePointer<
UInt32>?) -> kern_return_t
func removeAllAttachments()
func removeAttachment(forKey: String)
func setAllAttachments([String : any Sendable])
func setAttachment(any Sendable, forKey: String)
func setPurgeable(IOSurfacePurgeabilityState, oldState: UnsafeMutable
Pointer<IOSurfacePurgeabilityState>?) -> kern_return_t
func unlock(options: IOSurfaceLockOptions, seed: UnsafeMutablePointer<
UInt32>?) -> kern_return_t
Instance Methods


## Page 3

func widthOfPlane(at: Int) -> Int
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class IOSurfaceRef
Data type representing an IOSurface opaque object.
Relationships
Inherits From
Conforms To
See Also
Classes


