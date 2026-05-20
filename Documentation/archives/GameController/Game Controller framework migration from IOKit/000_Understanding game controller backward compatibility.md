# 000_Understanding game controller backward compatibility.pdf

## Page 1

Many existing games and third-party input libraries use the IOKit framework to interface with
hardware game controllers. Because the IOKit APIs facilitate communication with hardware only a
a low level, you need to write device-specific code for each game controller your app supports.
This is often just for one or two popular models, so someone with a different controller model may
become frustrated to discover that your app doesn’t recognize their game controller.
macOS 14 introduces a human-interface device (HID) emulation layer for apps that use the IOKit
HID APIs to discover and receive input from game controllers. It emulates basic inputs from the fu
roster of controllers that the Game Controller framework supports. This HID emulation is mostly
transparent to your app, and it works with all apps that interface with game controllers using the
APIs in IOHIDManager.h. However, your app may need to determine whether an IOHIDDeviceRe
refers to a HID device that the emulation layer synthesizes, or your app may need to prevent
matching on all such devices.
When you connect a game controller that the Game Controller framework supports to a Mac
running macOS 14 or later, the system creates a synthetic HID device in the I/O registry. There ca
only be one synthetic HID device per connected game controller. If the game controller is HID-
compatible, the system creates the corresponding synthetic HID device in the I/O registry
alongside the HID device for the game controller. The characteristics of each synthetic HID device
match those of a well-supported game controller, the Xbox 360 wired controller.
Overview
Understand the operation of game controller synthetic HID
devices
Game Controller / Understanding game controller backward compatibility
Article
Understanding game controller backward
compatibility
Learn how macOS brings support for the latest game controllers to software that
predates the introduction of the Game Controller framework.


## Page 2

When your app calls IOHIDDeviceOpen on an IOHIDDeviceRef that refers to a synthetic HID
device in the kernel, the Game Controller framework checks if the emulation layer is enabled. If th
emulation layer is enabled, the Game Controller framework begins translating input events from th
real game controller into the equivalent input events that an Xbox 360 wired controller produces. 
the emulation layer is not enabled, calling IOHIDManagerCopyDevices doesn’t return any gam
controller synthetic HID devices, and attempting to directly instantiate an IOHIDDeviceRef with
an io_service_t that refers to a game controller synthetic HID device fails.
The emulation layer is disabled by default. People can enable it for your game in the system game
controller settings by adding a game-specific input customization, and enabling the “Increase
controller compatibility” switch.
When your app uses the APIs in IOHIDManager.h or IOKitLib.h to query the HID devices in
the I/O registry, game controller synthetic HID devices that match your specified criteria also
return. Each game controller synthetic HID device contains a GCSyntheticDevice property wit
a value of true in its I/O registry entry property table. Your app can check for the presence of thi
key to determine whether an IOHIDDeviceRef or an io_service_t refers to a game controlle
synthetic HID device.
Important
Checking for the presence of the GCSyntheticDevice property is the only supported way to
determine whether a HID device is a game controller synthetic HID device.
The Game Controller framework defines the kIOHIDGCSyntheticDeviceKey constant. If you
can’t import the Game Controller framework into your code, you can specify the “GCSynthetic
Device” string directly.
To prevent matching on game controller synthetic HID devices, add the kIOHIDGCSynthetic
DeviceKey with a value of kCFBooleanFalse to the matching criteria your code passes to
IOHIDManagerSetDeviceMatching, IOServiceGetMatchingServices(_:_:_:), or
similar APIs.
Discover and identify game controller synthetic HID
devices


## Page 3

var kIOHIDGCSyntheticDeviceKey: String
A key that specifies whether the device is a game controller synthetic HID device.
See Also
Game Controller framework migration from IOKit


