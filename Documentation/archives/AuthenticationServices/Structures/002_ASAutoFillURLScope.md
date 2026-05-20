# 002_ASAutoFillURLScope.pdf

## Page 1

init(scheme: ASAutoFillURLScope.Scheme, host: String, port: Int?, path:
String)
Creates a URL components instance
init?(url: URL)
Initialize with the components of a URL.
var host: String
The host subcomponent.
var path: String
The path subcomponent.
var port: Int?
The port subcomponent.
Topics
Initializers
Instance Properties
Authentication Services / ASAutoFillURLScope
Structure
ASAutoFillURLScope
This structure represents the subset of URL components supported for the AutoF
of credentials.
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
macOS 26.2+
visionOS 26.2+


## Page 2

var scheme: ASAutoFillURLScope.Scheme
The scheme subcomponent of the URL.
var url: URL?
A URL created from the components.
enum Scheme
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Enumerations
Relationships
Conforms To


