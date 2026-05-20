# 001_BEAccessibilityRemoteHostElement.pdf

## Page 1

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


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Conforms To


