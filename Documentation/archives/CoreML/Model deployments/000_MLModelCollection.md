# 000_MLModelCollection.pdf

## Page 1

Deprecated
Use Background Assets or URLSession instead.
Use a model collection to access the models from a Core ML Model Deployment. For example, yo
can use a model collection to replace one or more of your app’s built-in models with a newer
version.
To access the newest model collection from a deployment, call the beginAccessingModel
CollectionWithIdentifier:completionHandler: type method. Your app can also get a
notification when Core ML receives an update to a model collection (see didChange
Notification).
class func endAccessing(identifier: String) async throws -> Bool
Overview
Topics
Accessing a model collection
Core ML / MLModelCollection Deprecated
Class
MLModelCollection Deprecated
A set of Core ML models from a model deployment.
iOS 14.0–17.4 Deprecated
iPadOS 14.0–17.4 Deprecated
Mac Catalyst 14.0–17.4 Deprecated
visionOS 1.0–1.1 Deprecated


## Page 2

Terminates access to a model collection.
var identifier: String
The name of the model collection, unique to the development team.
var deploymentID: String
The unique identifier of the model collection’s deployment.
var entries: [String : MLModelCollection.Entry]
A dictionary of model entries keyed to the models’ identifiers.
class Entry
A model and its identifier within a model collection.
class let didChangeNotification: NSNotification.Name
The notification the framework sends when it receives an update to a model collection.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Identifying a model collection
Retreiving models from a collection
Registering for model collection updates
Relationships
Inherits From
Conforms To


## Page 3



