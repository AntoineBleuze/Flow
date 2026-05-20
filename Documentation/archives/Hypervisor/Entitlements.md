# Entitlements.pdf

## Page 1

Type
Boolean
The entitlement is required to use the Hypervisor APIs in any process.
Important
If your app has a deployment target of macOS 10.15 or earlier, add the com.apple.vm
.hypervisor entitlement to your app in addition to this entitlement.
com.apple.vm.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
Deprecated
Details
Discussion
See Also
Hypervisor
Bundle Resources / Entitlements / com.apple.security.hypervisor
Property List Key
com.apple.security.hypervisor
A Boolean value that indicates whether the app creates and manages virtual
machines.
macOS 11.0+


## Page 2

com.apple.vm.device-access
A Boolean value that indicates whether the app captures USB devices and uses them in the
guest-operating system.
com.apple.vm.networking
A Boolean that indicates whether the app manages virtual network interfaces without
escalating privileges to the root user.
com.apple.security.virtualization
A Boolean value that indicates whether your app can use the Virtualization framework.


## Page 3

Deprecated
For apps with a deployment target of macOS 11 and later, use com.apple.security
.hypervisor instead. For deployment targets earlier than macOS 11, add both that and the
com.apple.vm.hypervisor entitlement to your app.
Type
Boolean
The entitlement is required to use the Hypervisor APIs in a sandboxed process.
com.apple.security.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
Details
Discussion
See Also
Hypervisor
Bundle Resources
/ com.apple.vm.hypervisor Deprecated
Property List Key
com.apple.vm.hypervisor Deprecated
A Boolean value that indicates whether the app creates and manages virtual
machines.
macOS 10.10–11.0 Deprecated
/


## Page 4

com.apple.vm.device-access
A Boolean value that indicates whether the app captures USB devices and uses them in the
guest-operating system.
com.apple.vm.networking
A Boolean that indicates whether the app manages virtual network interfaces without
escalating privileges to the root user.
com.apple.security.virtualization
A Boolean value that indicates whether your app can use the Virtualization framework.


## Page 5

Type
Boolean
Default: NO
The entitlement is required to use the vmnet APIs.
Note
This entitlement is restricted to developers of virtualization software. To request this
entitlement, contact your Apple representative.
Details
Attributes
Discussion
See Also
Hypervisor
Bundle Resources / Entitlements / com.apple.vm.networking
Property List Key
com.apple.vm.networking
A Boolean that indicates whether the app manages virtual network interfaces
without escalating privileges to the root user.
macOS 10.10+


## Page 6

com.apple.security.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
com.apple.vm.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
Deprecated
com.apple.vm.device-access
A Boolean value that indicates whether the app captures USB devices and uses them in the
guest-operating system.
com.apple.security.virtualization
A Boolean value that indicates whether your app can use the Virtualization framework.


## Page 7

Type
Boolean
Default: NO
The entitlement is required to use the IOUSBHost APIs for USB device capture.
com.apple.security.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
com.apple.vm.hypervisor
A Boolean value that indicates whether the app creates and manages virtual machines.
Deprecated
Details
Attributes
Discussion
See Also
Hypervisor
Bundle Resources / Entitlements / com.apple.vm.device-access
Property List Key
com.apple.vm.device-access
A Boolean value that indicates whether the app captures USB devices and uses
them in the guest-operating system.
macOS 10.10+


## Page 8

com.apple.vm.networking
A Boolean that indicates whether the app manages virtual network interfaces without
escalating privileges to the root user.
com.apple.security.virtualization
A Boolean value that indicates whether your app can use the Virtualization framework.


