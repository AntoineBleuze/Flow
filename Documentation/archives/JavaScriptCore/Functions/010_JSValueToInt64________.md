# 010_JSValueToInt64________.pdf

## Page 1

ctx
The execution context to use.
value
The JSValue to convert.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
An int64_t with the result of conversion, or 0 if an exception is thrown. Since 0 is valid value,
exception must be checked after the call.
Converts a JSValue to a singed 64-bit integer and returns the resulting integer.
Parameters
Return Value
Discussion
JavaScriptCore / JSValueToInt64(_:_:_:)
Function
JSValueToInt64(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 2

The JSValue is converted to an integer according to the rules specified by the JavaScript languag
If the value is a BigInt, then the JSValue is truncated to an int64_t.


