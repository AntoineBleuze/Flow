# 001_NFCNDEFPayload.pdf

## Page 1

Adding Support for Background Tag Reading
An NDEF message payload consists of the Type Name Format field (as defined by the NDEF
specification), type, identifier, and data.
class func wellKnownTypeURIPayload(url: URL) -> Self?
Creates a payload record with a URI specified as a URL.
class func wellKnownTypeURIPayload(string: String) -> Self?
Creates a payload record with a URI specified as a string.
class func wellKnownTypeTextPayload(string: String, locale: Locale) ->
Self?
Mentioned in
Overview
Topics
Creating a Payload Record
Core NFC / NFCNDEFPayload
Class
NFCNDEFPayload
A payload record in an NFC NDEF message.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

Creates a payload record with text.
init(format: NFCTypeNameFormat, type: Data, identifier: Data, payload:
Data)
Creates a payload record with the specified format, type, identifier, and payload data.
init(format: NFCTypeNameFormat, type: Data, identifier: Data, payload:
Data, chunkSize: Int)
Creates a payload record with the specified format, type, identifier, payload data, and data
chunk size.
class func wellKnowTypeTextPayload(string: String, locale: Locale) ->
Self?
Creates a payload record with text.
Deprecated
var identifier: Data
The identifier of the payload, as defined by the NDEF specification.
var payload: Data
The payload, as defined by the NDEF specification.
var type: Data
The type of the payload, as defined by the NDEF specification.
var typeNameFormat: NFCTypeNameFormat
The Type Name Format field of the payload, as defined by the NDEF specification.
enum NFCTypeNameFormat
The Type Name Format values that specify the content type for the payload data in an NFC
NDEF message.
func wellKnownTypeURIPayload() -> URL?
Returns the URL of a valid Well Known Type URI payload.
Getting Information About a Payload Record
Getting the URI from a Payload Record
Getting Text from a Payload Record


## Page 3

func wellKnownTypeTextPayload() -> (String?, Locale?)
Returns the text and locale of a valid Well Known Type Text payload.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class NFCNDEFMessage
An NFC NDEF message consisting of an array of payload records.
Relationships
Inherits From
Conforms To
See Also
NDEF messages and payloads


