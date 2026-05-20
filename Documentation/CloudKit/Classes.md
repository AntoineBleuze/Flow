# Classes.pdf

## Page 1

init()
Creates a new, empty share request access operation.
convenience init(shareURLs: [URL])
Creates a share request access operation configured with specified share URLs.
var perShareAccessRequestResultBlock: ((URL, Result<Void, any Error>) -
Void)?
A block called once for each share URL processed by the server.
var shareAccessRequestResultBlock: ((Result<Void, any Error>) -> Void)?
A block called when the entire share access request operation completes.
var shareURLs: [URL]?
The URLs of the shares to request access to.
Topics
Initializers
Instance Properties
CloudKit / CKShareRequestAccessOperation
Class
CKShareRequestAccessOperation
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

CKOperation
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To


