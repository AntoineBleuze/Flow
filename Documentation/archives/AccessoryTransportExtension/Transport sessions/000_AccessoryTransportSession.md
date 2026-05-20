# 000_AccessoryTransportSession.pdf

## Page 1

class Request
An incoming session request, which the extension can accept or reject.
protocol EventHandler
A protocol that defines methods for handling events for the session.
func cancel(error: AccessoryTransportSession.Error?)
Cancels the session.
enum Error
A type that defines errors encountered when using an accessory transport session.
Topics
Handling a session request
Handling events
Canceling a session
Describing a session
AccessoryTransportExte… / AccessoryTransportSession
Class
AccessoryTransportSession
A class that manages a session between the extension and host process.
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+


## Page 2

var description: String
A textual representation of this instance.
CustomStringConvertible
Relationships
Conforms To


