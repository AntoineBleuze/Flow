# 003_CIFilterConstructor.pdf

## Page 1

Objects implementing this protocol are called filter constructors—they produce new instances of
CIFilter subclasses when filters are requested by name. You can create a filter constructor to
provide new, custom filters that other Core Image clients can discover using the CIFilter class
Normally, you create and register custom filters by packaging them as Image Units (see Packagin
and Loading Image Units), but you can use this protocol to provide new filters within your app tha
are compositions of existing filters.
To provide custom filters using this protocol, you must:
1. Create your custom filters as CIFilter subclasses.
2. Create a class that implements this protocol to vend instances of the appropriate CIFilter
subclasses when requested.
3. Call the CIFilter class method registerName(_:constructor:classAttributes:)
for each custom filter, providing the filter’s name, an instance of your filter constructor class, a
information about the filter’s attributes.
Overview
Topics
Providing Filter Objects
Core Image / CIFilterConstructor
Protocol
CIFilterConstructor
A general interface for objects that produce filters.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 2

func filter(withName: String) -> CIFilter?
Returns a filter object specified by name.
Required
CIFilterGenerator
class CIPlugIn
The mechanism for loading image units in macOS.
class CIFilterGenerator
An object that creates and configures chains of individual image filters.
protocol CIPlugInRegistration
The interface for loading Core Image image units.
Relationships
Conforming Types
See Also
Image Units


