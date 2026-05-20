# 001_ASCredentialImportManager.pdf

## Page 1

ASCredentialImportManager allows your app to exchange authentication credentials such a
passwords and passkeys with other apps. Participating apps, such as password managers, export
credentials to your app by using the ASCredentialExportManager class.
To participate in credential exchange, edit your credential provider extension’s information proper
list and add the following key with a Boolean value of YES:
NSExtension > NSExtensionAttributes > ASCredentialProviderExtension
Capabilities > SupportsCredentialExchange
Also, declare the versions of the credential data format your app supports using the following key
NSExtension > NSExtensionAttributes > ASCredentialProviderExtension
Capabilities > SupportedCredentialExchangeVersions
The value is an array of strings containing every version your app supports. Currently, the only
available version is 1.0.
Credential export begins when another app calls exportCredentials(_:), which brings up a
system UI to choose an app to export to. When the person using the export app chooses your app
Overview
Configuring your app
Importing credentials
Authentication Services / ASCredentialImportManager
Class
ASCredentialImportManager
A class to manage importing credentials.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

to receive the credentials, the system launches your app and sends an NSUserActivity whose
activityType is ASCredentialExchangeActivity. To support this process, add the
NSUserActivityTypes array to your app’s information property list and add the item
ASCredentialExchangeActivityType to the array.
Your app needs to prepare for the system launching the app from this activity by fetching the
ASCredentialImportToken from the activity’s userInfo dictionary. The value of this key is a
UUID token; create an instance of ASCredentialImportManager and pass the token to
importCredentials(token:) to begin the import process.
The following example shows how a SwiftUI app handles launching from the user activity and
beginning the credential import process.
For a corresponding export code example, see ASCredentialExportManager.
init()
Creates an import manager instance.
Topics
Creating an import manager


## Page 3

func importCredentials(token: UUID) async throws -> ASExportedCredentia
Data
Begins the credential import process.
struct ASExportedCredentialData
A container for credential data that your app provides to an exporter or receives from an
importer.
class ASCredentialExportManager
A class to manage exporting credentials.
Importing credentials
See Also
Credential migration


