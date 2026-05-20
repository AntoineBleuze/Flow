# 002_com_apple_vm_networking.pdf

## Page 1

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


## Page 2

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


