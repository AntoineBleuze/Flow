# 001_CNContactPicker.pdf

## Page 1

Before displaying the popover, configure the displayedKeys property with the information you
want to display in the interface.
var delegate: (any CNContactPickerDelegate)?
The picker delegate to be notified when the user chooses a contact.
protocol CNContactPickerDelegate
The methods that you implement to respond to contact-picker user events.
var displayedKeys: [String]
The keys to be displayed when a contact is expanded.
Overview
Topics
Responding to Picker Interactions
Configuring the Picker Contents
Contacts UI / CNContactPicker
Class
CNContactPicker
A popover-based interface for selecting a contact.
macOS 10.11+


## Page 2

func showRelative(to: NSRect, of: NSView, preferredEdge: NSRectEdge)
Shows the picker popover anchored to the specified view.
func close()
Closes the popover.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CNContactPickerViewController
A view controller that displays an interface for picking contacts.
Displaying the Popover
Closing the Popover
Relationships
Inherits From
Conforms To
See Also
Contact pickers


