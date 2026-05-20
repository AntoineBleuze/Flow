# 005_APActivationPayload.pdf

## Page 1

When users launch an App Clip, the platform passes an activation payload to the App Clip as part
of an NSUserActivity object. When the App Clip receives the payload, confirm the user’s
physical location at the time of the invocation.
For more information, see Responding to invocations.
var url: URL?
The URL of the link that launched the App Clip.
func confirmAcquired(in: CLRegion, completionHandler: (Bool, (any Error
)?) -> Void)
Checks whether an App Clip invocation happened at an expected physical location.
Overview
Topics
Passing data to the App Clip
Confirming a person’s physical location
App Clips / APActivationPayload
Class
APActivationPayload
Information that’s passed to an App Clip on launch.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 2

let APActivationPayloadErrorDomain: String
A string that identifies the activation payload’s error domain.
struct APActivationPayloadError
An error that an App Clip activation payload returns.
enum Code
Error codes that an App Clip activation payload returns.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
Understanding errors
Relationships
Inherits From
Conforms To
See Also
Launch


## Page 3

Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their privacy.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.


