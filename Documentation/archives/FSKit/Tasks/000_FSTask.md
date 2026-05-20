# 000_FSTask.pdf

## Page 1

FSKit creates an instance of this class for each long-running operations.
func logMessage(String)
Logs the given string to the initiating client.
func didComplete(error: (any Error)?)
Informs the client that the task completed.
var cancellationHandler: (() -> (any Error)?)?
Overview
Topics
Logging
Sending completion messages
Handling task cancellation
FSKit / FSTask
Class
FSTask
A class that enables a file system module to pass log messages and completion
notifications to clients.
macOS 15.4+


## Page 2

A handler called by FSKit upon canceling the task.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class FSTaskOptions
A class that passes command options to a task, optionally providing security-scoped URLs.
Relationships
Inherits From
Conforms To
See Also
Tasks


