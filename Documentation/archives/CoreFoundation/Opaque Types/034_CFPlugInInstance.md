# 034_CFPlugInInstance.pdf

## Page 1

CFPlugInInstance is deprecated. Use the functions defined by CFPlugIn instead.
func CFPlugInInstanceCreateWithInstanceDataSize(CFAllocator!, CFIndex,
CFPlugInInstanceDeallocateInstanceDataFunction!, CFString!, CFPlugIn
InstanceGetInterfaceFunction!) -> CFPlugInInstance!
Not recommended.
func CFPlugInInstanceGetFactoryName(CFPlugInInstance!) -> CFString!
Not recommended.
func CFPlugInInstanceGetInstanceData(CFPlugInInstance!) -> UnsafeMutabl
RawPointer!
Not recommended.
func CFPlugInInstanceGetInterfaceFunctionTable(CFPlugInInstance!,
CFString!, UnsafeMutablePointer<UnsafeMutableRawPointer?>!) -> Bool
Not recommended.
Overview
Topics
Deprecated
Core Foundation / CFPlugInInstance
Class
CFPlugInInstance
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFPlugInInstanceGetTypeID() -> CFTypeID
Not recommended.
typealias CFPlugInInstanceDeallocateInstanceDataFunction
Not recommended.
typealias CFPlugInInstanceGetInterfaceFunction
Not recommended.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
Callbacks
Relationships
Conforms To
See Also
Opaque Types


## Page 3

class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


