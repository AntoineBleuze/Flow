# Essentials.pdf

## Page 1

Adopting ClassKit allows your app to participate in a virtual classroom that spans many devices
communicating through iCloud. To participate in this educational ecosystem, first enable the
ClassKit capability. Then, to test your app’s interaction with this ecosystem, install Apple’s
Schoolwork app on your development devices and simulate iCloud interaction by running in
development mode.
To gain access to the virtual classroom environment, enable the ClassKit capability for your app in
Xcode.
When you enable the ClassKit capability, Xcode automatically adds the ClassKit Environmen
Entitlement to your entitlements file. It also adds the corresponding feature to your App ID. Se
Add a Capability in Xcode help for more information about enabling capabilities.
Overview
Enable the ClassKit Capability
Install the Schoolwork app on your devices
ClassKit / Enabling ClassKit in your app
Enabling ClassKit in your app
Prepare your app and your development environment to adopt ClassKit.


## Page 2

The Schoolwork app provides the interface that teachers use to see what content your app offers
create assignments based on that content, and monitor student progress through those
assignments. Students use the same app to receive assignments, and link directly to content in
your app. Schoolwork provides both of these experiences by changing its behavior according to
the role of the logged in user. For more information about user roles, see About ClassKit and user
roles.
To test your app’s ClassKit adoption, you install Schoolwork on your own development devices.
This lets you validate the data your app sends to ClassKit. It also lets you experience what teache
and students see when they use your app in an educational environment.
To get Schoolwork, download it from the App Store.
Note
You can’t test ClassKit behavior in Simulator because Schoolwork isn’t available in that
environment.
When you distribute your ClassKit enabled app through the App Store, it runs in production mode
In this mode, assigments made by teachers propagate to students’ devices, and progress returns
to the teacher’s device through iCloud. But during development, you might not have access to a
classroom full of managed devices. So you test in development mode, storing all data locally on a
single device, switching between teacher and student roles as needed. Xcode automatically
handles the mode selection for you, but you control the role (student or teacher) in development
mode, as described in Testing your ClassKit app during development.
Testing your ClassKit app during development
Use development mode to test your app without a Managed Apple ID.
About ClassKit and user roles
Understand how ClassKit interacts with different kinds of users.
Use development mode to test locally
Topics
Development mode
User roles


## Page 3

ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that works with t
Schoolwork app.
Incorporating ClassKit into an Educational App
Walk through the process of setting up assignments and recording student progress.
class CLSDataStore
A container for all the ClassKit data in your app.
See Also
Essentials


## Page 4

Key
com.apple.developer.ClassKit-environment
Type
String
development
The environment used to develop and test your app locally, without requiring a Managed App
ID issued by an educational institution.
production
The environment used by customers of your app who have a Managed Apple ID. This
enviroment enables teachers and students to share data through iCloud.
This key specifies the ClassKit environment your app uses to share data with Apple’s Schoolwork
app.
To support testing locally, Xcode sets the value to development by default. When you upload
your app to the App Store, Xcode changes the value to production.
To add this entitlement to your app, enable the ClassKit capability in Xcode.
Details
Possible Values
Discussion
Bundle Resources / Entitlements / ClassKit Environment Entitlement
Property List Key
ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that
works with the Schoolwork app.
iOS 11.4+
iPadOS 11.4+
macOS 11.0+
visionOS 1.0+


## Page 5

Enabling ClassKit in your app
Prepare your app and your development environment to adopt ClassKit.
Testing your ClassKit app during development
Use development mode to test your app without a Managed Apple ID.
com.apple.developer.automatic-assessment-configuration
A Boolean value that indicates whether an app may create an assessment session.
See Also
Related Documentation
Education


## Page 6

You adopt ClassKit in an existing educational app to enable teachers to create assignments and
monitor students’ progress through those assignments. This sample code project demonstrates
ClassKit adoption in an app that lets users read plays.
Before starting, be sure to read Enabling ClassKit in Your App to learn how to configure your
environment to work with ClassKit, and Testing Your App During Development to prepare to debu
your ClassKit adoption.
The GreatPlays app provides a navigable hierarchy of plays, acts, and scenes, along with quizzes
that test the reader’s comprehension. The app uses a simple data model that represents a
collection of plays—the shared PlayLibrary instance holds Play instances, each of which
contain an array of Act instances, and so on. These all exist independent of ClassKit.
Overview
Start with an Existing Educational App
ClassKit / Incorporating ClassKit into an Educational App
Sample Code
Incorporating ClassKit into an Educational
App
Walk through the process of setting up assignments and recording student
progress.
Download
iOS 11.3+
iPadOS 11.3+
Xcode 10.2+


## Page 7

For this example, the structure of a single play—Shakespeare’s Hamlet—is added to the library at
launch, from inside the application(_:didFinishLaunchingWithOptions:) method.
Note
When writing an app for the educational market, consider supporting shared iPad, as
described in Optimizing Apps for Shared iPad. This sample app does that by not using any
persistent local storage and by setting the NSSupportsPurgeableLocalStorage key to
YES in its Info.plist file.
In a real app, in addition to the structure, you would also add the play’s text, along with quiz
questions tailored to each scene. You might also support other plays, either distributed with the
app, or downloaded later.
Your first task in adopting ClassKit is to define your app’s assignable content. You represent a uni
of assignable content to ClassKit as a CLSContext instance, and then establish relationships
between contexts by grouping them together into a hierarchy. For the play reader, teachers might
want to assign a quiz, an individual scene, an act (with all its scenes), or even the whole play. So
the existing model hierarchy provides a good template for a context hierarchy.
Because ClassKit layers on top of what your app already does, it’s often best to isolate ClassKit
support into class extensions. This scheme avoids disrupting the app’s normal flow. The sample
app therefore declares a Node protocol that model objects can adopt in an extension to readily
associate with a related context:
Define Assignable Content


## Page 8

In adopting this protocol, a model object discloses its immediate ancestor and descendants, a
unique identifier, and a CLSContextType value that indicates what kind of content it contains. F
example, the Node extension to Act, shown below, defines its parent as the play that contains
it, and its children as the scenes it contains. It provides an identifier that is unique to the act,
and a context type of chapter, which is a reasonable approximation of the role of an act within a
play.
Further, an extension to the Node protocol provides default behavior to all model objects for
handling identifiers. In particular, a model object that adopts the protocol gains the ability to repo
its own identifier path (a collection of identifier strings that trace through the hierarchy from
one node to another), and to find a descendant node from an identifier path:


## Page 9

Contexts are the mechanism by which your app advertises its assignable content to teachers.
Contexts you tell ClassKit about appear as tasks in Apple’s Schoolwork app, where teachers go to
create assignments based on your content. So it’s important to declare contexts as soon (and as
atomically) as possible. Otherwise teachers won’t see your app’s content in Schoolwork, or might
only see a partial list of tasks.
You deal with this by declaring the context hierarchy for static content at application launch, or
immediately after you download dynamic content. In the play reader app, you do this by making
context declaration an integral step of building a new play instance in the addPlay method:
You declare an entire play context hierarchy by asking the data store for all the leaf nodes, which
implicitly also declares all of the contexts that are ancestors of the leaf nodes:
Advertise Your Content to Teachers


## Page 10

Because you’re only declaring the contexts at this point, you don’t need to do anything with the
returned values.
Any time you ask the data store (CLSDataStore) for a context, whether during declaration or
because you want to activate the context, the data store first looks in its database of stored
contexts. If the context is available there, perhaps from a previous launch of your app, the data
store returns that. But if it’s not available, the data store asks its delegate to build the context.
By defining contexts that parallel your model hierarchy, you facilitate the building of new contexts
In your implementation of the CLSDataStoreDelegate protocol’s createContext(for
Identifier:parentContext:parentIdentifierPath:) method, you can use
characteristics of your model objects to inform context creation.
In the play reader, the shared instance of the PlayLibrary class takes the role of delegate, aga
using an extension. Its ClassKit extension includes the setupClassKit() method that assign
itself as the delegate:
The extension also implements the delegate callback, relying on each model object’s Node
extension to provide data needed for context creation:
Build Contexts on Demand


## Page 11

The app includes a ClassKit context provider app extension by defining a target called ClassKit
ContextProvider. A ClassKit extension’s primary class conforms to the CLSContext
Provider protocol. Schoolwork calls this protocol’s updateDescendants method to create or
update the children of a given context as the teacher browses assignable content. This enables
Schoolwork to advertise the most up-to-date version of an app’s assignable content, even before
the teacher runs the main app for the first time.
Using the identifier path of the passed-in context, the update method finds the corresponding
node in the data model, and then finds the children of that node:
Build Contexts from an App Extension


## Page 12

The update method then finds existing child contexts at the same hierarchical level as the node,
and creates any that are missing:
In this app, contexts never change, so the loop moves to the next iteration without taking any
action when it finds an existing context. If your app has contexts that can change, use this
opportunity to reconfigure the context. Either way, after finishing the loop, save the updates and
call the completion handler:
While contexts declare the structure of your app, you use CLSActivity instances to report
progress through those contexts. For example, for a context representing a scene, the
corresponding activity reports how much of the scene the student has read and how long they to
to read it.
Record Progress with Activities


## Page 13

In addition to the identifier extension, the sample app includes another extension to Node that
provides default behavior for working with ClassKit activities. Model objects use their own identifi
path to locate the matching context, and then use the context to manage activities. For example,
the startActivity() method defined in the extension begins an activity:
Node also defines methods for reporting progress as a fraction of task completion and ending an
activity. Notice that all these methods retrieve the context every time, rather than storing a
reference to it. It’s important to do this, because the underlying instance could change between
calls as a result of network synchronization.
You typically call methods to record activity from your view controllers. Consider an assignment t
read a particular scene. The scene’s view controller knows when the scene appears on screen an
Start Recording When the User Begins an Activity


## Page 14

has a handle on the scene instance. So the controller is in the best position to tell the scene to
begin recording an activity from its viewDidAppear(_:) method:
Notice that when the student starts to read a scene, the controller doesn’t set the start
Activity() method’s asNew parameter, leaving it to have the default value of false. As a resu
a previously stopped activity, if available, is resumed. This allows the user to begin reading a scen
then navigate elsewhere in the app (for example to review an earlier scene) without finalizing the
current attempt. When the user returns, progress and duration pick up from where the user left o
In contrast, the startQuiz() method does set the startActivity() method’s asNew
parameter to true. Quizzes, once started, must be finished before the user can move to another
task. So the app treats each new attempt as a new activity.
How you handle this for a particular activity depends on the characteristics of the tasks you defin
While the scene view controller (which manages a scroll view) is visible, it uses its knowledge of
the content offset as an indication of how far through the scene the student has read. For each
scroll view delegate update, the controller reports a new progress value to the scene by measurin
scroll position as a proxy for how much the student has read:
Add Progress When the User Scrolls


## Page 15

The controller informs the scene when the activity is over in its viewWillDisappear(_:)
method:
Activities report duration and progress automatically. But sometimes you want to provide addition
metrics about an activity. For example, you might want to report a quiz score, or record how many
times a hint was used in solving a problem. For this, you use activity items.
In GreatPlays, the Node protocol extension provides the addScore() and addQuantity()
methods for this purpose. These are called when the user completes the quiz, but before ending
the activity, to report the quiz results:
While recording the quiz score, the app also calls the markAsDone() method, as shown in the
previous section, which in turn calls the data store’s completeAllAssigned
Activities(matching:) method to indicate that the student has finalized the attempt.
Stop Recording When the User Stops an Activity
Report Additional Metrics with Activity Items
Mark an Activity as Done


## Page 16

The student can’t go back and change anything after reaching the end of the quiz, so the app can
safely mark the activity as done. In contrast, reading a scene has no easily detected end point, an
so the app doesn’t make a call to the completion method in that case. Instead, the student decide
when to mark the activity complete in Schoolwork.
When you add activity items, you can choose to make one of them the primary item. The primary
gets a more prominent role in summarized results that teachers see. In the play reader example, f
a quiz, the score is considered the primary item, as shown above. Alternatively, you can choose n
to set any activity item as the primary, in which case progress becomes the most prominent resul
displayed to teachers. The addScore() method demonstrates the two ways in which you can
register an activity item, either as primary or not:
If you do decide to set a primary item, make sure you always set the same kind of primary item fo
given activity. For example, once you register the score item as the primary for a quiz activity, you
must always use score this way. Making the hint quantity the primary at a later time generates an
error.
Enabling ClassKit in your app
Prepare your app and your development environment to adopt ClassKit.
ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that works with t
Schoolwork app.
class CLSDataStore
A container for all the ClassKit data in your app.
Designate a Primary Activity Item
See Also
Essentials


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

Enabling ClassKit in your app
Prepare your app and your development environment to adopt ClassKit.
ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that works with t
Schoolwork app.
Incorporating ClassKit into an Educational App
Walk through the process of setting up assignments and recording student progress.


