# 002_JSBigIntCreateWithString________.pdf

## Page 1

ctx
The execution context to use.
string
The JSStringRef representation of an integer.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A BigInt JSValue of the string, or NULL if an exception is thrown.
Creates a JavaScript BigInt with an integer represented in string.
This is equivalent to calling the BigInt constructor from JavaScript with a string argument.
Parameters
Return Value
Discussion
JavaScriptCore / JSBigIntCreateWithString(_:_:_:)
Function
JSBigIntCreateWithString(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 2



