# 002_Core Video Functions.pdf

## Page 1

func CVColorPrimariesGetIntegerCodePointForString(CFString?) -> Int32
Returns the standard integer code point corresponding to the Core Video color primaries
constant string that you specify.
func CVColorPrimariesGetStringForIntegerCodePoint(Int32) -> Unmanaged<
CFString>?
Returns the Core Video color primaries string corresponding to the standard integer code
point that you specify.
func CVTransferFunctionGetIntegerCodePointForString(CFString?) -> Int32
Returns the standard integer code point corresponding to the Core Video transfer function
string that you specify.
func CVTransferFunctionGetStringForIntegerCodePoint(Int32) -> Unmanaged
CFString>?
Returns the Core Video transfer function string corresponding to the standard integer code
point that you specify.
func CVYCbCrMatrixGetIntegerCodePointForString(CFString?) -> Int32
Returns the standard integer code point corresponding to the Core Video YCbCr matrix strin
that you specify.
func CVYCbCrMatrixGetStringForIntegerCodePoint(Int32) -> Unmanaged<
CFString>?
Returns the Core Video YCbCr matrix string corresponding to the standard integer code poin
that you specify.
Topics
Converting between strings and integer code points
Core Video / Core Video Functions
API Collection
Core Video Functions


## Page 2

func CVIsCompressedPixelFormatAvailable(OSType) -> Bool
func CVPixelBufferCopyCreationAttributes(CVPixelBuffer) -> CFDictionary
Core Video Enumerations
Core Video Constants
Functions
See Also
Reference


