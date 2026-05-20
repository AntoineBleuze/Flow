# 003_Confirming a person_s physical location.pdf

## Page 1

If you create an App Clip that people invoke at a physical location, you may need to confirm a
person’s location before allowing them to perform a task. For a quick launch and to preserve user
privacy, App Clips use a lightweight mechanism in which the system verifies that a person is at a
specific, expected location. When you adopt this mechanism, and when people allow it, the App
Clip card contains a note that tells people that the App Clip can verify their location. They can
disable location verification by tapping the note on the App Clip card.
To enable your App Clip to verify the person’s location, modify your App Clip’s Info.plist file:
1. Open your App Clip’s Info.plist, add the NSAppClip key, and set its type to Dictionary
Overview
Enable your App Clip to verify a person’s location
App Clips / Confirming a person’s physical location
Article
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their
privacy.


## Page 2

2. Add an entry to the dictionary with NSAppClipRequestLocationConfirmation as the ke
select Boolean as its type, and set its value to true.
Alternatively, open the Info.plist file in the property list editor and add the entry by selecting
App Clip from the list of keys. This adds the NSAppClip key and the following entries of type
Boolean to its dictionary: “Requests ephemeral user notifications” and “Requests location
confirmation.” Per default, the value for both entries is NO. Change the value for “Requests locatio
confirmation” to YES.
Note
Don’t add an entry for the NSAppClipRequestLocationConfirmation key to your full
app’s Info.plist — functionality to confirm a person’s location is only available to App Clips.
Instead, modify your full app’s code to request permission to access the location of a device
and make use of the Core Location framework. For more information, refer to Getting the
current location of a device.
After you modify your App Clip’s Info.plist file, add code to provide the expected physical
location information to the App Clip. To retrieve this information, encode an identifier in the URL
that launches the App Clip, and use the identifier to look up the location information for a busines
Add code that verifies the physical location


## Page 3

in your database. Alternatively, encode the location information in the URL that launches the App
Clip.
On launch, access the location information, use it to create a CLCircularRegion object with a
radius of up to 500 meters, and pass it to the confirmAcquired(in:completionHandler:
function.
The following code verifies a person’s location when they launch the App Clip. Make sure to upda
your user interface for each possible result, including the case where a person denies access to
location services on their device.


## Page 4

For more information on how you can access the App Clip’s invocation URL, refer to Responding t
invocations.
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
See Also
Launch


## Page 5

class APActivationPayload
Information that’s passed to an App Clip on launch.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.


