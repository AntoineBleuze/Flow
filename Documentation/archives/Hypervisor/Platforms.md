# Platforms.pdf

## Page 1

func hv_vm_config_create() -> hv_vm_config_t
Creates a virtual machine configuration object.
func hv_vm_create(hv_vm_options_t) -> hv_return_t
Creates a VM instance for the current process.
func hv_vm_destroy() -> hv_return_t
Destroys the VM instance associated with the current process.
protocol OS_hv_vm_config
Creates a virtual machine configuration object.
typealias hv_vm_config_t
The type that defines a virtual-machine configuration.
vCPU Management
Create and run virtual CPUs, and manage CPU-specific registers and features.
Memory management
Map memory into the physical address space of the virtual machine.
Topics
Virtual machine management
Resource management
Hypervisor / Apple Silicon
API Collection
Apple Silicon
Create and run virtual machines on Apple silicon.


## Page 2

func hv_vcpu_get_vtimer_mask(hv_vcpu_t, UnsafeMutablePointer<Bool>) ->
hv_return_t
Gets the virtual timer mask.
func hv_vcpu_set_vtimer_mask(hv_vcpu_t, Bool) -> hv_return_t
Sets or clears the virtual timer mask.
func hv_vcpu_get_vtimer_offset(hv_vcpu_t, UnsafeMutablePointer<UInt64>)
-> hv_return_t
Returns the vTimer offset for the vCPU ID you specify.
func hv_vcpu_set_vtimer_offset(hv_vcpu_t, UInt64) -> hv_return_t
Sets the vTimer offset to a value that you provide.
typealias hv_return_t
The return type of framework functions.
Hypervisor Errors
Return codes returned by framework functions.
func hv_vm_config_get_el2_supported(UnsafeMutablePointer<Bool>) -> hv
_return_t
Returns a status value that indicates whether the current platform supports Exception Level 
(EL2).
func hv_vm_config_get_el2_enabled(hv_vm_config_t, UnsafeMutablePointer<
Bool>) -> hv_return_t
Return a status value that indicates whether the VM configuration enables support for
Exception Level 2 (EL2).
func hv_vm_config_set_el2_enabled(hv_vm_config_t, Bool) -> hv_return_t
Sets whether the specified VM configuration enables support for Exception Level 2 (EL2).
Timer functions
Common data types
Nested virtualization
Generic interrupt controllers (GICs)


## Page 3

GIC functions
These functions and registers support the creation and operation of a generic interrupt
controller.
GIC registers
These registers support the operation of a generic interrupt controller and its interface with
the Hypervisor and virtual CPUs.
Intel-based Mac
Create and run virtual machines on Intel-based Mac computers.
See Also
Platforms


## Page 4

func hv_vm_create(hv_vm_options_t) -> hv_return_t
Creates a VM instance for the current process.
func hv_vm_destroy() -> hv_return_t
Destroys the VM instance associated with the current process.
func hv_capability(hv_capability_t, UnsafeMutablePointer<UInt64>) -> hv
_return_t
Gets the value of capabilities of the system.
typealias hv_vm_options_t
Options you use when creating a virtual machine.
typealias hv_capability_t
The type of system capabilities.
vCPU Management
Create and run virtual CPUs, and manage CPU-specific registers and features.
Memory Management
Map memory into the physical address space of the virtual machine, and allocate additional
memory for the current task.
Topics
Virtual machine management
Resource management
Hypervisor / Intel-based Mac
API Collection
Intel-based Mac
Create and run virtual machines on Intel-based Mac computers.


## Page 5

Virtual Machine Control Structure (VMCS)
Read and write to fields of the virtual machine control structure.
func hv_vm_add_pio_notifier(UInt16, Int, UInt32, mach_port_t, hv_ion
_flags_t) -> hv_return_t
Generate a notification when the Hypervisor issues a matching guest port I/O.
func hv_vm_remove_pio_notifier(UInt16, Int, UInt32, mach_port_t, hv_ion
_flags_t) -> hv_return_t
Removes an existing I/O notifier that matches the specifications you provide.
struct hv_ion_message_t
The structure that describes the Mach message that the Hypervisor sends when an I/O
notifier delivers the notifications you request.
typealias hv_ion_flags_t
The bitfield that you use to set the options flags for the I/O notifier.
I/O Notifier Flags
Flags that you set to choose the kind of information the I/O Notifier delivers.
func hv_tsc_clock() -> UInt64
Returns the value of an abstract clock.
func hv_vcpu_set_tsc_relative(hv_vcpuid_t, Int64) -> hv_return_t
Sets the offset of the guest timestamp-counter (TSC) relative to the Hypervisor’s TSC clock
typealias hv_return_t
The return type of framework functions.
Hypervisor Errors
Errors returned by Hypervisor functions.
I/O notifier functions
Time-stamp counter functions
Common data types


## Page 6

Apple Silicon
Create and run virtual machines on Apple silicon.
See Also
Platforms


