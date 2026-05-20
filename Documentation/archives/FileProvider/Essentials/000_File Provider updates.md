# 000_File Provider updates.pdf

## Page 1

Browse notable changes in File Provider.
Offer people the ability to sync their Desktop and Documents folders with your File Provider ap
Check whether a person opts in to sync these folders using replicatedKnownFolders. Syn
the folders using claimKnownFolders(_:localizedReason:completionHandler:), 
stop syncing using releaseKnownFolders(_:localizedReason:completion
Handler:) if the person opts out. Provide the system with information about which folders yo
support syncing through supportedKnownFolders, and share the locations of the folders b
adopting NSFileProviderKnownFolderSupporting.
Cache files on external disks. Confirm whether a volume is eligible for storing a domain using
checkDomainsCanBeStoredOnVolume(at:), and create a domain on that volume using th
new init(displayName:userInfo:volumeURL:) initializer. Store data about the current
sync state using stateDirectoryURL(), and determine whether to connect to a domain
created on another device using shouldConnectExternalDomain(completion
Handler:).
Install the File Provider logging profile to log helpful information for debugging and
troubleshooting. Download the .mobileconfig file at Profiles and Logs.
Improve error handling with new underlying error codes for NSFileProviderError.Code
.providerNotFound. NSFileProviderError.Code.providerDomainTemporarily
Unavailable indicates that the system is unable to service requests for this domain
Overview
June 2024
March 2024
Updates / File Provider updates
Article
File Provider updates
Learn about important changes to File Provider.


## Page 2

temporarily, and you can try again later. NSFileProviderError.Code.providerDomain
NotFound indicates that there isn’t a registered domain for the corresponding identifier.
NSFileProviderError.Code.applicationExtensionNotFound indicates that there
isn’t an app extension within the app bundle.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
See Also
Technology updates


## Page 3

Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.


