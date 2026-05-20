# 006_JSValueCompareInt64__________.pdf

## Page 1

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


## Page 2

Compares a JSValue with a signed 64-bit integer.
left is converted to an integer according to the rules specified by the JavaScript language then
compared with right.
Discussion


