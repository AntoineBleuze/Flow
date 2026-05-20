# 001_HIDDeviceManager.pdf

## Page 1

Communicating with human interface devices
Use this class to specify matching criteria to filter all of the discoverable devices connected to the
system into devices of interest. This is the main method of receiving a HIDDeviceClient
.DeviceReference used to create a HIDDeviceClient.
Matching criteria are specified by creating HIDDeviceManager.DeviceMatchingCriteria
and passing them to monitorNotifications(matchingCriteria:). References to device
that match the criteria are received using HIDDeviceManager.Notification.device
Matched(_:) notifications.
init()
Creates a matching service for HID devices.
Mentioned in
Overview
Topics
Create a device manager
Core HID / HIDDeviceManager
Class
HIDDeviceManager
A helper for discovering human interface devices (HID) connected to the system.
macOS 15.0+


## Page 2

func monitorNotifications(matchingCriteria: [HIDDeviceManager.Device
MatchingCriteria]) -> AsyncThrowingStream<HIDDeviceManager.Notification
any Error>
Creates an asynchronous stream that receives notifications for devices of interest.
enum Notification
Notifications for HID devices.
struct DeviceMatchingCriteria
Matching criteria used to filter HID devices.
Actor
Copyable
Equatable
Hashable
Sendable
SendableMetatype
Discovering HID devices from Terminal
Identify devices connected to your Mac from the command line.
struct DeviceMatchingCriteria
Monitor device notifications
Structures
Relationships
Conforms To
See Also
Discovery


## Page 3

Matching criteria used to filter HID devices.


