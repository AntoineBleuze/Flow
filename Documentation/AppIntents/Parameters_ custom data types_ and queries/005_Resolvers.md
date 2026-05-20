# 005_Resolvers.pdf

## Page 1

System experiences like Siri and the Shortcuts app produce input that doesn’t always match what
your code requires. For example, natural spoken language commands from Siri are strings, but yo
app intent might require an integer or floating-point value instead. Resolvers let the system
translate one type to another automatically.
The system provides resolvers to convert between integer, floating-point, Boolean, string, and UR
types. As needed, the system can chain multiple resolvers together to translate between types fo
which no single resolver exists. For example, it can translate an integer into a string and then
translate the string into a Boolean value. If your app defines custom types, create your own
resolvers to translate those types to more recognizable values.
struct IntFromDoubleResolver
A resolver that converts a double into an integer using the specified rounding rule and
validates the result is within the parameter’s inclusive range.
struct IntFromStringResolver
A resolver that converts a string into an integer in the specified base and validates the result
within the parameter’s inclusive range.
struct IntResolver
Overview
Topics
Integer resolution
App Intents / Resolvers
API Collection
Resolvers
Resolve the parameters of your app intents, and extend the standard resolution
types to include your app’s custom types.


## Page 2

A resolver that validates an integer is within the parameter’s inclusive range.
struct DoubleFromIntResolver
struct DoubleFromStringResolver
A resolver that converts a string into a double and validates the result is within the
parameter’s inclusive range.
struct DoubleResolver
A resolver that validates a double is within the parameter’s inclusive range.
struct AttributedStringFromStringResolver
A resolver that converts a string into an attributed string.
struct StringFromDoubleResolver
A resolver that converts a double into a string.
struct StringFromIntResolver
A resolver that converts one or more integers into one or more strings.
struct BoolFromStringResolver
A resolver that converts a string into a Boolean, optionally using a localized display name.
struct URLFromStringResolver
A resolver that converts a string into a URL.
protocol Resolver
An interface to convert a value from one type to a different type.
Floating-point resolution
String resolution
Boolean resolution
URL resolution
Custom resolution
Range validation


## Page 3

protocol RangeCheckingResolver
An interface for validating that a value is within a parameter’s defined inclusive range.
protocol RangeComparableProperty
Adding parameters to an app intent
Enable people to configure app intents with their custom input values.
Integrating custom data types into your intents
Provide the system with information about the types your app uses to model its data so that
your intents can use those types as parameters.
Parameter resolution
Define the required parameters for your app intents and specify how to resolve those
parameters at runtime.
App entities
Make core types or concepts discoverable to the system by declaring them as app entities.
Entity queries
Help the system find the entities your app defines and use them to resolve parameters.
See Also
Parameters, custom data types, and queries


