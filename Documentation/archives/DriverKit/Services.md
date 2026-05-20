# Services.pdf

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


## Page 10

When you activate a system extension from your app, the system requires your extension to have
the proper entitlements and code signature. It must also meet all other criteria for running on the
user’s system. If the extension doesn’t meet all of the requirements, the activation request fails
with an error. During the development of a system extension, you can disable some validation
checks to simplify writing and testing your code.
Important
Always remember to reenable all validation checks and perform additional testing before
shipping your system extension to users. Disabling validation checks is only appropriate during
the development process on your local system.
You must place all system extensions in the Contents/Library/SystemExtensions directo
of your app bundle, and the app itself must be installed in one of the system’s Applications
directories. To allow development of your app outside of these directories, use the
systemextensionsctl command-line tool to enable developer mode. When in developer mod
the system doesn’t check the location of your system extension prior to loading it, so you can load
it from anywhere in the file system. To enable developer mode, open a Terminal window and
execute the following command:
% systemextensionsctl developer on
To turn developer mode off, open Terminal and run the same tool with developer off as the
parameter.
Overview
Enable activation from any directory
DriverKit / Debugging and testing system extensions
Article
Debugging and testing system extensions
Debug your system extensions by temporarily disabling the security checks that
macOS performs during the installation process.


## Page 11

System Integrity Protection (SIP) in macOS prevents unauthorized code from running on your
system. Xcode doesn’t notarize apps or system extensions during the normal development cycle,
so disabling SIP bypasses the notarization checks that the system normally performs, and allows
you to debug your code more quickly.
For information on how to disable SIP, see Disabling and Enabling System Integrity Protection.
Because the system loads system extensions dynamically, attach the debugger to your system
extension’s process after the system launches it. The lldb command-line tool provides a way to
attach to any process and examine its state. To use this tool for your system extension, do the
following:
1. After your system extension launches, run the ps command-line tool and note your extension’s
process ID.
2. Run lldb from Terminal as the superuser.
3. Attach to the process using the process attach --pid command in lldb.
After you attach to your system extension’s process, you can use lldb to examine its threads and
other state information. To view a list of commands available from the lldb command-line tool, r
the tool in Terminal and type help.
Driver extensions (dexts) often coordinate with kernel extensions (kexts) to perform certain tasks
On Apple silicon, kexts use the arm64e architecture, which includes support for pointer
authentication codes (PACs). During your testing cycle, try to build your dext for the arm64e
architecture and address any issues that arise. To test your dext, do the following:
1. Reboot your Mac with Apple silicon into Recovery mode.
2. Set the security level to Medium.
3. Disable System Integrity Protection, as descrbed in Disabling and Enabling System Integrity
Protection.
4. Reboot back to macOS.
5. Add the -arm64e_preview_abi boot arg to your system.
The following example shows you how to use the nvram command-line tool to add the -arm64e
_preview_abi boot arg:
Disable code-signing and notarization checks
Attach the debugger to your system extension
Test your driver extensions on arm64e


## Page 12

Creating a Driver Using the DriverKit SDK
Create a driver that supports proprietary features of your company’s hardware devices.
IOService
The base class for managing the setup and registration of your driver.
See Also
Services


## Page 13

Creating a Driver Using the DriverKit SDK
An IOService object is the base class the system uses to represent all devices and device-
related interfaces. When the user plugs in a device, the system creates one or more service objec
to manage interactions with that device. One service object represents the device itself, and
additional service objects represent the interfaces or communication protocols that the device
supports. For example, the driver for a USB camera that supports multiple video and audio
protocols might define different service objects for each protocol.
When the user plugs in a device, the system looks for the service objects that best match the
device’s capabilities. Apple’s built-in driver families support most device types and a large array o
standard interfaces. You provide custom service objects to support your device’s custom
behaviors.
In most cases, you subclass a child of IOService such as IOUSBHostInterface, instead of
IOService itself. Use the methods of this class to do the following:
Handle the initialization, setup, and teardown of your driver.
View and manage the I/O Registry entry for the device or interface.
Configure the dispatch queue on which to execute your code.
Mentioned in
Overview
DriverKit / IOService
Class
IOService
The base class for managing the setup and registration of your driver.
DriverKit
iOS
iPadOS
macOS


## Page 14

Respond to power-level changes
For additional information about how to implement services for a particular type of device, see the
service subclasses in HIDDriverKit, USBDriverKit, NetworkingDriverKit, SerialDriverKit, and
USBSerialDriverKit.
Don’t declare custom member variables directly in your IOService subclass. Instead, DriverKit
requires you to define all variables in a separate structure. During initialization, allocate a block of
memory for that structure and assign that block to the system-provided ivars variable of your
service class. The following code example shows you how to define the structure and allocate it in
the init method of your service class.
Deallocate any memory that you allocate for your custom variables in the free method of your
class.
Adding Member Variables to Your Custom Subclass
Topics


## Page 15

init
Handles the basic initialization of the service.
Start
Starts the current service and associates it with the specified provider.
Stop
Stops the service associated with the specified provider.
free
Performs any final cleanup for the service.
RegisterService
Starts the registration process for the service and performs any additional matching.
SetName
Sets the name of the service in the system’s registry.
GetRegistryEntryID
Returns the registry ID for the current service.
IOServiceName
A string type for setting the name of the service in the system’s registry.
CopyProperties
Returns the registry properties associated with the current service.
SetProperties
Sends the dictionary of properties to the current service object.
SearchProperty
Searches for a property with the specified name in the current service or one of its parent
services, and returns the corresponding value.
IOPropertyName
Running the Service
Registering the Service with IOKit
Managing the Registry Properties


## Page 16

A string type for specifying the name of a property in the system’s registry.
IORegistryPlaneName
A string type for specifying the name of a plane in the system’s registry.
Search Options
Options to apply when searching for registry properties.
SetDispatchQueue
Associates a custom dispatch queue with the service and assigns the specified name to it.
CopyDispatchQueue
Gets the dispatch queue with the specified name from the current service.
SetPowerState
Updates the service in response to power-related changes for a provider.
ChangePowerState
Changes the device’s power state to the specified level.
Service Power Capabilities
Constants that indicate the power state of a device.
NewUserClient
Requests the creation of a new user client for the service.
Create
Requests the creation of a new service object.
AdjustBusy
ClientCrashed
ConfigureReport
Configuring Additional Dispatch Queues
Responding to Power-Level Changes
Creating a New Service
Instance Methods


## Page 17

CopyName
CopyProviderProperties
CopySystemStateNotificationService
CoreAnalyticsSendEvent
CreateDefaultDispatchQueue
GetBusyState
GetProvider
JoinPMTree
RemoveProperty
RequireMaxBusStall
SetLegend
SetPowerOverride
StateNotificationItemCopy
StateNotificationItemCreate
StateNotificationItemSet
Stop_async
StringFromReturn
Terminate
UpdateReport
CreatePMAssertion
ReleasePMAssertion
CreateKernelClassMatchingDictionary
CreateKernelClassMatchingDictionary
CreateNameMatchingDictionary
CreateNameMatchingDictionary
CreatePropertyMatchingDictionary
Type Methods


## Page 18

CreatePropertyMatchingDictionary
CreateUserClassMatchingDictionary
CreateUserClassMatchingDictionary
OSObject
IOUserClient, IOUserServer
Creating a Driver Using the DriverKit SDK
Create a driver that supports proprietary features of your company’s hardware devices.
Debugging and testing system extensions
Debug your system extensions by temporarily disabling the security checks that macOS
performs during the installation process.
Relationships
Inherits From
Inherited By
See Also
Services


