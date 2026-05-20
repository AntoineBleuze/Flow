# 000_Creating a Driver Using the DriverKit SDK.pdf

## Page 1

Drivers act as a bridge between computer peripherals and the rest of the system. A driver is a
collection of software-based services that communicate with a hardware device. For example, a
keyboard service converts the raw state of the keyboard into keystroke events for the system to
deliver to apps.
When the user plugs in a hardware device, the system loads an initial service to communicate wit
the device and get basic information from it. After it establishes communication, the system loads
additional services to handle device-specific interactions. For example, the system might load a
service to communicate with a USB device using a specific protocol. Each new service becomes a
client of the previous service, which is known as the provider for the client.
Overview
DriverKit / Creating a Driver Using the DriverKit SDK
Article
Creating a Driver Using the DriverKit SDK
Create a driver that supports proprietary features of your company’s hardware
devices.


## Page 2

Apple supplies drivers and services for all standard hardware devices and communication
protocols, including USB, Thunderbolt, Peripheral Component Interconnect (PCI), and more. Appl
also provides drivers and services for the most common human interface device (HID) types,
including mice and keyboards. You create custom drivers and services to support proprietary
features or unique behaviors for your devices. You package your custom driver services inside a
DriverKit extension.
Use the DriverKit SDK to create custom drivers and services for the following types of devices an
interfaces:
Most USB devices
HID devices
PCI cards and devices
Devices with serial communication interfaces
Important
DriverKit doesn’t support USB devices that manipulate audio or that communicate wirelessly
over Bluetooth or Wi-Fi. For those types of devices, create a kernel extension using sys
_iokit.


## Page 3

The delivery of a DriverKit extension requires a macOS app. You use the app to deliver the driver t
your users. The app also registers the driver with the system.
Xcode provides a template for DriverKit extensions. To add one to your existing app, do the
following:
1. Open your app project in Xcode.
2. Select File > New > Target.
3. Navigate to the DriverKit section.
4. Select DriverKit Driver.
5. Specify the driver’s name and configure other details about your driver.
Xcode adds the driver to your project and configures the build settings to install that driver inside
the Contents/Library/SystemExtensions folder of your app’s bundle.
Important
The system requires all DriverKit drivers to be in the Contents/Library/System
Extensions folder of your app’s bundle, and fails to load drivers that aren’t there. If you
create your driver separately from your app, be sure to configure your build scripts to place the
driver in that specific location.
The default DriverKit template contains a C++ source file and an IOKit interface generator (.iig)
header file to use as the starting point for your service. The template also contains a default
entitlements file for you to populate with the entitlements your driver requires. For information on
how to configure your driver’s entitlements, see Requesting Entitlements for DriverKit
Development.
The DriverKit template provides a default subclass of the IOService class, which is the base
class for all driver services. Although you can subclass IOService directly, typically you build of
of a class that is more specific to your needs. For example, when developing drivers for USB
devices, you build off one of the classes in the USBDriverKit framework.
The services you create embody one of two roles:
An interface service manages information moving to and from the device.
A device service supports communication with the hardware.
Add a DriverKit Extension Target to Your App
Select an Appropriate Service to Customize


## Page 4

Create interface services for devices that communicate using standards-based protocols, such a
USB, but which require interpretation or management of the resulting data. An interface service
reads and writes data, processes that data, and does something useful with it. For example, a HID
interface service processes input reports from a HID device and dispatches events to the system
Interface classes include IOUserHIDEventService, IOHIDInterface, IOUserSerial, and
IOUserNetworkEthernet.
Create device services to support custom communication protocols or custom hardware features
Apple provides device services for all standard protocols and hardware types. For example, the
IOUSBHostDevice class reads and writes data from any USB device. You create device service
to support custom devices or to configure devices so that the system can use them. Device
classes include IOUSBHostDevice, IOHIDDevice, and IOPCIDevice.
In your project’s .iig file, change the superclass of your custom service to your preferred servic
class. For example, to define a custom interface for a USB networking device, subclass IOUser
NetworkEthernet as shown in the following code.
When the system needs your driver, it instantiates your service class and calls its init method.
Keep the implementation of that method as simple as possible. Typically, the only thing you do at
initialization time is allocate space for your driver’s variables.
Your service subclass must not contain any member variables. Instead, define a structure
containing the variables your driver requires, and allocate that structure at initialization time. The
following code example shows the init method for a HID keyboard driver, which is a subclass of
the IOUserHIDEventService class. The driver stores a subset of the event services elements
a custom array that it then stores in the HIDKeyboardDriver_IVars structure. At initialization
time, the init> method allocates space for this structure and assigns it to the inherited ivars
member variable.
Initialize Your Driver


## Page 5

Before unloading your service, the system calls its free method to release any memory that it hold
Use that method to deallocate any data structures you created during initialization.
When the system is ready for your driver to begin processing information from the hardware
device, it calls your service’s Start method. The Start method is where you perform the actua
startup tasks your driver requires, such as:
Initialize your custom instance variables structure.
Fetch the device’s configuration and change any settings.
Set up pipes and other communication channels with the device.
Store a reference to the provider object that the system passed to your Start method.
Allocate memory for data buffers.
Fetch the initial set of data.
Create and register callback methods.
Upon the succesful completion of your service’s startup tasks, call the inherited Register
Service method to let the system know that your service is running. The following code shows a
template Start method for you to use for your own services.
Start and Stop Your Service


## Page 6

In the preceding code, notice that the definition of the Start method uses the IMPL macro.
DriverKit services run in separate user processes, but communicate with the kernel. The IMPL
macro provides the kernel with the bridging code it needs to call into your driver’s process.
Similarly, the SUPERDISPATCH macro provides the reverse bridging that you need to call the
inherited Start method, which runs in the kernel.
When the system no longer needs your service, it calls its Stop method. Use that method to undo
all of the setup work from your Start method. If your service has any in-progress asynchronous
tasks, cancel them and wait for DriverKit to report their successful cancellation before calling the
inherited Stop method. Don’t use the Stop method to release your ivars structure; use your
service’s free method instead.
Whenever you request information from DriverKit or a device, the system APIs process that reque
and deliver the results asynchronously to your service class. All asynchronous requests require an
OSAction object, which tells the system which method of your service class to call. To create an
OSAction object:
1. Define a custom method in your service class, and give the method the same signature as a
DriverKit asynchronous callback function.
2. Add the TYPE macro to the end of your custom method, specifying the DriverKit class and
method name as the macro’s parameter.
Define Asynchronous Callback Functions


## Page 7

3. Create the OSAction object using the CreateAction method the TYPE macro generates.
To illustrate the process, consider the DataAvailable callback function of IODataQueue
DispatchSource. The system calls this method when new data appears on the specified queue
object. To implement your own version of this method, create a definition in your .iig file similar
the following:
Use any name you want for your method, but make sure its return type and parameters match
those of the original method—the DataAvailable method in this example. Add the TYPE macro
to the end of the declaration, passing the DriverKit class and method name as shown. The TYPE
macro generates a function whose name is the prefix “CreateAction” followed by your custom
method name. For the TxPacketsAvailable method, the macro creates the CreateActionT
PacketsAvailable function. Use this function to create the corresponding OSAction object, 
shown in the following code:
The first parameter to the CreateAction function is the amount of additional memory you want
the system to allocate on your behalf. Use this memory to store additional state information, and
access the memory by calling the GetReference method of the action object. The second
parameter is a pointer for storing the newly created OSAction object.
The system requires specific information to support the loading and installation of your driver.
Specifically, installation of your driver fails if any of the following keys aren’t in the Info.plist f
of your driver extension:
CFBundleShortVersionString
CFBundleVersion
OSBundleUsageDescriptionKey
The system uses the version information to determine when to install a new version of your driver
Increment the version number whenever you change your driver’s behavior and want to install a
new version.
Provide Version and Description Information


## Page 8

The system maintains a registry of installed drivers, and each driver contains information about th
types of devices it supports. At boot time, and whenever a new hardware device appears, the
system searches for drivers to support that device. In particular, it searches for drivers that meet
the following criteria:
Supports the appropriate class of hardware (USB, PCI, Thunderbolt)
Supports the vendor that created the device
Supports the protocols or interfaces (HID, Mass Storage) listed in the device’s configuration da
During its search for drivers, the system uses information from the IOKitPersonalities key o
each driver’s Info.plist file to identify potential matches. This key contains a dictionary of the
driver’s personalities—that is, the types of devices it supports. Each key in the dictionary is a
descriptive name of the personality, and the value is another dictionary of keys that describe the
specific personality. Include the following minimum set of keys for each personality:
CFBundleIdentifier—The bundle ID of your driver
IOClass—The Apple class containing the base behavior
IOUserClass—The name of your custom service class
IOUserServerName—The bundle identifier of your driver
IOProviderClass—The class that your service requires as its provider object
In addition to the minimum set of keys, include additional keys in the personality dictionary that ar
specific to your IOService subclasses. For example, a personality for an IOUserHIDEvent
Service subclass include the VendorID, ProductID, PrimaryUsagePage, and Primary
Usage keys to indicate the device type and manufacturer information. This information helps the
system find the most appropriate match for a specific device.
After the matching process identifies an appropriate driver, it loads the driver, initializes it, and ca
its Start method. Typically, the system instantiates multiple services for a single device, with ea
new service becoming a client of the previous service. This chain of services allows each service 
handle specific tasks and rely on its provider object for lower-level tasks.
DriverKit extensions reside inside your app’s Contents/Library/SystemExtensions folder,
and you register them using the Systems Extension framework. You must register drivers before
the system can use them. During the registration process, the system validates the driver and
reports back to your app about whether registration was successful.
Specify Criteria for Matching Your Services Against
Devices
Install Your Driver Using the System Extensions Framework


## Page 9

For information about how to install your driver, see Installing System Extensions and
Drivers.
Debugging and testing system extensions
Debug your system extensions by temporarily disabling the security checks that macOS
performs during the installation process.
IOService
The base class for managing the setup and registration of your driver.
See Also
Services


