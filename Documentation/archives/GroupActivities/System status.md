# System status.pdf

## Page 1

Presenting SharePlay activities from your app’s UI
Starting a SharePlay experience with the Group Activities framework requires an active FaceTime
call. Use a GroupStateObserver object to determine whether it’s possible to start such an
experience. When no call is active, you might adjust your app’s user interface. For example, you
might hide or remove controls that start a shared activity.
To get the current system state, create a GroupStateObserver object and check the value of i
isEligibleForGroupSession property. To respond right away when the value of the propert
changes, configure a subscriber for that property.
convenience init()
Creates a new group state observer object for determining the availability of group sessions
Mentioned in
Overview
Topics
Creating a group state observer
Group Activities / GroupStateObserver
Class
GroupStateObserver
An object that contains information about the system’s ability to start SharePlay
experiences.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

var isEligibleForGroupSession: Bool
A Boolean value that indicates whether the system can start a group session.
var $isEligibleForGroupSession: Published<Bool>.Publisher
ObservableObject
Determining the eligibility for shared activities
Instance Properties
Relationships
Conforms To


