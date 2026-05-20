# 001_JSBigIntCreateWithInt64________.pdf

## Page 1

ctx
The execution context to use.
integer
The 64-bit signed integer to copy into the new BigInt JSValue.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A BigInt JSValue of the integer, or NULL if an exception is thrown.
Creates a JavaScript BigInt with a 64-bit signed integer.
Parameters
Return Value
Discussion
JavaScriptCore / JSBigIntCreateWithInt64(_:_:_:)
Function
JSBigIntCreateWithInt64(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


