# 001_Foundation Data Types.pdf

## Page 1

class NSKeyValueObservation
class NSKeyValueSharedObservers
A collection of key-value observations which may be registered with multiple observable
objects
class NSKeyValueSharedObserversSnapshot
A collection of key-value observations which may be registered with multiple observable
objects. Create using -[NSKeyValueSharedObservers snapshot]
protocol DiscreteFormatStyle
A format style that transforms a continuous input into a discrete output and provides
information about its discretization boundaries.
protocol NSKeyValueObservingCustomization
Conforming to NSKeyValueObservingCustomization is not required to use Key-Value
Observing. Provide an implementation of these functions if you need to disable auto-notifyin
for a key, or add dependent keys
Topics
Classes
Protocols
Structures
Foundation / Foundation Data Types
API Collection
Foundation Data Types
This document describes the data types and constants found in the Foundation
framework.


## Page 2

struct AsyncCharacterSequence
An asynchronous sequence of characters.
struct AsyncLineSequence
An asynchronous sequence of lines of text.
struct AsyncUnicodeScalarSequence
An asychronous sequence of Unicode scalar values.
struct Expression
struct NSAttributedStringFormattingContextKey
struct NSKeyValueChangeKey
The keys that can appear in the change dictionary.
struct NSKeyValueObservedChange
struct NSKeyValueOperator
These constants define the available array operators. See Using Collection Operators for mo
information.
struct PresentationIntent
A type that defines presentation intent for blocks of characters like paragraphs, lists, block
quotes, and tables.
let NSOperationNotSupportedForKeyException: String
let NSURLSessionUploadTaskResumeData: String
Key in the userInfo dictionary of an NSError received during a failed upload.
var kCFStringEncodingASCII: CFStringEncoding
macro Expression<each Input, Output>((repeat each Input) -> Output) ->
Expression<repeat each Input, Output>
macro Predicate<each Input>((repeat each Input) -> Bool) -> Predicate
<repeat each Input>
Variables
Macros
Type Aliases


## Page 3

typealias uuid_string_t
typealias uuid_t
Foundation Enumerations
See Also
Reference


