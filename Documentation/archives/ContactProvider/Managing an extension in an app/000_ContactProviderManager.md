# 000_ContactProviderManager.pdf

## Page 1

Use this class to initially enable your contact provider app extension, making it visible to the syste
and other apps. To use the default domain, create a manager and call enable(). This is an asyn
call, because it may prompt the person using your app to approve turning on the contact provider
You also use ContactProviderManager when you need to invoke the app extension on
demand. For example, when your app knows new contacts are available from your server, call
Overview
Signaling the app extension
ContactProvider / ContactProviderManager
Class
ContactProviderManager
An interface for the app to control its extension.
iOS 18.0+
iPadOS 18.0+


## Page 2

signalEnumerator(for:) so the extension can fetch and provide the changed contacts.
Important
You can only use ContactProviderManager in an app, not in an app extension.
init(domainIdentifier: String) throws
Creates a provider manager.
func signalEnumerator(for: ContactItem.Identifier) async throws
Requests that the extension enumerate its contacts for the domain.
func invalidate() async throws
Requests that the extension terminate.
var domain: any ContactProviderDomain
The domain that this instance manages.
Topics
Creating a contact provider manager
Invoking the app extension
Managing the contact provider manager life cycle
Managing the domain


## Page 3

func enable() async throws
Requests the person using the app to enable the extension domain.
var isEnabled: Bool
A Boolean value that indicates whether the person using the app enabled the extension
domain.
func reset() async throws
Resets the extension domain.
func disable() async throws
Disables the extension domain.


