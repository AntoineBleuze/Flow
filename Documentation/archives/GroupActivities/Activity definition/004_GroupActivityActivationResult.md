# 004_GroupActivityActivationResult.pdf

## Page 1

When you call prepareForActivation(), the system determines whether you share the
activity with other participants in a FaceTime call, or perform it locally. After making the
determination, it passes a GroupActivityActivationResult value to the method’s
completion handler. Use that value to start the activity in the selected setting.
case activationPreferred
A result that indicates the user wants to share the activity with the group.
case activationDisabled
A result that indicates the user disabled the automatic sharing of activities, or prefers to
perform the activity locally.
case cancelled
A result that indicates the user canceled the activation request.
Overview
Topics
Getting the activation results
Group Activities / GroupActivityActivationResult
Enumeration
GroupActivityActivationResult
The result of preparing to start a custom activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

Copyable
Equatable
Hashable
Sendable
SendableMetatype
Defining your app’s SharePlay activities
Configure your app’s SharePlay support and define the activities that people can perform fro
your app.
Supporting coordinated media playback
Create synchronized media experiences that enable users to watch and listen across device
protocol GroupActivity
A type that can advertise your app’s activities to other participants.
struct GroupActivityMetadata
Text and image content that describes an activity to potential participants.
struct GroupActivityTransferRepresentation
A type that lets you start a group activity from a known context.
Relationships
Conforms To
See Also
Activity definition


