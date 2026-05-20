# JavaScript Code.pdf

## Page 1

You use the JSValue class to convert basic values, such as numbers and strings, between
JavaScript and Objective-C or Swift representations to pass data between native code and
JavaScript code. You can also use this class to create JavaScript objects that wrap native objects
of custom classes or JavaScript functions with implementations that native methods or blocks
provide.
Each JSValue instance originates from a JSContext object that represents the JavaScript
execution environment containing that value. The value holds a strong reference to its context
object — as long as it retains any value for a particular JSContext instance, that context remains
alive. When you invoke an instance method on a JSValue object, and that method returns anoth
JSValue object, the returned value belongs to the same context as the original value.
Each JavaScript value also has an association (indirectly via the context property) with a specif
JSVirtualMachine object that represents the underlying set of execution resources for its
context. You can pass JSValue instances only to methods on JSValue and JSContext
instances on the same virtual machine — attempting to pass a value to a different virtual machine
raises an Objective-C exception.
When you use the JSValue methods for creating, reading, and converting JavaScript values,
JavaScriptCore automatically converts native values to JavaScript values and vice versa, using th
rules below.
Overview
Convert Between JavaScript and Native Types
JavaScriptCore / JSValue
Class
JSValue
A JavaScript value.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 2

NSDictionary objects or Swift dictionaries and the keys they contain become JavaScript
objects with matching named properties and vice versa. JavaScriptCore recursively copies and
converts the values for keys.
NSArray objects or Swift arrays become JavaScript arrays and vice versa, with elements that
JavaScriptCore recursively copies and converts.
Objective-C blocks (or Swift closures with the @convention(block) attribute) become
JavaScript Function objects, with parameter and return types that JavaScriptCore converts
using the same rules as values. Converting a JavaScript function with a backing from a native
block or method returns that block or method; all other JavaScript functions convert as empty
dictionaries.
For all other native object types (and class types or metatypes), JavaScriptCore creates a
JavaScript wrapper object with a constructor prototype chain that reflects the native class
hierarchy. By default, the JavaScript wrapper for a native object doesn’t make that object’s
properties and methods available in JavaScript. To choose properties and methods for export t
JavaScript, see JSExport.
When you convert an object, method, or block, JavaScriptCore implicitly converts the types and
values of object properties and method parameters using the rules below:
Objective-C (and Swift)
types
JavaScript
types
Notes
nil
undefined
NSNull
null
NSString (Swift String)
String
NSNumber and primitive
numeric types
Number,
Boolean
Conversion is consistent with the following
methods:
init(int32:in:) / toInt32() for signed
integer types
init(uInt32:in:) / toUInt32() for
unsigned integer types
init(bool:in:) / toBool() for Boolean
types
init(double:in:) / toBool() for all other
numeric types


## Page 3

Objective-C (and Swift)
types
JavaScript
types
Notes
NSDictionary (Swift
Dictionary)
Object
Recursive conversion.
NSArray (Swift Array)
Array
Recursive conversion.
NSDate
Date
Objective-C or Swift object
(objc_object or Any
Object)
Objective-C or Swift class
(Class or AnyClass)
Object
Converts with init(object:in:) / to
Object().
Structure types:
NSRange, CGRect,
CGPoint, CGSize
Object
There isn’t support for other structure types.
Objective-C block (Swift
closure)
Function
Convert explicitly with init(object:in:) /
toObject().
JavaScript functions don’t convert to native
blocks/closures unless they already have a
backing from a native block/closure.
init!(object: Any!, in: JSContext!)
Creates a JavaScript value by converting the specified native object.
init!(bool: Bool, in: JSContext!)
Creates a JavaScript representation of the specified Boolean value.
init!(double: Double, in: JSContext!)
Creates a JavaScript representation of the specified floating-point value.
init!(int32: Int32, in: JSContext!)
Topics
Creating JavaScript Values


## Page 4

Creates a JavaScript representation of the specified signed integer value.
init!(uInt32: UInt32, in: JSContext!)
Creates a JavaScript representation of the specified unsigned integer value.
init!(newObjectIn: JSContext!)
Creates a new, empty JavaScript object value.
init!(newArrayIn: JSContext!)
Creates a new, empty JavaScript array value.
init!(newRegularExpressionFromPattern: String!, flags: String!, in:
JSContext!)
Creates a JavaScript regular expression value from the specified pattern.
init!(newErrorFromMessage: String!, in: JSContext!)
Creates a JavaScript error value with the specified error message.
init!(undefinedIn: JSContext!)
Creates a JavaScript undefined value.
init!(nullIn: JSContext!)
Creates a JavaScript null value.
init!(point: CGPoint, inContext: JSContext!)
Creates a JavaScript representation of the specified point.
init!(range: NSRange, inContext: JSContext!)
Creates a JavaScript representation of the specified range.
init!(rect: CGRect, inContext: JSContext!)
Creates a JavaScript representation of the specified rectangle.
init!(size: CGSize, inContext: JSContext!)
Creates a JavaScript representation of the specified width and height.
init!(newSymbolFromDescription: String!, in: JSContext!)
Creates a unique symbol object.
init!(newPromiseIn: JSContext!, fromExecutor: ((JSValue?, JSValue?) ->
Void)!)
Creates a promise object using the specified executor callback.
init!(newPromiseRejectedWithReason: Any!, in: JSContext!)


## Page 5

Creates a rejected promise object with the specified value.
init!(newPromiseResolvedWithResult: Any!, in: JSContext!)
Creates a resolved promise object with the specified value.
func toObject() -> Any!
Converts the JavaScript value to a native object.
func toObjectOf(AnyClass!) -> Any!
Converts the JavaScript value to a native object of the specified class.
func toBool() -> Bool
Converts the JavaScript value to a native Boolean value.
func toDouble() -> Double
Converts the JavaScript value to a native floating-point value.
func toInt32() -> Int32
Converts the JavaScript value to a native signed integer value.
func toUInt32() -> UInt32
Converts the JavaScript value to a native unsigned integer value.
func toNumber() -> NSNumber!
Converts the JavaScript value to a NSNumber object.
func toString() -> String!
Converts the JavaScript value to a native string.
func toDate() -> Date!
Converts the JavaScript value to a date object.
func toArray() -> [Any]!
Converts the JavaScript value to an array.
func toDictionary() -> [AnyHashable : Any]!
Converts the JavaScript value to a dictionary.
func toPoint() -> CGPoint
Converts the value to a point structure.
Reading and Converting JavaScript Values


## Page 6

func toRange() -> NSRange
Converts the value to a range.
func toRect() -> CGRect
Converts the value to a rectangle structure.
func toSize() -> CGSize
Converts the value to a size.
var isUndefined: Bool
A Boolean value that indicates whether the instance corresponds to the JavaScript
undefined value.
var isNull: Bool
A Boolean value that indicates whether the instance corresponds to the JavaScript null
value.
var isBoolean: Bool
A Boolean value that indicates whether the instance is a JavaScript Boolean value.
var isNumber: Bool
A Boolean value that indicates whether the instance is a JavaScript numeric value.
var isString: Bool
A Boolean value that indicates whether the instance is a JavaScript String object.
var isObject: Bool
A Boolean value that indicates whether the instance is a JavaScript object.
var isArray: Bool
A Boolean value that indicates whether the instance is a JavaScript array value.
var isDate: Bool
A Boolean value that indicates whether the instance is a JavaScript Date object.
var isSymbol: Bool
A Boolean value that indicates whether the instance is a symbol.
Determining the Type of a JavaScript Value
Comparing JavaScript Values


## Page 7

func isEqual(to: Any!) -> Bool
Compares the value to another for strict equality.
func isEqualWithTypeCoercion(to: Any!) -> Bool
Compares the value to another for equivalence, allowing type conversion.
func isInstance(of: Any!) -> Bool
Returns a Boolean value indicating whether the value is an instance of another JavaScript
object value.
func call(withArguments: [Any]!) -> JSValue!
Invokes the value as a JavaScript function.
func construct(withArguments: [Any]!) -> JSValue!
Invokes the value as a JavaScript constructor.
func invokeMethod(String!, withArguments: [Any]!) -> JSValue!
Calls the named JavaScript method on the value.
func defineProperty(Any!, descriptor: Any!)
Defines a property on the JavaScript object value or modifies a property’s definition.
func hasProperty(Any!) -> Bool
Returns a Boolean value indicating whether the JavaScript value has a defined property with
the specified name.
func deleteProperty(Any!) -> Bool
Deletes the named property from the JavaScript object value.
func atIndex(Int) -> JSValue!
Returns the value at the specified numeric index in the JavaScript object value.
func setValue(Any!, at: Int)
Sets the value at the specified numeric index in the JavaScript object value.
func forProperty(Any!) -> JSValue!
Returns the value of the named property in the JavaScript object value.
Working with Function and Constructor Values
Working with Container Values


## Page 8

func setValue(Any!, forProperty: Any!)
Sets the value of the named property in the JavaScript object value.
typealias JSValueProperty
A type that identifies a property of a JavaScript value.
var context: JSContext!
The JavaScript context hosting this value.
func objectAtIndexedSubscript(Int) -> JSValue!
Returns the value’s JavaScript property at the specified index, allowing subscript syntax.
func setObject(Any!, atIndexedSubscript: Int)
Sets the value’s JavaScript property at the specified index, allowing subscript syntax.
func objectForKeyedSubscript(Any!) -> JSValue!
Returns the value’s JavaScript property named with the specified key, allowing subscript
syntax.
func setObject(Any!, forKeyedSubscript: Any!)
Sets the value’s JavaScript property named with the specified key, allowing subscript syntax
var jsValueRef: JSValueRef!
Returns the C representation of the JavaScript value.
init!(JSValueRef: JSValueRef!, inContext: JSContext!)
Creates a JavaScript value object from the equivalent C representation.
Property Descriptor Keys
Keys for the native dictionary representation of a JavaScript property descriptor, used with t
defineProperty(_:descriptor:) method.
Accessing a Value’s JavaScript Context
Accessing Values with Subscript Syntax
Working with the C JavaScriptCore API
Constants


## Page 9

init?(newBigIntFrom: String, in: JSContext)
init?(newBigIntFrom: UInt64, in: JSContext)
init?(newBigIntFrom: Int64, in: JSContext)
init?(newBigIntFrom: Double, in: JSContext)
var isBigInt: Bool
func compare(Double) -> JSRelationCondition
func compare(JSValue) -> JSRelationCondition
func compare(UInt64) -> JSRelationCondition
func compare(Int64) -> JSRelationCondition
func toInt64() -> Int64
func toUInt64() -> UInt64
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Initializers
Instance Properties
Instance Methods
Relationships
Inherits From
Conforms To


## Page 10

NSObjectProtocol
class JSManagedValue
A JavaScript value with conditional retain behavior to provide automatic memory
management.
See Also
JavaScript Code


## Page 11

The primary use case for a managed value is to store a JavaScript value in an Objective-C or Swif
object that exports to JavaScript.
Important
Don’t store a nonmanaged JSValue object in a native object that exports to JavaScript.
Because a JSValue object references its enclosing JSContext object, this action creates a
retain cycle, preventing deallocation of the context.
A managed value’s conditional retain behavior ensures retention of its underlying JavaScript value
as long as either of the following conditions is true:
The JavaScript value is reachable through the JavaScript object graph (that is, not subject to
JavaScript garbage collection).
The JSManagedValue object is reachable through the Objective-C or Swift object graph, as
you report to the JavaScriptCore virtual machine using the addManagedReference(_:with
Owner:) method.
However, if neither of these conditions is true, the managed value sets its value property to nil
releasing the underlying JSValue object.
Overview
JavaScriptCore / JSManagedValue
Class
JSManagedValue
A JavaScript value with conditional retain behavior to provide automatic memory
management.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 12

Note
On its own, a JSManagedValue object behaves similarly to an ARC weak reference to its
underlying JSValue object—that is, if you don’t use the addManagedReference(_:with
Owner:) method to add conditional retain behavior, the managed value’s value property
automatically becomes nil when the JavaScript garbage collector destroys the underlying
JavaScript value.
init!(value: JSValue!)
Initializes a managed value with the specified JavaScript value.
init!(value: JSValue!, andOwner: Any!)
Creates a managed value and associates it with an owner.
var value: JSValue!
The managed value’s underlying JavaScript value.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Topics
Creating a Managed Value
Accessing the Managed Value
Relationships
Inherits From
Conforms To


## Page 13

NSObjectProtocol
class JSValue
A JavaScript value.
See Also
JavaScript Code


