# Activities.pdf

## Page 1

While contexts describe what tasks a teacher can assign in your app, such as reading a chapter in
book, activities report on student progress as they work through those tasks. An activity measure
duration—the length of time a user spends on a task—based on when you tell the activity to start
and stop. It also records how far a user has progressed through the task as a percentage of
completion, based on updates you supply. It’s up to you to define progress depending on the
particulars of your app.
An activity is always tied to a particular context. In fact, you create a new CLSActivity instance
by asking the context whose task you are measuring to do so on your behalf. The newly created
activity becomes the context’s current activity, which you access later through the context’s
currentActivity property.
Begin by retrieving the relevant context with a call to the descendant(matchingIdentifier
Path:completion:) method. You’ll operate on the context from within the completion handler
Look up a context like this every time you need it, rather than storing a reference to it. The
underlying instance may change from time to time as a result of network synchronization. If you
always look up the context, you can be sure that you’re working with the right instance.
Overview
Retrieve the context
ClassKit / Recording student progress
Article
Recording student progress
Create an activity to record student progress through an assignment.


## Page 2

From within the descendant(matchingIdentifierPath:completion:) method’s
completion handler, activate the context, and then create the activity. Typically, you’ll also start th
activity right after creating it:
Then, while still inside the completion handler, save the changes to record them in the framework
database and share them with the teacher:
For privacy reasons, only users logged in with managed student accounts who have received an
assignment for a given context can save activities in that context to the database. This operation
silently fails for other users (including both teachers and unmanaged users, and even students wh
have not yet received an assignment).
When you create and start an activity as shown above, you indicate that the user has begun an
attempt at the task represented by the given context. This code runs each time a student attempt
a task. For example, within the context of a book chapter, the app may create a reading activity th
measures progress through the material. If the user abandons the task, then the next time they
attempt it, create a new activity to record the new attempt as a new task. What it means to
abandon a task (as opposed to pausing it) depends on your app’s usage model.
Note
In some cases, the user might only pause the task—for example, to review something that
appears in an earlier chapter. In that case, when the user resumes the current task, don’t
create a new activity. Instead, restart the existing one. See Pause an activity when the user
interrupts a task briefly for more details.
Create and start an activity
Update progress periodically


## Page 3

An activity measures duration as the time interval between when you call its start() and stop(
methods. But the concept of progress depends entirely on what your app does, so you supply
additional information in the form of progress updates.
To provide updates, you periodically call the activity’s addProgressRange(fromStart:to
End:) method at intervals that make sense for your app. For a book reader, you might define
progress in terms of how many pages the user has read, calling for an update every time the user
turns a page:
Another app that presents content in a scroll view might define progress as the current position
relative to the bottom of the view, to be updated in the scrollViewDidScroll(_:) callback o
the UIScrollViewDelegate protocol:
You can call the data store’s save(completion:) method every time you add a progress updat
to ensure your changes are reported to the teacher. And for certain long-running activities with
infrequent updates, this might make sense. But for performance reasons, in most cases it’s best t
wait until the activity ends, after which you save all the updates in one shot. This is particularly tru
if you generate frequent progress updates, as you might from the scrollViewDidScroll(_:)
method.
When the user aborts or completes a task, for example by navigating away from the chapter
they’ve been reading, or by answering all the questions on a quiz, mark the activity as stopped:
Stop an activity when the user ends the attempt


## Page 4

Call the data store’s save(completion:) method at this point to ensure your accumulated
progress updates and state changes synchronize to the network.
Note
Because data must be synchronized across the network, expect some delay in a production
environment between when you record results in your app, and when the teacher actually sees
the results in Schoolwork.
You can also use the stop() method to pause an activity. For example, if you’re measuring
progress through a game and the user taps the pause button, you may want to tell the
corresponding activity to stop. Resume a paused activity with another call to the start() metho
You can stop and start repeatedly, but once you create a new activity in a given context using a ca
to the createNewActivity() method, the previous activity becomes final, and can no longer b
accessed from your app.
Whether pausing makes sense depends on the particulars of your app. Typically, you pause when
the user interrupts a task with the expectation of continuing after a brief delay, but create a new
activity when the user makes a fresh attempt at a task.
Note
The framework automatically pauses a running activity if your app enters the background, and
resumes the same activity when your app returns to the foreground.
Pause an activity when the user interrupts a task briefly


## Page 5

For each assignment, the Schoolwork app displays a per-student Done indicator to teachers.
Students self-report this status by tapping a button in their own instance of Schoolwork. To do th
same thing programmatically from your app, call the completeAllAssigned
Activities(matching:) method.
You can do this automatically for tasks that have a well-defined end point, like a timed quiz. After
time runs out, the student isn’t allowed to make any further changes, so your app marks the task 
done. For a task without a strict time limit, but that ends with a submission of an artifact, like a
drawing or a poem, you can call the completion method as part of the submission flow. If you
already have a done button of some kind in your interface, you can call the method from that
button’s handler.
Note
A task’s progress isn’t connected to its Done indicator. For example, setting the progress
property to 1 doesn’t automatically force the Done indicator to true. Use progress to give
teachers an idea of which parts of a task the student has attempted. Use the Done indicator to
indicate that the student plans no further action for the activity.
If you group contexts into a hierarchy, you might want to record progress at multiple levels of the
hierarchy concurrently. This lets you measure progress through a small, indivisible task, like readi
a chapter in a book, while simultaneously recording progress through the larger, enclosing task, li
reading the whole book in which that chapter appears. Do this by running more than one activity a
a time.
For example, when the user begins reading Chapter 1 of a book, you start an activity in the Chapt
1 context and another in the book context. You set progress independently for each, while each
maintains its own duration measurement. When the user begins reading Chapter 2, you stop the
Chapter 1 activity and then create and start a new activity in Chapter 2. The book activity continu
running through the chapter change.
So the duration of time spent working on the book automatically becomes the cumulative duratio
of reading all the chapters. On the other hand, it’s up to you to report progress in the book contex
in a way that’s meaningful. For instance, if the chapters are all about the same length, you might s
book progress simply as the fraction of the number of chapters read. But if they aren’t, you might
need to account for the relative size of each chapter in setting book progress.
Optionally, mark an assignment as done
Record progress at multiple levels of hierarchy


## Page 6

You can nest activities like this to the full depth of your context hierarchy. For example, the
chapters might each contain multiple sections, in which case you run the book, a chapter, and a
particular section activity all at the same time.
When you do run more than one activity at a time, the data store’s runningActivity property
reports only the most recently started activity.
Important
Recording at multiple levels of hierarchy is available in iOS 11.4 or later. In iOS 11.3, you can only
run one activity at a time, so starting an activity when one is already running implicitly forces
the running one to stop.
class CLSActivity
A representation of user interaction with a context.
See Also
Activities


## Page 7

Recording student progress
An activity represents a student’s attempt to complete the task corresponding to a CLSContext
instance. For example, if a context represents a quiz, the associated activity represents the
student’s attempt to take the quiz. As such, an activity is always associated with a context. In fact
you never initialize an activity in isolation or store a reference to it. Rather, you ask a context to
create the activity and retrieve it from the context.
You start the activity with a call to the start() method when the user begins the task, and stop 
with a call to the stop() method when the user finishes. You can also use the stop() method to
stop it temporarily if the user pauses the task, in which case you can start it again later with anoth
call to start() when the user resumes. The activity keeps track of the total time spent in the
running state, which you can read via the duration property.
Whether you implement activity pausing depends on how the parts of your app work. For example
you might pause a game activity when the user presses the pause button to reflect that the user
has stepped away from the activity, but is likely to return soon to complete the task. On the other
hand, you might not provide a way to pause a quiz activity because you require that it be
Mentioned in
Overview
Starting and Stopping Activities
ClassKit / CLSActivity
Class
CLSActivity
A representation of user interaction with a context.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 8

completed without interruption, once started. If you do pause, you can start and stop an activity a
many times as you want, but when you create a new activity (representing a new attempt at a tas
you can no longer access the older activity from your app.
You can also assign progress to an activity. How you define progress depends on the task being
measured. For example, progress through a quiz can be recorded as the fraction of questions
answered, while progress through a game level might be calculated as the fraction of obstacles
overcome.
To record additional metrics, you attach CLSActivityItem instances to an activity. For example
you can add both a score and a count of hints used to a quiz activity. If one of these items should
be featured prominently, you can make it the primaryActivityItem.
func start()
Tells an activity to start recording duration and progress for a task.
func stop()
Tells an activity to stop or pause recording duration and progress for a task.
var isStarted: Bool
A Boolean that indicates whether an activity is running.
var duration: TimeInterval
The cumulative time in seconds that an activity has been active.
var progress: Double
A measure of progress through the task, given as a fraction in the range [0, 1].
func addProgressRange(fromStart: Double, toEnd: Double)
Adds a progress range to a given activity.
Recording Progress
Topics
Starting and stopping an activity
Measuring progress
Managing activity items


## Page 9

func addAdditionalActivityItem(CLSActivityItem)
Adds an activity item to an activity.
var primaryActivityItem: CLSActivityItem?
Adds an activity item to an activity and sets it as the primary activity item.
var additionalActivityItems: [CLSActivityItem]
The list of activity items associated with an activity.
func removeAllActivityItems()
Deletes all activity items associated with the current activity.
CLSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Recording student progress
Create an activity to record student progress through an assignment.
Relationships
Inherits From
Conforms To
See Also
Activities


## Page 10



