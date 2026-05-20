# 001_CLKWatchFaceLibrary.pdf

## Page 1

Sharing an Apple Watch face
Use a CLKWatchFaceLibrary object to add an existing .watchface file to the Watch app. Add
watch faces only on devices that support pairing with an Apple Watch.
func addWatchFace(at: URL, completionHandler: ((any Error)?) -> Void)
Adds a watch face from the app’s bundle.
class let ErrorDomain: String
The domain for errors while importing watch faces.
Mentioned in
Overview
Topics
Importing a Watch Face
Handling Errors
ClockKit / CLKWatchFaceLibrary
Class
CLKWatchFaceLibrary
An object for importing watch faces that the app provides.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
watchOS 7.0+


## Page 2

enum ErrorCode
Error codes that the watch face library returns.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sharing an Apple Watch face
Distribute a customized watch face to Apple Watch users.
Relationships
Inherits From
Conforms To
See Also
Face Sharing


