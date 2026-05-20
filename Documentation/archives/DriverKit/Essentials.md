# Essentials.pdf

## Page 1

Create drivers, system extensions, and kernel extensions for specific low-level system services.
A DriverKit extension (dext) manages the communication between your company’s hardware
device and the rest of the system.
A system extension implements features that require kernel-level cooperation, such as custom
security and network behaviors.
A kernel extension (kext) supports any low-level services that cannot be implemented using a
dext or system extension.
Use the DriverKit SDK and System Extensions framework to implement low-level services whenev
possible. Drivers and system extensions run in user space, instead of inside the kernel’s process
Overview
Kernel / Implementing drivers, system extensions, and kexts
Article
Implementing drivers, system extensions,
and kexts
Create drivers and system extensions to communicate with hardware and provide
low-level services, and only use kernel extensions for a few tasks.


## Page 2

space. Running in user space improves system stability and makes it easier to develop, debug, an
install your code.
The System Extensions framework supports a class of kernel-level features that previously requir
kexts. System extensions run in user space and interact with the kernel to perform specific tasks.
For example, an endpoint-security system extension monitors system events for potential security
threats.
Important
In macOS 11 and later, the kernel doesn’t load a kext if an equivalent System Extension solution
exists. You may continue to use kexts in macOS 10.15 and earlier.
For more information about the types of system extensions you can create, and how to install the
see System Extensions.
A dext contains the drivers you need to communicate with your company’s custom hardware. A
driver provides a layer of services for accessing the hardware. For example, a driver might
configure the device, or it might implement a specific interface for communicating with the device
Because dexts are system extensions, they run in user space and you ship them inside your app
bundle.
When the user attaches a new hardware device to the computer, the kernel searches for any dext
that handle the device. From those dexts, the kernel assembles a series of drivers to communicat
with the device. Each new driver builds upon the capabilities of the previous driver, offering new
services or configuration options.
Apple provides drivers for all standards-based hardware protocols that Mac computers support.
Create custom drivers only for the protocols and features unique to your hardware. You can also
use a codeless dext to map your hardware to one of Apple’s built-in drivers.
Important
In macOS 11 and later, the kernel doesn’t load a kext if an equivalent DriverKit solution exists.
You may continue to use kexts in macOS 10.15 and earlier.
Implement low-level services using system extensions
Communicate with custom hardware using a DriverKit
extension


## Page 3

For information about how to create and install custom drivers, see Creating a Driver Using the
DriverKit SDK.
Not all drivers require actual code. If your hardware communicates entirely using standards-base
protocols, you can ship a driver that matches your hardware to one of the built-in system drivers.
Shipping a codeless driver requires less effort, and lets you select which driver the system uses fo
your hardware.
Ship a codeless driver in one of the following packages:
A codeless dext, in which your driver class has no implementation.
A codeless kext, which has no executable file.
Create a codeless dext when the system provides DriverKit support for your hardware. A codeless
dext isn’t entirely codeless. It contains a minimal executable file with an empty subclass—that is, a
subclass of an existing DriverKit class, where you don’t implement any methods. In the Info
.plist file of your dext, set the value of the IOUserClass key to the name of your custom
subclass. At runtime, the system instantiates your class, but all method calls fall through to the
implementation of the parent class.
In the few cases where your driver requires a kernel extension, use a codeless kext to match your
hardware to the existing system driver. Unlike a DriverKit extension, a codeless kext doesn’t have
an executable file. Instead, its Info.plist file provides all the information that the system need
to match your hardware to a system driver.
For information about how to create and install a dext, see Creating a Driver Using the DriverKit
SDK.
Kexts run inside the kernel and must support the same architecture and restrictions as other kern
code.
Kexts on Apple silicon must support the arm64e architecture. The arm64e architecture includ
pointer authentication codes (PACs) to detect and guard against malicious or accidental
modifications to pointers in memory. The compiler transparently adds and removes PACs to yo
code at compile time, but the addition of PACs may require you to adjust how you handle
pointers in your kexts. For information about supporting PACs, see Preparing your app to work
with pointer authentication.
Kexts run under Kernel Integrity Protection (KIP). After the system initializes the kernel and kex
KIP locks down the kernel memory pages to prevent modifications to kernel and driver code. Fo
more information about KIP, see Kernel Integrity Protection.
Support custom hardware without writing driver code
Build kernel extensions with well-known restrictions


## Page 4

If your custom installer package includes kexts, install them as the final installation step. The
system manages kexts differently in macOS 11 and later, requiring a reboot to finish the installatio
process. As part of the reboot process, users must also explicitly change the security settings of
their computer to allow the kext installation.
For information about the kext installation process, see Installing a custom kernel extension.
Installing a custom kernel extension
Install kernel extensions using a custom installer package, and help users understand the
installation process.
Debugging a custom kernel extension
Configure your system to enable the debugging of custom kernel extensions from a second
Mac.
Generating a Non-Maskable Interrupt
Interrupt the kernel on a target Mac and attach a remote debugger to it.
Install kernel extensions as the final step in an installer
package
See Also
Kernel Extensions


## Page 5

In iPadOS 16 and later, you can develop drivers that run on macOS and iPadOS using DriverKit. Th
DriverKit frameworks provide a safe and secure approach to creating drivers for external USB and
Thunderbolt devices that people can connect to their iPad.
iPadOS 16 supports the core DriverKit framework, as well as the following:
USBDriverKit
PCIDriverKit
AudioDriverKit
Note
DriverKit on iPadOS requires an iPad with an M-series chip.
If you’re creating a new app in Xcode, use the Multiplatform App template when you create your
project in Xcode. The app you create is what people use to install and update your driver on their
macOS and iPadOS devices. To add a driver to your project, add a new target to your project by
choosing DriverKit from the tab bar, and select the Driver target.
Overview
Add a DriverKit target to your Xcode project
DriverKit / Creating drivers for iPadOS
Article
Creating drivers for iPadOS
Bring your drivers to iPadOS by using the platform’s DriverKit support.


## Page 6

If you already have a DriverKit project for macOS, you can support iPadOS by editing your project
settings. Select the project from the Navigator, select the app target, and choose General from th
tab bar. In the Supported Destinations section, use the Add (+) button to add a new iPad
destination.
On macOS, your host app uses the System Extensions framework to install a driver onto the host
system. On iPadOS, this framework is absent, so this step is unneccessary. If you’re writing a driv
to run on both platforms, conditionalize your app code so you only call System Extensions on
macOS.
Install a driver


## Page 7

Because drivers operate with enhanced privileges, a person using the device needs to approve an
driver before it can run. On macOS, they grant this permission in System Settings > Privacy &
Security.
On iPadOS, there are two locations in the Settings app for managing drivers:
If the iPad has at least one driver installed, Settings > General > Drivers lists all available drivers
on the device. A person using the iPad can toggle each driver on or off individually.
If your app contains a Settings bundle, Settings > Your-App-Name > Drivers lists the drivers
installed by your app, with toggles to enable them. Your app needs to prompt the person to
enable the driver in the Settings app.
After receiving permission, the driver runs on-demand. For example, a driver for an audio interfac
only runs when someone connects that hardware to their device.
Some apps need to communicate with a running driver. The sample code project, Communicating
between a DriverKit extension and a client app, provides an example of how to do this.
To allow user clients to connect to your driver, you need specific entitlements, based on the natur
of your driver.
On macOS, use the com.apple.developer.driverkit.userclient-access
entitlement. Provide an array of allowed bundle identifiers as the value of this entitlement. Only
apps with these bundle identifiers can connect to the driver at runtime.
On iPadOS, use the Communicates with Drivers entitlement. This entitlement takes a
Boolean value; set it to YES to allow your user client to connect to drivers.
If your iPadOS driver works with many apps, use the DriverKit Allow Third Party Use
Clients entitlement. Set the Boolean value of this entitlement to YES to allow any app to
connect to your driver.
Implementing drivers, system extensions, and kexts
Create drivers and system extensions to communicate with hardware and provide low-level
services, and only use kernel extensions for a few tasks.
Allow user clients to attach to your driver
See Also
Essentials


## Page 8



