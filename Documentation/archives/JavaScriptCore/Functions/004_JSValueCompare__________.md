# 004_JSValueCompare__________.pdf

## Page 1

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


## Page 2

Compares two JSValues.
The result is computed by comparing the results of JavaScript’s ==, <, and > operators. If either
left or right is (or would coerce to) NaN in JavaScript, then the result is
kJSRelationConditionUndefined.
Discussion


