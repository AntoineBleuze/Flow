# 004_NSApplicationServices.pdf

## Page 1

Type
Object
Use this key to define which devices DeviceDiscoveryUI can connect with. The application
services’s Browses key takes an array of dictionaries, where each dictionary contains a unique
identifier, a usage description string, and a list of supported operating systems. You can define
more than one application service for your apps. Each service has its own identifier, and can
connect to a different subset of devices.
Set these in your tvOS app target’s Info tab, or in its Info.plist file.
Details
Discussion
Bundle Resources / Information Property List / NSApplicationServices
Property List Key
NSApplicationServices
A list of service providers and the devices that they support.
iOS 16.0+
iPadOS 16.0+
tvOS 16.0+
watchOS 9.0+


## Page 2

NSApplicationServiceIdentifier
A string that identifies your application service. You can use any string for your service, but y
must use the same string for both your tvOS app and the iOS, iPadOS, and watchOS apps.
NSApplicationServiceUsageDescription
A string that describes why you want to access the other devices. This is displayed to the use
in the picker view.
NSApplicationServicePlatformSupport
This is an array that contains strings representing the types of devices your application servic
can connect to. The valid values are “iOS”, “iPadOS”, and “watchOS”.
You can use the human-readable key names in Xcode’s property list editor.
In the iOS, iPadOS, or watchOS app, use the Advertises key, and give it an array of dictionaries
where each dictionary lists the application service identifier for the connection types supported o
this platform.


## Page 3

You can use the human-readable key names in Xcode’s property list editor.
Advertises
An array of dictionaries, where each dictionary contains a unique identifier.
Browses
An array of dictionaries, where each dictionary contains a unique identifier, a usage
description string, and a list of supported OSs.
Topics
Property List Keys


