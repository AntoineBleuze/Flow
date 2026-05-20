# Structures.pdf

## Page 1

Use these flags with setWEPKey(_:flags:index:).
static var unicast: CWCipherKeyFlags
A flag that indicates to use the cipher key for unicast packets.
static var multicast: CWCipherKeyFlags
A flag that indicates to use the cipher key for multicast packets.
static var tx: CWCipherKeyFlags
A flag that indicates to use the cipher key for packets sent from the interface.
static var rx: CWCipherKeyFlags
A flag that indicates to use the cipher key for packets received by the interface.
Overview
Topics
Constants
Initializers
Core WLAN / CWCipherKeyFlags
Structure
CWCipherKeyFlags
Cipher key flags.
macOS 10.7+


## Page 2

init(rawValue: UInt)
Creates a cipher key flags structure with the specified raw value.
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
Relationships
Conforms To


