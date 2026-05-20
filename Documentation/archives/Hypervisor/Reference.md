# Reference.pdf

## Page 1

These structures allow you to interact with or control specific aspects of the operation of the
Hypervisor.
struct hv_cache_type_t
The structure that describes an instruction or data cache element.
struct hv_vcpu_exit_exception_t
The structure that describes information about an exit from the virtual CPU (vCPU) to the
host.
struct hv_apic_ctrl_t
struct hv_apic_intr_trigger_t
struct hv_apic_lvt_flavor_t
struct hv_apic_state
struct hv_apic_state_ext_t
struct hv_atpic_state
struct hv_atpic_state_ext_t
struct hv_gic_distributor_reg_t
Overview
Topics
Structures
Hypervisor / Hypervisor Structures
API Collection
Hypervisor Structures


## Page 2

struct hv_gic_icc_reg_t
struct hv_gic_ich_reg_t
struct hv_gic_icv_reg_t
struct hv_gic_intid_t
struct hv_gic_msi_reg_t
struct hv_gic_redistributor_reg_t
struct hv_ioapic_state
struct hv_ioapic_state_ext_t
struct hv_sme_p_reg_t
struct hv_sme_z_reg_t
struct hv_vcpu_sme_state_t
struct hv_vm_exitinfo_t
Hypervisor Constants
Hypervisor Functions
Hypervisor Data Types
See Also
Reference


## Page 3

var HV_ALLOCATE_DEFAULT: Int
var HV_APIC_CTRL_DEFAULT: hv_apic_ctrl_t
var HV_APIC_CTRL_EOI_ICR_TPR: hv_apic_ctrl_t
var HV_APIC_CTRL_GUEST_IDLE: hv_apic_ctrl_t
var HV_APIC_CTRL_IOAPIC_EOI: hv_apic_ctrl_t
var HV_APIC_CTRL_NO_TIMER: hv_apic_ctrl_t
var HV_APIC_EDGE_TRIGGER_AEOI: hv_apic_intr_trigger_t
var HV_APIC_EDGE_TRIGGER: hv_apic_intr_trigger_t
var HV_APIC_LEVEL_TRIGGER: hv_apic_intr_trigger_t
var HV_APIC_LVT_FLAVOR_TIMER: hv_apic_lvt_flavor_t
var HV_APIC_STATE_EXT_VER: Int32
var HV_ATPIC_STATE_EXT_VER: Int32
var HV_FAULT: Int
var HV_IOAPIC_STATE_EXT_VER: Int32
var HV_MEMORY_MAXPROT_EXEC: Int
var HV_MEMORY_MAXPROT_READ: Int
var HV_MEMORY_MAXPROT_UEXEC: Int
Topics
Constants
Hypervisor / Hypervisor Constants
API Collection
Hypervisor Constants


## Page 4

var HV_MEMORY_MAXPROT_WRITE: Int
var HV_MEMORY_MAXPROT: Int
var HV_MEMORY_UEXEC: Int
var HV_VM_ACCEL_APIC: Int
var HV_VM_EXITINFO_APIC_ACCESS_READ: hv_vm_exitinfo_t
var HV_VM_EXITINFO_INIT_AP: hv_vm_exitinfo_t
var HV_VM_EXITINFO_INJECT_EXCP: hv_vm_exitinfo_t
var HV_VM_EXITINFO_IOAPIC_EOI: hv_vm_exitinfo_t
var HV_VM_EXITINFO_SMI: hv_vm_exitinfo_t
var HV_VM_EXITINFO_STARTUP_AP: hv_vm_exitinfo_t
var HV_VM_EXITINFO_VMX: hv_vm_exitinfo_t
var HV_VM_SPACE_DEFAULT: Int
The value that represents the default VM address space.
var IRQ_INFO_VECTOR_MASK: UInt32
var kHV_ION_ANY_SIZE: Int
var kHV_ION_ANY_VALUE: Int
var kHV_ION_EXIT_FULL: Int
var kHV_ION_NONE: Int
var VMCS_CTRL_ENCLV_EXITING_BITMAP: Int
var VMCS_GUEST_IA32_INTR_SSP_TABLE_ADDR: Int
var VMCS_GUEST_IA32_PKRS: Int
var VMCS_GUEST_IA32_S_CET: Int
var VMCS_GUEST_SSP: Int
var VMCS_HOST_IA32_INTR_SSP_TABLE_ADDR: Int
var VMCS_HOST_IA32_PKRS: Int
var VMCS_HOST_IA32_S_CET: Int
var VMCS_HOST_SSP: Int
var VMENTRY_LOAD_PKRS: UInt32


## Page 5

var VMEXIT_LOAD_PKRS: UInt32
var VMX_EPT_VPID_ADV_VMEXIT_INFO: UInt32
Hypervisor Structures
Hypervisor Functions
Hypervisor Data Types
See Also
Reference


## Page 6

func hv_sme_config_get_max_svl_bytes(UnsafeMutablePointer<Int>) -> hv
_return_t
func hv_vcpu_apic_ctrl(hv_vcpuid_t, hv_apic_ctrl_t) -> hv_return_t
func hv_vcpu_apic_get_state(hv_vcpuid_t, UnsafeMutablePointer<hv_apic
_state_ext_t>) -> hv_return_t
func hv_vcpu_apic_lsc_enter_imm32(hv_vcpuid_t, UInt64, UInt32, UInt16,
UInt32, UnsafeMutablePointer<UInt64>?, UInt32) -> hv_return_t
func hv_vcpu_apic_lsc_enter_r32(hv_vcpuid_t, Bool, UInt64, UInt32,
UInt16, hv_x86_reg_t, UnsafeMutablePointer<UInt64>?, UInt32) -> hv
_return_t
func hv_vcpu_apic_lsc_invalidate(hv_vcpuid_t) -> hv_return_t
func hv_vcpu_apic_put_state(hv_vcpuid_t, UnsafePointer<hv_apic_state_ex
_t>) -> hv_return_t
func hv_vcpu_apic_read(hv_vcpuid_t, UInt32, UnsafeMutablePointer<UInt32
>) -> hv_return_t
func hv_vcpu_apic_trigger_lvt(hv_vcpuid_t, hv_apic_lvt_flavor_t) -> hv
_return_t
func hv_vcpu_apic_write(hv_vcpuid_t, UInt32, UInt32, UnsafeMutable
Pointer<Bool>) -> hv_return_t
func hv_vcpu_exit_apic_access_read(hv_vcpuid_t, UnsafeMutablePointer<
UInt32>) -> hv_return_t
Topics
Functions
Hypervisor / Hypervisor Functions
API Collection
Hypervisor Functions


## Page 7

func hv_vcpu_exit_info(hv_vcpuid_t, UnsafeMutablePointer<hv_vm_exitinfo
_t>) -> hv_return_t
func hv_vcpu_exit_init_ap(hv_vcpuid_t, UnsafeMutablePointer<Bool>,
UInt32) -> hv_return_t
func hv_vcpu_exit_inject_excp(hv_vcpuid_t, UnsafeMutablePointer<UInt8>,
UnsafeMutablePointer<Bool>, UnsafeMutablePointer<UInt32>, UnsafeMutable
Pointer<Bool>) -> hv_return_t
func hv_vcpu_exit_ioapic_eoi(hv_vcpuid_t, UnsafeMutablePointer<UInt8>) 
> hv_return_t
func hv_vcpu_exit_startup_ap(hv_vcpuid_t, UnsafeMutablePointer<Bool>,
UInt32, UnsafeMutablePointer<UInt64>) -> hv_return_t
func hv_vcpu_get_idle_time(hv_vcpuid_t, UnsafeMutablePointer<UInt64>) -
hv_return_t
func hv_vcpu_get_sme_p_reg(hv_vcpu_t, hv_sme_p_reg_t, UnsafeMutable
Pointer<UInt8>, Int) -> hv_return_t
Returns the value of a vCPU P predicate register in streaming Scalable Vector Extension (SV
mode.
func hv_vcpu_get_sme_state(hv_vcpu_t, UnsafeMutablePointer<hv_vcpu_sme
_state_t>) -> hv_return_t
Gets the current Scalable Matrix Extension (SME) state.
func hv_vcpu_get_sme_z_reg(hv_vcpu_t, hv_sme_z_reg_t, UnsafeMutable
Pointer<UInt8>, Int) -> hv_return_t
Returns the value of a vCPU Z vector register in streaming Scalable Vector Extension (SVE)
mode.
func hv_vcpu_get_sme_za_reg(hv_vcpu_t, UnsafeMutablePointer<UInt8>, Int
-> hv_return_t
Returns the value of the vCPU ZA matrix register in streaming Scalable Vector Extension (SV
mode.
func hv_vcpu_get_sme_zt0_reg(hv_vcpu_t, UnsafeMutablePointer<hv_sme_zt0
_uchar64_t>) -> hv_return_t
Returns the current value of the vCPU ZT0 register in streaming Scalable Vector Extension
(SVE) mode.
func hv_vcpu_inject_extint(hv_vcpuid_t) -> hv_return_t


## Page 8

func hv_vcpu_set_sme_p_reg(hv_vcpu_t, hv_sme_p_reg_t, UnsafePointer<
UInt8>, Int) -> hv_return_t
Sets the value of a vCPU P predicate register in streaming Scalable Vector Extension (SVE)
mode.
func hv_vcpu_set_sme_state(hv_vcpu_t, UnsafePointer<hv_vcpu_sme_state_t
>) -> hv_return_t
Sets the SME state consisting of the streaming Scalable Vector Extension (SVE) mode and Z
storage enable.
func hv_vcpu_set_sme_z_reg(hv_vcpu_t, hv_sme_z_reg_t, UnsafePointer<
UInt8>, Int) -> hv_return_t
Sets the value of a vCPU Z vector register in streaming Scalable Vector Extension (SVE)
mode.
func hv_vcpu_set_sme_za_reg(hv_vcpu_t, UnsafePointer<UInt8>, Int) -> hv
_return_t
Sets the value of the vCPU ZA matrix register in streaming Scalable Vector Extension (SVE)
mode.
func hv_vcpu_set_sme_zt0_reg(hv_vcpu_t, UnsafePointer<hv_sme_zt0_uchar6
_t>) -> hv_return_t
Sets the value of the vCPU ZT0 register in streaming Scalable Vector Extension (SVE) mode
func hv_vcpu_vmx_status(hv_vcpuid_t, UnsafeMutablePointer<UInt32>) -> h
_return_t
func hv_vm_allocate(UnsafeMutablePointer<UnsafeMutableRawPointer?>, Int
hv_allocate_flags_t) -> hv_return_t
func hv_vm_atpic_assert_irq(Int32) -> hv_return_t
func hv_vm_atpic_deassert_irq(Int32) -> hv_return_t
func hv_vm_atpic_get_state(UnsafeMutablePointer<hv_atpic_state_ext_t>,
Bool) -> hv_return_t
func hv_vm_atpic_port_read(Int32, UnsafeMutablePointer<UInt8>) -> hv
_return_t
func hv_vm_atpic_port_write(Int32, UInt8) -> hv_return_t
func hv_vm_atpic_put_state(UnsafePointer<hv_atpic_state_ext_t>, Bool) -
hv_return_t
func hv_vm_config_get_default_ipa_size(UnsafeMutablePointer<UInt32>) ->
hv_return_t


## Page 9

func hv_vm_config_get_ipa_size(hv_vm_config_t, UnsafeMutablePointer<
UInt32>) -> hv_return_t
func hv_vm_config_get_max_ipa_size(UnsafeMutablePointer<UInt32>) -> hv
_return_t
func hv_vm_config_set_ipa_size(hv_vm_config_t, UInt32) -> hv_return_t
func hv_vm_deallocate(UnsafeMutableRawPointer, Int) -> hv_return_t
func hv_vm_ioapic_assert_irq(Int32) -> hv_return_t
func hv_vm_ioapic_deassert_irq(Int32) -> hv_return_t
func hv_vm_ioapic_get_state(UnsafeMutablePointer<hv_ioapic_state_ext_t>
-> hv_return_t
func hv_vm_ioapic_pulse_irq(Int32) -> hv_return_t
func hv_vm_ioapic_put_state(UnsafePointer<hv_ioapic_state_ext_t>) -> hv
_return_t
func hv_vm_ioapic_read(hv_gpaddr_t, UnsafeMutablePointer<UInt32>) -> hv
_return_t
func hv_vm_ioapic_write(hv_gpaddr_t, UInt32) -> hv_return_t
func hv_vm_lapic_msi(UInt64, UInt64) -> hv_return_t
func hv_vm_lapic_set_intr(hv_vcpuid_t, UInt8, hv_apic_intr_trigger_t) -
hv_return_t
func hv_vm_map_space(hv_vm_space_t, hv_uvaddr_t, hv_gpaddr_t, Int, hv
_memory_flags_t) -> hv_return_t
Maps a region in the virtual address space of the current task into a guest physical address
space of the VM.
func hv_vm_protect_space(hv_vm_space_t, hv_gpaddr_t, Int, hv_memory
_flags_t) -> hv_return_t
Modifies the permissions of a region in a guest physical address space of the VM.
func hv_vm_send_ioapic_intr(UInt64) -> hv_return_t
func hv_vm_set_apic_bus_freq(UInt64) -> hv_return_t
func hv_vm_space_create(UnsafeMutablePointer<hv_vm_space_t>) -> hv
_return_t
Creates an additional guest address space for the current task.


## Page 10

func hv_vm_space_destroy(hv_vm_space_t) -> hv_return_t
Destroys the address space instance associated with the current task.
func hv_vm_unmap_space(hv_vm_space_t, hv_gpaddr_t, Int) -> hv_return_t
Umaps a region in a guest physical address space of the VM.
func hv_vmx_vcpu_set_apic_address_space(hv_vcpuid_t, hv_vm_space_t, hv
_gpaddr_t) -> hv_return_t
Hypervisor Structures
Hypervisor Constants
Hypervisor Data Types
See Also
Reference


## Page 11

typealias hv_allocate_flags_t
typealias hv_gpaddr_t
The type of a guest physical address (GPA).
typealias hv_memory_flags_t
The permissions for guest physical memory regions.
typealias hv_sme_zt0_uchar64_t
typealias hv_uvaddr_t
The type of a user virtual address.
typealias hv_vm_space_t
The type of a guest-address space.
Hypervisor Structures
Hypervisor Constants
Topics
Data Types
See Also
Reference
Hypervisor / Hypervisor Data Types
API Collection
Hypervisor Data Types


## Page 12

Hypervisor Functions


