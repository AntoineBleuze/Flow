# 002_CIPlugInRegistration.pdf

## Page 1

The principal class of an image unit—a loadable bundle containing custom Core Image filters for
macOS—must support this protocol.
func load(UnsafeMutableRawPointer!) -> Bool
Loads and initializes an image unit, performing custom tasks as needed.
Required
class CIPlugIn
Overview
Topics
Initializing Plug-ins
See Also
Image Units
Core Image / CIPlugInRegistration
Protocol
CIPlugInRegistration
The interface for loading Core Image image units.
macOS


## Page 2

The mechanism for loading image units in macOS.
class CIFilterGenerator
An object that creates and configures chains of individual image filters.
protocol CIFilterConstructor
A general interface for objects that produce filters.


