# Contexts.pdf

## Page 1

A context, stored as a CLSContext instance, represents an area within your app, such as a book
chapter or a game level, that teachers can assign to students as tasks. You create a hierarchy of
contexts to enable teachers to browse and assign your app’s content. You provide deep links to th
content that the contexts represent to help teachers guide students to your content. You then
activate and deactivate contexts as users move through your app.
Before you write any new code, decide which parts of your existing app correspond to tasks that 
teacher might want to assign to students. For example, a textbook reader app might divide
textbooks into chapters and sections, while offering tests and quizzes to measure the reader’s
retention of the material. So the app’s assignable tasks fall into a hierarchical structure with the ap
at the top and tests and quizzes at the bottom.
Every app that adopts ClassKit has a single, predefined top-level context called the main app
context. To this, you add one or more child contexts representing assignable tasks, each potentia
Overview
Identify Your App’s Assignable Tasks
ClassKit / Advertising your app’s assignable content
Advertising your app’s assignable content
Assemble a hierarchy of contexts and declare your app’s assignable content.


## Page 2

with descendants of its own representing subtasks.
Organize the hierarchy so that it makes sense to teachers creating assignments. For example, the
lowest level contexts should represent indivisible units of work, like a quiz. Don’t define a differen
context for each question of a quiz when you expect teachers to assign the entire quiz as a single
task. Instead, use a single context to represent the whole quiz.
Do use contexts to group other contexts in a way that allows teachers to extract useful metrics. A
teacher might be interested in a student’s progress not only through a particular section of a
textbook, but also through the entire chapter in which that section appears, as well as through the
book as a whole. You can design a context hierarchy up to eight levels deep, including the main a
context.
For teachers to be able to assign your app’s content, they have to be able to see it in the
Schoolwork app. Schoolwork becomes aware of your content after you tell ClassKit about it. So
your next task is to declare the existence of all your contexts to ClassKit. This results in a navigab
table of contents in the Schoolwork app that teachers can browse when creating assignments.
You declare a context by requesting it from the data store—the shared CLSDataStore instance—
using an identifier that you assign. The act of asking for a context tells ClassKit that it exists, and
where it lives in the context hierarchy. For details, see Declaring your app’s context hierarchy.
When you ask the data store for a context, whether to declare its existence or to activate and use
the data store looks to see if that context already exists in its database. If so, the data store return
the stored context. If not, the data store asks its delegate to build the context. You adopt the
CLSDataStoreDelegate protocol to build contexts when they don’t already exist, as described
in Building missing contexts.
Tapping in the Schoolwork app on an assignment associated with your ClassKit enabled app
generates a deep link to your app. The link arrives in the form of either a user activity or a univers
link, depending on how you’ve configured the context corresponding to the assignment. By
properly handling this link, as described in Linking directly to assignments, you help teachers to
guide students to the content that’s important to them.
Tell ClassKit About Your Content
Create New Contexts When Needed
Help Teachers Guide Students to Your Content
Activate Contexts When Users Begin a Task


## Page 3

When the user begins a task that corresponds to one of your app’s contexts, you activate the
context. Later, when the user completes the task, you deactivate the context. See Informing
ClassKit that a task is about to begin for details.
Certain aspects of context management only pertain to particular users. For example, students
never see a complete table of contents of your app’s content in Schoolwork, so they don’t need to
declare or build all contexts. They really only need to build the contexts associated with specific
assignments that they receive. However, for privacy reasons, ClassKit doesn’t tell you the current
user’s role. So your app must perform all operations for all users and let ClassKit figure out what
data it actually needs. For more details, see About ClassKit and user roles.
Declaring your app’s context hierarchy
Tell ClassKit about your context hierarchy so teachers can see your assignable content.
Building missing contexts
Create and initialize missing contexts.
Informing ClassKit that a task is about to begin
Activate and deactivate contexts according to user interaction.
Linking directly to assignments
Make it easy for teachers to guide students to specific content.
Creating bookmarks and assignments from your app
Make it easier for teachers to find and assign your content.
Ignore the User’s Role
Topics
Context management
Deep links
Bookmarks
See Also


## Page 4

class CLSContext
An area of your app that represents an assignable task, like a quiz or a chapter.
protocol CLSContextProvider
An interface used to tell your ClassKit context provider app extension to update contexts.
Contexts


## Page 5

Creating bookmarks and assignments from your app
Building missing contexts
Make it easy for teachers to understand the app content a context represents by configuring it wi
information like a clear, concise title localized for the regions that your app supports.
A context can contain groups of other contexts, like a book that contains chapters or a chapter th
contains sections. You can assemble contexts into a hierarchy of up to eight levels that acts as a
table of contents for teachers who want to assign your app content. See Advertising your app’s
assignable content for more details.
init(type: CLSContextType, identifier: String, title: String)
Initializes a new context.
Mentioned in
Overview
Topics
Creating contexts
ClassKit / CLSContext
Class
CLSContext
An area of your app that represents an assignable task, like a quiz or a chapter.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 6

class CLSObject
The abstract base class for objects managed by ClassKit.
var identifier: String
A string that uniquely identifies a context among its siblings.
var title: String
The name of the context as it appears to users.
var summary: String?
An optional, user-visible description of the context.
var thumbnail: CGImage?
An optional thumbnail image associated with the context.
var type: CLSContextType
The kind of content a context represents.
func setType(CLSContextType)
Updates the kind of content that a context represents.
enum CLSContextType
The kinds of assignable content a context can contain.
var customTypeName: String?
An optional name that the system presents to the user if you choose the custom context typ
var suggestedAge: NSRange
The range of ages, measured in years, for which you deem a context’s content suitable.
var suggestedCompletionTime: NSRange
A suggested time range to complete a task, measured in minutes.
var isAssignable: Bool
A Boolean that indicates whether teachers can assign the context as a task.
Identifying the context
Managing the context type
Characterizing the context


## Page 7

var displayOrder: Int
The position of a context relative to its siblings.
var topic: CLSContextTopic?
The area of study to which a context relates.
struct CLSContextTopic
The areas of study to which contexts may relate.
var progressReportingCapabilities: Set<CLSProgressReportingCapability>
The kinds of progress reporting that the context can perform.
func addProgressReportingCapabilities(Set<CLSProgressReportingCapabilit
>)
Adds a progress reporting capability to the set of capabilities for the context.
func resetProgressReportingCapabilities()
Resets the set of capabilities for the context.
class CLSProgressReportingCapability
A progress reporting capability supported by a context.
Informing ClassKit that a task is about to begin
Activate and deactivate contexts according to user interaction.
func becomeActive()
Tells a context to become the active context.
func resignActive()
Tells a context to stop being the active context.
var isActive: Bool
A Boolean indicating whether the context is active.
Managing context presentation
Indicating progress reporting capabilities
Activating and deactivating a context


## Page 8

var currentActivity: CLSActivity?
The activity available for recording progress.
func createNewActivity() -> CLSActivity
Creates and returns a new activity instance for the context.
var identifierPath: [String]
The identifier path that locates the context within the data store’s context hierarchy.
var parent: CLSContext?
The direct ancestor of this context.
func removeFromParent()
Removes the context from its parent.
func addChildContext(CLSContext)
Adds the specifed context as a child of the context receiving the method call.
func descendant(matchingIdentifierPath: [String], completion: (
CLSContext?, (any Error)?) -> Void)
Finds the context with the given identifier path relative to this context.
var navigationChildContexts: [CLSContext]
The child contexts that a user can navigate to from this context in the Schoolwork app.
func addNavigationChildContext(CLSContext)
Adds a child context that users can navigate to from this context.
func removeNavigationChildContext(CLSContext)
Removes the specified context as a presentable child of this context.
Linking directly to assignments
Creating activities
Managing context hierarchy
Creating a context presentation hierarchy
Configuring deep links


## Page 9

Make it easy for teachers to guide students to specific content.
var universalLinkURL: URL?
A URL that leads to the content in your app associated with the current context.
var isClassKitDeepLink: Bool
A Boolean value that indicates whether a user activity represents a ClassKit context.
var contextIdentifierPath: [String]?
The identifier path associated with a user activity generated by an app that adopts ClassKit.
CLSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Advertising your app’s assignable content
Assemble a hierarchy of contexts and declare your app’s assignable content.
protocol CLSContextProvider
Relationships
Inherits From
Conforms To
See Also
Contexts


## Page 10

An interface used to tell your ClassKit context provider app extension to update contexts.


## Page 11

The primary class of a ClassKit context provider extension adopts the CLSContextProvider
protocol. The protocol’s one required method tells the app extension to create or update the
descendants of a given context. Schoolwork triggers this method to fill in your context hierarchy
incrementally as the teacher browses your app’s content.
You still build contexts in your main app to support your app’s normal operation, as described in
Advertising your app’s assignable content. By also creating a context provider app extension, you
enable Schoolwork to advertise your content without having to rely on the teacher first running
your app.
Create a ClassKit context provider by adding a new target to your project in Xcode using File > Ne
> Target. Choose the ClassKit context provider template and give it a name.
Overview
Create a ClassKit Context Provider App Extension
ClassKit / CLSContextProvider
Protocol
CLSContextProvider
An interface used to tell your ClassKit context provider app extension to update
contexts.
iOS 12.2+
iPadOS 12.2+
Mac Catalyst 12.2+
macOS 11.0+
visionOS 1.0+


## Page 12

Xcode adds several supporting files to your project, including a new source file defining the
extension’s primary class that adopts the CLSContextProvider protocol. Fill in the empty
updateDescendants(of:completion:) method with your implementation.
You typically call on the context-building code of your main app in the app extension to avoid
duplicating code. Do this by either linking the app extension against the relevant source files in yo
main app, or by putting the common code into a framework. For an example of the former, see the
sample code in Incorporating ClassKit into an Educational App.
For a general discussion about app extensions, see App Extension Programming Guide.
func updateDescendants(of: CLSContext, completion: ((any Error)?) ->
Void)
Updates the descendants of the given context.
Required
Topics
Updating contexts


## Page 13

Advertising your app’s assignable content
Assemble a hierarchy of contexts and declare your app’s assignable content.
class CLSContext
An area of your app that represents an assignable task, like a quiz or a chapter.
See Also
Contexts


