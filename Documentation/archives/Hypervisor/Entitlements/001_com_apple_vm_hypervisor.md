# 001_com_apple_vm_hypervisor.pdf

## Page 1

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


## Page 2

com.apple.vm.device-access
A Boolean value that indicates whether the app captures USB devices and uses them in the
guest-operating system.
com.apple.vm.networking
A Boolean that indicates whether the app manages virtual network interfaces without
escalating privileges to the root user.
com.apple.security.virtualization
A Boolean value that indicates whether your app can use the Virtualization framework.


