# 000_C JavaScriptCore API.pdf

## Page 1

typealias JSContextGroupRef
A group that associates JavaScript contexts with one another.
typealias JSContextRef
A JavaScript execution context.
typealias JSGlobalContextRef
A global JavaScript execution context.
typealias JSStringRef
A UTF-16 character buffer.
typealias JSClassRef
A JavaScript class.
typealias JSValueRef
A JavaScript value.
typealias JSObjectRef
A JavaScript object.
Topics
JavaScriptCore Engine Interface
JavaScript Data Types
JavaScriptCore / C JavaScriptCore API
API Collection
C JavaScriptCore API
Browse the alternative C-based APIs for JavaScriptCore.


## Page 2

func JSCheckScriptSyntax(JSContextRef!, JSStringRef!, JSStringRef!,
Int32, UnsafeMutablePointer<JSValueRef?>!) -> Bool
Checks for syntax errors in a string of JavaScript.
func JSEvaluateScript(JSContextRef!, JSStringRef!, JSObjectRef!,
JSStringRef!, Int32, UnsafeMutablePointer<JSValueRef?>!) -> JSValueRef!
Evaluates a string of JavaScript.
func JSGarbageCollect(JSContextRef!)
Performs a JavaScript garbage collection.
var JSC_OBJC_API_ENABLED: Int32
Script Evaluation
Constants


