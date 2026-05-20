# Classes.pdf

## Page 1

BEAccessibilityRemoteElement represents the destination of a BEAccessibilityRemoteHostElemen
in a different process. The elements it contains are defined by the accessibilityElements
API. BEAccessibilityRemoteElement does not need to be returned in any element array.
init(identifier: String, hostPid: pid_t)
NSObject
CVarArg
Overview
Topics
Initializers
Relationships
Inherits From
Conforms To
BrowserEngineKit / BEAccessibilityRemoteElement
Class
BEAccessibilityRemoteElement
iOS 26.0+
iPadOS 26.0+
visionOS 26.0+


## Page 2

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol


## Page 3

BEAccessibilityRemoteHostElement connects the accessibility hierarchy of two separate
processes. The remote host and remote elements share the same identifier to facilitate this
connection. To use this, return this remote element from an object in your view hierarchy via its
accessibilityElements method.
init(identifier: String, remotePid: pid_t)
var accessibilityContainer: AnyObject?
Overview
Topics
Initializers
Instance Properties
Relationships
Inherits From
BrowserEngineKit / BEAccessibilityRemoteHostElement
Class
BEAccessibilityRemoteHostElement
iOS 26.0+
iPadOS 26.0+
visionOS 26.0+


## Page 4

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Conforms To


## Page 5

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To
BrowserEngineKit / BEMediaEnvironment
Class
BEMediaEnvironment
iOS 17.4+
iPadOS 17.4+


## Page 6

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To
BrowserEngineKit / BEProcessCapability
Class
BEProcessCapability
iOS 17.4+
iPadOS 17.4+
macOS 14.3+


## Page 7

func allow(URL, completionHandler: (Bool, (any Error)?) -> Void)
func evaluateURL(URL, completionHandler: (Bool, Data?) -> Void)
class var shouldEvaluateURLs: Bool
NSObject
CVarArg
Topics
Instance Methods
Type Properties
Relationships
Inherits From
Conforms To
BrowserEngineKit / BEWebContentFilter
Class
BEWebContentFilter
An object that represents a web content filter
iOS 26.2+
iPadOS 26.2+


## Page 8

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol


