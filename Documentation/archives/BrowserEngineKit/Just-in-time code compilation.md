# Just-in-time code compilation.pdf

## Page 1

A just-in-time (JIT) compiler poses unique security challenges. To prepare the compiled code, the
web content extension must be able to write to a region of memory. Then, to run the code, the
extension must be able to execute the content of that memory. But, an attacker can use memory
that is both writable and executable to run arbitrary code in your process.
The operating system uses hardware memory management to enforce that a page of memory
allocated by your process is either writable, or executable, but not simultaneously both (W^X).
To toggle the writable or executable status of a memory page, your web content extension calls b
_memory_inline_jit_restrict_rwx_to_rx_with_witness, and be_memory_inline
_jit_restrict_rwx_to_rw_with_witness. You must call these functions only in certain
restricted ways that are outlined below, to protect your process from possible malicious misuse.
Add the following entitlements to your web content extension’s target, setting their values to tru
Extended Virtual Addressing Entitlement
Allow execution of JIT-compiled code entitlement
Note
If you use pthread_jit_write_with_callback_np() to toggle JIT write protections for
a memory region instead of be_memory_inline_jit_restrict_rwx_to_rx_with
_witness(), add both the Allow execution of JIT-compiled code entitlement
and com.apple.security.cs.jit-write-allowlist entitlements, each with the value
true. For more information, see Porting just-in-time compilers to Apple silicon.
Overview
Add JIT entitlements
BrowserEngineKit / Protecting code compiled just in time
Article
Protecting code compiled just in time
Toggle memory between being writable and executable.


## Page 2

When your app targets the arm64e instruction set, the be_memory_inline_jit_restrict
_rwx_to_rw_with_witness function inserts a cryptographically signed pointer authentication
code (PAC) into the pointer to your JIT memory. The operating system authenticates the PAC whe
your extension process jumps to the JIT-compiled code after you call be_memory_inline_jit
_restrict_rwx_to_rx_with_witness(), and only runs the code if the PAC is still valid.
Otherwise, it stops your extension process.
Pointer authentication is only available with the arm64e instruction set. You can compile your
browser app as a universal binary that includes both arm64 and arm64e, but on devices that only
support arm64, the W^X toggle functions don’t use PAC. For more information on building for
arm64e, see “Build for pointer authentication” in Managing the browser extension life cycle.
Important
The iPhone Simulator doesn’t run arm64e code. You need to test your JIT code on an iPhone,
not in the Simulator.
Additionally, your JIT compiler needs to emit arm64e code that uses PAC-protected pointers. You
browser engine needs to adopt PAC for any pointer that influences control flow in your interpreter
code.
For more information on pointer authentication, see Improving control flow integrity with pointer
authentication.
Your calls to be_memory_inline_jit_restrict_rwx_to_rw_with_witness() and its
counterpart must be inlined into the critical section for your extension’s JIT compilation code, so
they don’t provide an attacker with a general way to run arbitrary code while your JIT region is
writable. An attacker might use a general PAC-signing mechanism to write and run instructions
anywhere in your process’s memory.
Important
The Swift attribute @inlinable, described in Attributes, indicates that the compiler can
choose to inline a function, but doesn’t guarantee that it does. @inlinable isn’t suitable for
inlining calls to the memory protection toggle functions for JIT compilation.
Adopt pointer authentication
Inline your memory-protection toggles
Avoid spilling variables to the stack


## Page 3

Variables that your JIT code accesses between calls to the memory toggle functions must be in
registers, or in heap memory that you access using PAC-protected pointers. Don’t rely on loop
indexes or other variables that are in stack memory, because an attacker might gain control of the
stack to change the behavior of your JIT compiler.
If necessary, disassemble your extension’s binary to inspect the JIT critical section and ensure tha
important variables aren’t stored on the stack. To disassemble the binary, use the command-line
tool llvm-objdump. For example, if your JIT compiler is in a function called runJavascript, r
this command in Terminal:
Note
You can also use the path to the object file in your Xcode project’s derived data file that
contains the relevant function, instead of your extension’s executable file.
Improving control flow integrity with pointer authentication
Increase confidence that your code uses pointers correctly.
var BE_JIT_WRITE_PROTECT_TAG: Int
A discriminator value the system uses to generate pointer authentication codes for just-in-
time compilation.
See Also
Just-in-time code compilation


## Page 4

Many common attacks against software use techniques that compromise control flow within an
app, executing code within the app that the attacker wants to run instead of the intended code
path. Two examples of such attacks are:
Return-oriented programming (ROP)
The attacker manipulates the call stack to cause functions to return to the wrong locations.
Jump-oriented programming (JOP)
The attacker manipulates the heap to cause an indirect jump instruction to jump to the wrong
location.
Pointer authentication provides probabilistic protection of control flow integrity (CFI) by annotatin
pointers with signatures. You sign a raw pointer to produce a signed pointer, which contains an
embedded pointer authentication code (PAC). To use a signed pointer, you authenticate it, which
validates the PAC and, if valid, returns the raw pointer. Otherwise, if the authentication operation
detects that the pointer is invalid, it returns a value that represents an invalid raw pointer. Your
process generates a segmentation fault and a crash report when it uses the invalid raw pointer. Fo
more information, see “Recognize pointer authentication failures” in Preparing your app to work
with pointer authentication.
Note
The authentication operation might fail to detect that a value is invalid, and return a usable
value even though its input is invalid. The authentication check is a probabilistic signal of
confidence, not a guarantee that the pointer isn’t compromised.
Overview
Apple silicon / Improving control flow integrity with pointer authentication
Article
Improving control flow integrity with
pointer authentication
Increase confidence that your code uses pointers correctly.


## Page 5

To generate a PAC that you use to validate a pointer, you need to identify the signing schema that
the system uses to sign the pointer, which is made up of the signing key and a discriminator.
You identify a signing key by name; the CPU keeps the key’s data secret and can use different
values for the same key name in different processes. Compute discriminator values as needed. Fo
more information, see the section “Generate a discriminator”, below.
In most situations, for example, storing a function pointer in a data structure, you use the _
_ptrauth type qualifier on the field where you store the pointer. This tells the C compiler to
store the pointer more securely than it otherwise does by default. Using the __ptrauth type
qualifier supports several simple, but effective, pointer authentication schemas.
In other situations, for example if you’re writing a just-in-time (JIT) compiler and you protect a
pointer to a function that your JIT compiler creates, you might need to use a compiler intrinsic 
sign the pointer before you pass it around in yout code. Additionally, use compiler intrinsics to
gain more control over the signing schema, taking care to ensure that an attacker can’t alter th
discriminator in the same way that they can alter a signed pointer.
The pointer-signing key names intrinsic operations are defined in the header file <ptrauth.h>.
Signing pointers requires an arbitrary value called the discriminator, that the processor uses as a
salt for the signing operation to ensure that signed pointers for different purposes aren’t
interchangeable. Using different discriminators in different places makes it more difficult for an
attacker to compromise your code by replacing a valid signed pointer value with a different valid
signed pointer.
A discriminator is an arbitrary 64-bit value. Typically, you use either a constant value, or a value
derived from the address in memory where the pointer is stored. Both of these approaches are
supported by the __ptrauth type qualifier.
You can choose a constant discriminator value directly, or generate one based on a string using
ptrauth_string_discriminator:
Alternatively, combine a constant value with the pointer’s location in memory using ptrauth
_blend_discriminator:
Generate a discriminator


## Page 6

When you use a discriminator that incorporates the pointer’s memory location, you can’t copy the
pointer or a data structure that contains the pointer using memcpy and related functions because
the discriminator isn’t valid to verify the pointer at the new memory location.
The cryptographic key that the system uses to generate a PAC for a pointer is known as the signin
key. You identify which signing key to use by name, and the system doesn’t give you access to th
signing key’s value. Choose from the four different signing keys, depending on whether you’re
protecting a code pointer and whether you need a process-dependent or process-independent
signing key:
ptrauth_key_process_independent_code
A process-independent key you use to sign code pointers.
ptrauth_key_process_dependent_code
A process-dependent key you use to sign code pointers.
ptrauth_key_process_independent_data
A process-independent key you use to sign data pointers.
ptrauth_key_process_dependent_data
A process-dependent key you use to sign data pointers.
Signing a pointer with a code-signing key produces a larger PAC than a data-signing key, which
increases the protection of pointer authentication. In each case, the size of a signed pointer is the
same as the size of an unsigned pointer, and the PAC is stored in unused bits of the pointer.
In most situations, use a process-independent signing key. The system uses process-dependent
keys to protect particularly high-value pointers such as return addresses and frame pointers, and
you use the same keys for other contexts you increase the risk that your app re-uses the same
signing schema for these pointers.
The header file ptrauth.h also provides these names that are synonyms for the basic signing
keys, that you can use to provide extra information in your code about a protected pointer’s
purpose:
ptrauth_key_function_pointer
A key you use to sign function pointers.
ptrauth_key_return_address
A key you use to sign return addresses on the stack.
ptrauth_key_frame_pointer
A key you use to sign frame pointers on the stack.
ptrauth_key_block_function
A key you use to sign pointers to block functions.
Select a key


## Page 7

ptrauth_key_cxx_vtable_pointer
A key you use to sign C++ v-table entries.
Use the __ptrauth type qualifier to tell the compiler to generate a PAC for your data pointer or
function pointer, and to validate the PAC when you dereference the pointer. The type qualifier take
three arguments:
key
A constant expression that identifies the name of the abstract signing key to use, discussed i
the “Select a key” section above.
address
A Boolean that indicates whether the compiler needs to use ptrauth_blend
_discriminator to vary the discriminator based on the pointer’s address.
discriminator
A constant expression that the system uses as a salt in generating the PAC.
For example, to declare a data pointer that the system signs using the constant discriminator valu
0x1f35:
To sign a pointer, you need three pieces of information:
The raw pointer. While you can sign the NULL pointer, the resulting signed pointer has a non-
zero value, and code that tests for NULL by comparing the pointer’s value to 0 gets the wrong
result. Therefore, you need to test raw pointers for NULL and sign non-NULL raw pointers.
The abstract signing key, discussed in the section “Select a key”, above.
A discriminator, an arbitrary value discussed in the “Generate a discriminator” section above.
Important
Don’t store the discriminator alongside a signed pointer in memory if you generate different
discriminators for different categories of pointers in your app. Doing so makes it easy for an
attacker to replace both the signed pointer and the discriminator that the system uses to
validate the PAC.
Annotate pointers with the pointer-authentication
type qualifiers
Sign a pointer


## Page 8

To produce a signed pointer for a constant address, in this example a data pointer:
The returned signed pointer is the same size and type as a raw pointer, and the signature
information is stored in unused bits of the pointer value.
To recover the raw pointer value, if the signed pointer passes validity checks, call ptr_auth
_data:
To recover a pointer value that’s signed for use as a function pointer, if the signed pointer passes
validity checks, call ptrauth_auth_function:
To check the validity of a signed pointer and obtain a version that’s signed with a different key and
discriminator, call ptrauth_auth_and_resign:
Authenticate a signed pointer


## Page 9

BrowserEngineCore / BE_JIT_WRITE_PROTECT_TAG
Global Variable
BE_JIT_WRITE_PROTECT_TAG
A discriminator value the system uses to generate pointer authentication codes fo
just-in-time compilation.
iOS 17.4+
iPadOS 17.4+
macOS
visionOS


