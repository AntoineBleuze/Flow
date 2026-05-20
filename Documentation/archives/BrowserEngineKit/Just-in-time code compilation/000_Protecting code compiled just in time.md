# 000_Protecting code compiled just in time.pdf

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


