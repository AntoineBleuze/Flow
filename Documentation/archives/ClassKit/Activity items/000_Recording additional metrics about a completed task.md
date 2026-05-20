# 000_Recording additional metrics about a completed task.pdf

## Page 1

You use an activity to measure how long a task takes and record progress through the task. To
supply additional metrics about the task, you attach one or more activity items to the activity. You
typically add these items to the activity after the user finishes the corresponding task, just before
calling the activity’s stop() method. These items record supplemental information, like a test
score, a measured quantity, or a binary condition (like pass or fail).
Activity items have an identifier that distinguishes them from other items attached to the same
activity, and a title that the teacher sees when reviewing results in the Schoolwork app. After
creating and configuring the item, you add it to the activity using a call to the addAdditional
ActivityItem(_:) method.
For example, for a quiz, you could create an activity item to record the number of times a hint was
used, and report it as a quantity item:
Overview
Create and add items
ClassKit / Recording additional metrics about a completed task
Article
Recording additional metrics about a
completed task
Add an activity item to an activity to record additional information about a student
attempt to complete a task.


## Page 2

In some cases, the most important information about a task isn’t the student’s progress through i
but another metric that you define. For example, for a quiz, teachers are typically interested in the
score. In this case, you provide an optional primary activity item that takes a prominent position in
the reported results.
To add a primary activity item to an activity, you construct the item exactly as described in the
preceding section. But rather than adding it with addAdditionalActivityItem(_:), assign 
to the activity’s primaryActivityItem property instead. For a quiz, you can assign a score ite
as the primary:
Note
Always use the same type of primary activity item for a given kind of activity. For example,
activities generated for a particular quiz context should always have a primary activity item
type of either a score or a pass/fail. Don’t use one value in some places and another in other
places. Inconsistent assignment of primary activity items can confuse teachers when they try
to interpret reported results.
Use activity items to provide insights into a student’s interaction with your app. A quiz score, for
example, demonstrates clearly and quantitatively how well a student understands the
corresponding material.
On the other hand, don’t collect data just for the sake of collecting data. Report only information
that’s meaningful and actionable for teachers. The Schoolwork app is designed to give teachers
insight into student performance, not to report every action a student takes.
Add a primary activity item
Don’t overwhelm teachers with data


## Page 3

class CLSScoreItem
Activity information that signifies a score out of a possible maximum.
class CLSBinaryItem
Activity information that is true or false, pass or fail, yes or no.
class CLSQuantityItem
Activity information that signifies a quantity.
class CLSActivityItem
An abstract base class for gathering information about an activity.
See Also
Activity items


