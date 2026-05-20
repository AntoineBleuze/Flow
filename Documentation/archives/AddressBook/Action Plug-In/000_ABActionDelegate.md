# 000_ABActionDelegate.pdf

## Page 1

The ABActionDelegate informal protocol allows you to populate the rollover menus of Address
Book with custom items. You do this by implementing an Address Book action plug-in. The plug-
in’s Bundle must implement actionProperty(), title(for:identifier:), and perform
Action(for:identifier:).
Each action plug-in can implement only one action. Actions can only apply to items with labels. A
action can display a simple window inside the Address Book application; if your action actions
needs to do anything else, it should launch your own application to perform the action.
Use Xcode to create Address Book action plug-ins. Place action plug-ins in ~/Library/Addres
Book Plug-Ins or /Library/Address Book Plug-Ins, depending on the scope you want
for the action.
func performAction(for: ABPerson!, identifier: String!)
Sent to the delegate to perform the action.
func actionProperty() -> String!
Sent to the delegate to request the property the action applies to.
Overview
Topics
Performing actions
Querying
Address Book / ABActionDelegate
ABActionDelegate
Implement an Address Book action plug-in to support the display of rollover menu
on top of custom items.


## Page 2

func shouldEnableAction(for: ABPerson!, identifier: String!) -> Bool
Sent to the delegate to determine whether the action should be enabled.
func title(for: ABPerson!, identifier: String!) -> String!
Sent to the delegate to request the title of the menu item for the action.


