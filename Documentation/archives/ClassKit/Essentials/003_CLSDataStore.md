# 003_CLSDataStore.pdf

## Page 1

Use the ClassKit data store to build and access contexts (CLSContext instances) that you use to
advertise your app’s assignable content. Contexts in turn provide access to activities
(CLSActivity instances) and activity items (CLSScoreItem, CLSBinaryItem, and
CLSQuantityItem instances) that you use to record progress through assignments. You don’t
instantiate a data store yourself. Instead, use the single shared data store instance throughout
your app.
The data store provides access to the app’s one and only main context through the mainApp
Context property. This property acts as the root context in your context hierarchy that you can
use as a starting point when searching for descendant contexts.
To build contexts, you adopt the CLSDataStoreDelegate protocol in one of your classes,
typically one that exists for the lifetime of your app, and assign an instance of that class as the
shared data store’s delegate property. Then, when the data store needs a context that it’s neve
seen before, it asks your delegate to build it.
After you make changes to any context, activity, or activity item, call the data store’s
save(completion:) method to commit the changes, and propagate them through the network
Overview
Topics
ClassKit / CLSDataStore
Class
CLSDataStore
A container for all the ClassKit data in your app.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 2

class var shared: CLSDataStore
The shared data store object.
Building missing contexts
Create and initialize missing contexts.
var delegate: (any CLSDataStoreDelegate)?
The data store delegate instance.
protocol CLSDataStoreDelegate
An interface the data store uses to request new contexts.
var mainAppContext: CLSContext
The app’s top-level context.
var activeContext: CLSContext?
The currently active context.
var runningActivity: CLSActivity?
The currently running activity within the currently active context.
func fetchActivity(for: URL, completion: (CLSActivity?, (any Error)?) -
Void)
Fetches an activity for a given document so you can record progress on the associated task
func completeAllAssignedActivities(matching: [String])
Marks all of the assigned and active activities for the given context path as complete.
func contexts(matchingIdentifierPath: [String], completion: ([CLSContex
], (any Error)?) -> Void)
Fetches all the contexts along a given identifier path.
Accessing the shared data store
Managing the delegate
Accessing specific contexts and activities
Finding contexts that match criteria


## Page 3

func contexts(matching: NSPredicate, completion: ([CLSContext], (any
Error)?) -> Void)
Fetches all the contexts matching a predicate.
struct CLSPredicateKeyPath
The set of possible key paths you use to search for contexts.
func remove(CLSContext)
Marks a context for removal.
func save(completion: (((any Error)?) -> Void)?)
Saves any changes you’ve made in the data store.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Removing contexts
Saving changes
Relationships
Inherits From
Conforms To
See Also
Essentials


## Page 4

Enabling ClassKit in your app
Prepare your app and your development environment to adopt ClassKit.
ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that works with t
Schoolwork app.
Incorporating ClassKit into an Educational App
Walk through the process of setting up assignments and recording student progress.


