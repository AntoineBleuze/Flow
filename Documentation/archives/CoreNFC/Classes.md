# Classes.pdf

## Page 1

Configuration options for the Manufacturer Custom command.
init(manufacturerCode: Int, customCommandCode: Int, requestParameters:
Data?)
init(manufacturerCode: Int, customCommandCode: Int, requestParameters:
Data?, maximumRetries: Int, retryInterval: TimeInterval)
var customCommandCode: Int
var manufacturerCode: Int
var requestParameters: Data
Overview
Topics
Initializers
Instance Properties
Core NFC / NFCISO15693CustomCommandConfiguration
Class
NFCISO15693CustomCommand
Configuration
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

NFCTagCommandConfiguration
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Relationships
Inherits From
Conforms To


## Page 3

Configuration options for the Read Multiple Blocks command.
init(range: NSRange, chunkSize: Int)
init(range: NSRange, chunkSize: Int, maximumRetries: Int, retryInterval
TimeInterval)
var chunkSize: Int
var range: NSRange
Overview
Topics
Initializers
Instance Properties
Relationships
Core NFC / NFCISO15693ReadMultipleBlocksConfiguration
Class
NFCISO15693ReadMultipleBlocks
Configuration
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 4

NFCTagCommandConfiguration
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Inherits From
Conforms To


