# Calendar Edits.pdf

## Page 1

Presented modally, the event edit view controller provides a way for users to add new events, as
well as edit or delete events from their calendar. New events are added to the user’s default
calendar unless they choose another calendar in the UI.
The controller includes delegates to receive a notification when the user saves an edit or deletes 
event, or cancels from an edit session. The delegate must conform to EKEventEditView
Delegate.
var editViewDelegate: (any EKEventEditViewDelegate)?
The delegate to notify when editing an event.
protocol EKEventEditViewDelegate
A notification sent to the delegate when the user finishes editing an event.
Overview
Topics
Managing the Event Editing Interface
Creating and Saving Events
EventKit UI / EKEventEditViewController
Class
EKEventEditViewController
A view controller for creating, editing, and deleting calendar events.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
visionOS 1.0+


## Page 2

var event: EKEvent?
The event the user creates or edits using this view controller.
var eventStore: EKEventStore!
The event store used to save the event.
func cancelEditing()
Ends the editing session and discards any changes that were made to the event.
UINavigationController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
Canceling Edits to Events
Relationships
Inherits From
Conforms To


## Page 3

UIUserActivityRestoring


