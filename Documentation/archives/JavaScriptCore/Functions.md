# Functions.pdf

## Page 1

ctx
The execution context to use.
value
The value to copy into the new BigInt JSValue.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A BigInt JSValue of the value, or NULL if an exception is thrown.
Creates a JavaScript BigInt with a double.
If the value is not an integer, an exception is thrown.
Parameters
Return Value
Discussion
JavaScriptCore / JSBigIntCreateWithDouble(_:_:_:)
Function
JSBigIntCreateWithDouble(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 2



## Page 3

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


## Page 4

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


## Page 5



## Page 6

ctx
The execution context to use.
integer
The 64-bit unsigned integer to copy into the new BigInt JSValue.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A BigInt JSValue of the integer, or NULL if an exception is thrown.
Creates a JavaScript BigInt with a 64-bit unsigned integer.
Parameters
Return Value
Discussion
JavaScriptCore / JSBigIntCreateWithUInt64(_:_:_:)
Function
JSBigIntCreateWithUInt64(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 7

ctx
The execution context to use.
left
The JSValue as the left operand.
right
The JSValue as the right operand.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A value of JSRelationCondition, a kJSRelationConditionUndefined is returned if an exception is
thrown.
Parameters
Return Value
JavaScriptCore / JSValueCompare(_:_:_:_:)
Function
JSValueCompare(_:_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 8

Compares two JSValues.
The result is computed by comparing the results of JavaScript’s ==, <, and > operators. If either
left or right is (or would coerce to) NaN in JavaScript, then the result is
kJSRelationConditionUndefined.
Discussion


## Page 9

ctx
The execution context to use.
left
The JSValue as the left operand.
right
The double as the right operand.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A value of JSRelationCondition, a kJSRelationConditionUndefined is returned if an exception is
thrown.
Parameters
Return Value
JavaScriptCore / JSValueCompareDouble(_:_:_:_:)
Function
JSValueCompareDouble(_:_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 10

Compares a JSValue with a double.
left is converted to a double according to the rules specified by the JavaScript language then
compared with right.
Discussion


## Page 11

ctx
The execution context to use.
left
The JSValue as the left operand.
right
The int64_t as the right operand.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A value of JSRelationCondition, a kJSRelationConditionUndefined is returned if an exception is
thrown.
Parameters
Return Value
JavaScriptCore / JSValueCompareInt64(_:_:_:_:)
Function
JSValueCompareInt64(_:_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 12

Compares a JSValue with a signed 64-bit integer.
left is converted to an integer according to the rules specified by the JavaScript language then
compared with right.
Discussion


## Page 13

ctx
The execution context to use.
left
The JSValue as the left operand.
right
The uint64_t as the right operand.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A value of JSRelationCondition, a kJSRelationConditionUndefined is returned if an exception is
thrown.
Parameters
Return Value
JavaScriptCore / JSValueCompareUInt64(_:_:_:_:)
Function
JSValueCompareUInt64(_:_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 14

Compares a JSValue with an unsigned 64-bit integer.
left is converted to an integer according to the rules specified by the JavaScript language then
compared with right.
Discussion


## Page 15

ctx
The execution context to use.
value
The JSValue to test.
True if value’s type is the BigInt type, otherwise false.
Tests whether a JavaScript value’s type is the BigInt type.
Parameters
Return Value
Discussion
JavaScriptCore / JSValueIsBigInt(_:_:)
Function
JSValueIsBigInt(_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 16

ctx
The execution context to use.
value
The JSValue to convert.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
An int32_t with the result of conversion, or 0 if an exception is thrown. Since 0 is valid value,
exception must be checked after the call.
Converts a JSValue to a singed 32-bit integer and returns the resulting integer.
Parameters
Return Value
Discussion
JavaScriptCore / JSValueToInt32(_:_:_:)
Function
JSValueToInt32(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 17

The JSValue is converted to an integer according to the rules specified by the JavaScript languag
If the value is a BigInt, then the JSValue is truncated to an int32_t.


## Page 18

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


## Page 19

The JSValue is converted to an integer according to the rules specified by the JavaScript languag
If the value is a BigInt, then the JSValue is truncated to an int64_t.


## Page 20

ctx
The execution context to use.
value
The JSValue to convert.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A uint32_t with the result of conversion, or 0 if an exception is thrown. Since 0 is valid value,
exception must be checked after the call.
Converts a JSValue to an unsigned 32-bit integer and returns the resulting integer.
Parameters
Return Value
Discussion
JavaScriptCore / JSValueToUInt32(_:_:_:)
Function
JSValueToUInt32(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 21

The JSValue is converted to an integer according to the rules specified by the JavaScript languag
If the value is a BigInt, then the JSValue is truncated to a uint32_t.


## Page 22

ctx
The execution context to use.
value
The JSValue to convert.
exception
A pointer to a JSValueRef in which to store an exception, if any. To reliable detect exception,
initialize this to null before the call. Pass NULL if you do not care to store an exception.
A uint64_t with the result of conversion, or 0 if an exception is thrown. Since 0 is valid value,
exception must be checked after the call.
Converts a JSValue to an unsigned 64-bit integer and returns the resulting integer.
Parameters
Return Value
Discussion
JavaScriptCore / JSValueToUInt64(_:_:_:)
Function
JSValueToUInt64(_:_:_:)
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 9.0+
visionOS 2.0+


## Page 23

The JSValue is converted to an integer according to the rules specified by the JavaScript languag
If the value is a BigInt, then the JSValue is truncated to a uint64_t.


