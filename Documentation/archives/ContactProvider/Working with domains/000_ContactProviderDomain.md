# 000_ContactProviderDomain.pdf

## Page 1

var displayName: String
The display name the system shows to represent this domain.
Required
var identifier: String
The identifier of the domain.
Required
var userInfo: Dictionary<String, Any>
Custom values used to configure the extension before enumeration begins.
Required
Topics
Identifying the domain
Providing custom domain data
Relationships
ContactProvider / ContactProviderDomain
Protocol
ContactProviderDomain
A domain, including traits like an identifier and display name, used to configure th
extension.
iOS 18.0+
iPadOS 18.0+


## Page 2

DefaultContactProviderDomain
struct DefaultContactProviderDomain
The default domain the extension uses.
Conforming Types
See Also
Working with domains


