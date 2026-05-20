# Thread Scheduling.pdf

## Page 1

A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifyin
the quality of a task, you indicate its importance to your app. When scheduling tasks, the system
prioritizes those that have higher service classes.
Because higher priority work is performed more quickly and with more resources than lower prior
work, it typically requires more energy than lower priority work. Accurately specifying appropriate
QoS classes for the work your app performs ensures that your app is responsive and energy
efficient.
static let userInteractive: DispatchQoS
The quality-of-service class for user-interactive tasks, such as animations, event handling, o
updates to your app’s user interface.
static let userInitiated: DispatchQoS
The quality-of-service class for tasks that prevent the user from actively using your app.
Overview
Topics
Getting the Predefined QoS Objects
Dispatch / DispatchQoS
Structure
DispatchQoS
The quality of service, or the execution priority, to apply to tasks.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

static let `default`: DispatchQoS
The default quality-of-service class.
static let utility: DispatchQoS
The quality-of-service class for tasks that the user does not track actively.
static let background: DispatchQoS
The quality-of-service class for maintenance or cleanup tasks that you create.
static let unspecified: DispatchQoS
The absence of a quality-of-service class.
init(qosClass: DispatchQoS.QoSClass, relativePriority: Int)
Creates a new DispatchQoS object with the specified QoS class and relative priority.
enum QoSClass
Quality-of-service classes that specify the priorities for executing tasks.
let qosClass: DispatchQoS.QoSClass
The quality-of-service class.
let relativePriority: Int
The priority of a quality of service relative to others with the same class.
Equatable, Sendable, SendableMetatype
Creating a QoS Structure
Getting the QoS Attributes
Relationships
Conforms To


