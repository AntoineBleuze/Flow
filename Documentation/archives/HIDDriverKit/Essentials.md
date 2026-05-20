# Essentials.pdf

## Page 1

Type
Boolean
This entitlement gives your driver permission to interact with the hardware for a human interface
device.
com.apple.developer.driverkit.family.hid.device
A Boolean value that indicates whether the driver provides a HID-related service to the
system.
com.apple.developer.driverkit.family.hid.eventservice
A Boolean value that indicates whether the driver provides a HID-related event service to the
system.
Details
Discussion
See Also
Human Interface Device Drivers
Bundle Resources / Entitlements / com.apple.developer.driverkit.transport.hid
Property List Key
com.apple.developer.driverkit.transport
.hid
A Boolean value that indicates whether the driver communicates with human
interface devices.
macOS 10.15+


## Page 2

DriverKit Family virtual HID
An entitlement that lets an app create and manage virtual HID devices.
Key: com.apple.developer.driverkit.family.hid.virtual.device
com.apple.developer.hid.virtual.device
A Boolean value that indicates whether the driver creates a virtual HID device.


## Page 3

The human interface device (HID) specification defines how hardware, such as keyboards and
mice, communicates information to a host computer. HID hardware comes in a variety of types, an
corresponds to an expected type of usage. Each device communicates this usage information,
along with data values, to the host computer. A driver processes the data and uses it to dispatch
relevant events to the operating system.
The HIDKeyboardDriver sample implements an event service that processes keyboard-related
data. The event service is a subclass of IOUserHIDEventService, which processes the
incoming device data and turns it into a set of easily accessible element objects. The sample
iterates over these objects looking for changes to the data. For example, when the user presses o
releases a key, the keyboard reports that change to the sample’s event service. The sample
forwards the data to the system as part of an event, which the system then dispatches to relevant
apps.
For details about working with HID hardware, see the HID specification at https://www.usb.org/.
You can’t use automatic code signing for this sample app. You must create an explicit App ID and
provisioning profile, and your provisioning profile must contain the following set of entitlements:
`com.apple.developer.driverkit.family.hid.eventservice`
Overview
Configure the Sample Code Project
HIDDriverKit / Handling Keyboard Events from a Human Interface Device
Sample Code
Handling Keyboard Events from a Human
Interface Device
Process keyboard-related data from a human interface device and dispatch event
to the system.
Download
DriverKit 19.0+
macOS 10.15+
Xcode 12.0+


## Page 4

`com.apple.developer.driverkit.transport.hid`
`com.apple.developer.driverkit`
Request these entitlements from Apple, and use them to configure a provisioning profile for the
sample. See Requesting Entitlements for DriverKit Development.
To test this sample with custom keyboard hardware, update the IOKitPersonalities dictiona
in the driver’s Info.plist file. The HIDKeyboardDriver personality contains hypothetical
values of the kind of keys to include. Change the values of the VendorID and ProductID keys t
match values from your own custom hardware. You can also change the PrimaryUsagePage an
PrimaryUsage keys to support different device usages. Leave the other keys unchanged.
The normal installation of a DriverKit extension includes security checks to validate the DriverKit
extension. During development, you typically disable these checks to speed up the turnaround tim
for your builds. Disable these checks for the sample app by doing the following:
1. Disable system integrity protection (SIP) on your system.
2. Run systemextensionsctl developer on from Terminal to enable developer mode.
Enabling developer mode allows you to run and debug the HIDKeyboardApp in place, without
moving it to one of your system’s Applications folders. You must also disable SIP to skip the
notarization checks that normally occur when installing DriverKit extensions. HIDKeyboardApp
attempts to install the HIDKeyboardDriver extension at launch time. When installation is successfu
the system asks you to open Security & Privacy system preferences. In the General tab, allow the
system to install the driver.
After you install the DriverKit extension, you can verify its installation by running the
systemextensionsctl list command in Terminal. You can also use that tool to uninstall you
extension or reset the state of your system extensions.
Note: If an error occurs during the installation process, the app writes an appropriate error
message to the Xcode console. If you get an unknown error, verify that the
OSBundleUsageDescription key in the driver’s Info.plist file has the correct spelling.
For additional information, see Debugging and Testing System Extensions.
After matching an event service to a device, the system calls the Start method of that service.
The Start method verifies that the event service is able to run, and puts it into the running state
The Start method of HIDKeyboardDriver performs three tasks:
1. It calls the Start method of its parent class.
2. It calls the getElements method to create the initial set of IOHIDElement objects.
3. It caches the subset of element objects that contain keyboard data.
Start Up the Event Service


## Page 5

After each step, the Start method checks the result to see if the step was successful. If any step
fails, the sample calls the inherited Stop method to stop the event service. For example, it stops
the event service if it is unable to retrieve the element objects or if none of the objects contains
keyboard data.
Notice that the implementation of the Start method includes the IMPL macro instead of the
normal list of parameters. This macro provides binding between the kernel (which calls the
method), and the method itself (which runs in user space). The SUPERDISPATCH macro provides
similar binding in the other direction. The sample uses it to call inherited methods that run in the
kernel, such as the Start method of IOUserHIDEventService.
The IOUserHIDEventService class automatically handles incoming reports from the device,
turning the raw bytes of the report into a set of IOHIDElement objects. Each element object
contains details about a particular piece of data that the device supports. For example, some
elements from a keyboard contain the current state of a specific key.
At startup, the sample calls parseKeyboardElement for all relevant element objects. That
method checks the HID-defined usage value for each element, and saves a reference to all
keyboard elements. During subsequent parsing, the event service examines only the objects in its
cached collections, instead of all element objects.
Identify Keyboard-Related Elements


## Page 6

When HID hardware detects changes in its state, it reports the details of those changes to the
system. When the system receives a new report from the device, it forwards that report to the
relevant drivers. In a custom subclass of IOUserHIDEventService, the handleReport meth
receives the report data and processes it.
The HIDKeyboardDriver class overrides handleReport and dispatches new reports
immediately to its custom handleKeyboardReport method. This custom method iterates over
the array of cached keyboard elements and uses each element’s timestamp and report ID to
determine whether the element contains new data. If it does, the handleKeyboardReport
method calls the inherited dispatchKeyboardEvent method to dispatch the event information
to the system.
Dispatch a Keyboard Event Using the Element Data


## Page 7

Unlike other inherited methods, the IOHIDEventService class defines the dispatchKeyboar
Event method as a local method to the driver. Because it is a local method, the sample doesn’t
use the SUPERDISPATCH macro to call it.
com.apple.developer.driverkit.transport.hid
A Boolean value that indicates whether the driver communicates with human interface
devices.
Handling Stylus Input from a Human Interface Device
Process stylus-related input from a human interface device and dispatch events to the
system.
See Also
Essentials


## Page 8

The human interface device (HID) specification defines how hardware, such as keyboards and
mice, communicates information to a host computer. HID hardware comes in a variety of types, an
corresponds to an expected type of usage. Each device communicates this usage information,
along with data values, to the host computer. A driver processes the data and uses it to dispatch
relevant events to the operating system.
The HIDStylusDriver sample implements an event service that processes input from a drawing
stylus, such as Apple Pencil. The event service is a subclass of IOUserHIDEventService, whic
processes the incoming device data and turns it into a set of easily accessible element objects. T
sample iterates over these objects looking for changes to the data. For example, when the user
moves the stylus or changes its twist or tilt, the stylus reports that change to the sample’s event
service. The sample forwards the data to the system as part of an event, which the system then
dispatches to relevant apps.
For details about working with HID hardware, see the HID specification at https://www.usb.org/.
You can’t use automatic code signing for this sample app. You must create an explicit App ID and
provisioning profile, and your provisioning profile must contain the following set of entitlements:
`com.apple.developer.driverkit.family.hid.eventservice`
Overview
Configure the Sample Code Project
HIDDriverKit / Handling Stylus Input from a Human Interface Device
Sample Code
Handling Stylus Input from a Human
Interface Device
Process stylus-related input from a human interface device and dispatch events t
the system.
Download
DriverKit 19.0+
macOS 10.15+
Xcode 12.0+


## Page 9

`com.apple.developer.driverkit.transport.hid`
`com.apple.developer.driverkit`
Request these entitlements from Apple, and use them to configure a provisioning profile for the
sample. See Requesting Entitlements for DriverKit Development.
To test this sample with custom stylus hardware, update the IOKitPersonalities dictionary i
the driver’s Info.plist file. The HIDStylusDriver personality contains hypothetical values o
the kind of keys to include. Change the values of the VendorID and ProductID keys to match
values from your own custom hardware. You can also change the PrimaryUsagePage and
PrimaryUsage keys to support different device usages. Leave the other keys unchanged.
The normal installation of a DriverKit extension includes security checks to validate the DriverKit
extension. During development, you typically disable these checks to speed up the turnaround tim
for your builds. Disable these checks for the sample app by doing the following:
1. Disable system integrity protection (SIP) on your system.
2. Run systemextensionsctl developer on from Terminal to enable developer mode.
Enabling developer mode allows you to run and debug the StylusApp in place, without moving it t
one of your system’s Applications folders. You must also disable SIP to skip the notarization chec
that normally occur when installing DriverKit extensions. StylusApp attempts to install the
HIDStylusDriver extension at launch time. When installation is successful, the system asks you to
open Security & Privacy system preferences. In the General tab, allow the system to install the
driver.
After you install the DriverKit extension, you can verify its installation by running the
systemextensionsctl list command in Terminal. You can also use that tool to uninstall you
extension or reset the state of your system extensions.
Note: If an error occurs during the installation process, the app writes an appropriate error
message to the Xcode console. If you get an unknown error, verify that the
OSBundleUsageDescription key in the driver’s Info.plist file has the correct spelling.
For additional information, see Debugging and Testing System Extensions.
After matching an event service to a device, the system calls the Start method of that service.
The Start method verifies that the event service is able to run, and puts it into the running state
The Start method of HIDStylusDriver performs three tasks:
1. It calls the Start method of its parent class.
2. It calls the getElements method to create the initial set of IOHIDElement objects.
3. It caches the subset of element objects that contain stylus data.
Start Up the Event Service


## Page 10

After each step, the Start method checks the result to see if the step was successful. If any step
fails, the sample calls the inherited Stop method to terminate the event service. For example, it
stops the event service if it is unable to retrieve the element objects or if none of the objects
contains stylus data.
Notice that the implementation of the Start method includes the IMPL macro instead of the
normal list of parameters. This macro provides binding between the kernel (which calls the
method), and the method itself (which runs in user space). The SUPERDISPATCH macro provides
similar binding in the other direction. The sample uses it to call inherited methods that run in the
kernel, such as the Start method of IOUserHIDEventService.
The IOUserHIDEventService class automatically handles incoming reports from the device,
turning the raw bytes of the report into a set of IOHIDElement objects. Each element object
contains details about a particular piece of data that the device supports. For example, some
elements from a stylus contain the position of the stylus, its tilt, or the amount of pressure at its ti
At startup, the sample calls parseDigitizerElement for all relevant element objects. That
method collects the related elements for a specific type of device input. Although the sample
normally handles stylus input, it can also handle touch input. During subsequent parsing, the even
service examines only the objects in its cached collections, instead of all element objects.
Identify Stylus-Related Elements


## Page 11



## Page 12



## Page 13

When HID hardware detects changes in its state, it reports the details of those changes to the ho
computer. The host forwards each new report to the relevant drivers for handling. In a custom
subclass of IOUserHIDEventService, the handleReport method receives the report data a
processes it. For example, a driver might use custom data provided by the device to dispatch a
modified event to the system.
The HIDStylusDriver class dispatches events as-is to the system. Upon receiving a report, th
sample iterates over the cached elements and calls the createStylusDataForDigitizer
Collection method for each one. That method determines whether the element contains new
data, and returns a valid structure if it does.
Dispatch an Event When the Stylus Data Changes


## Page 14

Unlike other inherited methods, the dispatchDigitizerStylusEvent method of
IOHIDEventService runs locally in the driver’s process space, not in the kernel. DriverKit
annotates such methods by appending the LOCAL or LOCALONLY macro to the method definition
When calling such methods, the sample uses the standard calling semantics for inherited method
and doesn’t include the SUPERDISPATCH macro.
com.apple.developer.driverkit.transport.hid
A Boolean value that indicates whether the driver communicates with human interface
devices.
Handling Keyboard Events from a Human Interface Device
Process keyboard-related data from a human interface device and dispatch events to the
system.
See Also
Essentials


