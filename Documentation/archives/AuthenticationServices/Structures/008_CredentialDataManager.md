# 008_CredentialDataManager.pdf

## Page 1

func reportAllAcceptedPublicKeyCredentials(relyingPartyIdentifier:
String, userHandle: Data, acceptedCredentialIDs: [Data]) async throws
Report a snapshot of all the credentialIDs that will be accepted for a userHandle.
Credentials not present in the acceptedCredentialIDs may be removed or hidden by a
password manager. Relying party may choose to perform this periodically, e.g. on every sign
in. This information is shared with all password managers enabled in the system.
func reportPublicKeyCredentialUpdate(relyingPartyIdentifier: String,
userHandle: Data, newName: String) async throws
Report an update to a credential’s name, such as when changing the user name on an
account. This information is shared with all password managers enabled in the system.
func reportUnknownPublicKeyCredential(relyingPartyIdentifier: String,
credentialID: Data) async throws
Report that a specific credential is unknown or no longer accepted. The credential may be
removed or hidden by a password manager. This information is shared with all password
managers enabled in the system.
Topics
Instance Methods
Authentication Services / CredentialDataManager
Structure
CredentialDataManager
AuthenticationServices
SwiftUI
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
macOS 26.2+
visionOS 26.2+


## Page 2

func reportUnusedPasswordCredential(domain: String, userName: String)
async throws
Report an unused password credential for a given domain and username. Password manage
may remove or hide the password credential. This information is shared with all password
managers enabled in the system.
func save(password: ASPasswordCredential, for: ASAutoFillURLScope, titl
: String?) async throws
Save or update a password credential to the user’s preferred password manager in the
system.
Sendable, SendableMetatype
Relationships
Conforms To


