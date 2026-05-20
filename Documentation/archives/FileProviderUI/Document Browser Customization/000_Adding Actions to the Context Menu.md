# 000_Adding Actions to the Context Menu.pdf

## Page 1

In your File Provider UI extension’s Info.plist file, you can define custom actions that appear i
the context menu when the user long-presses an item while browsing your file provider’s content
When the user selects the action, the system presents a custom user interface element from you
File Provider UI extension.
In macOS 11 and later, you can define custom actions directly in the File Provider extension. The
system also adds these actions to the context menu; however, when the user selects them, your
extension performs the action without presenting any additional UI elements. For more informatio
see NSFileProviderCustomAction.
Add an NSExtensionFileProviderActions key to the NSExtension dictionary in your Inf
.plist file, as shown in the example below.
Overview
Add Actions to the Context Menu
File Provider UI / Adding Actions to the Context Menu
Article
Adding Actions to the Context Menu
Present custom actions from your File Provider extension in the system’s file
browser.


## Page 2

The NSExtensionFileProviderActions key takes an array of dictionaries. Each dictionary
represents a single action, and contains the keys shown in this table.
Key
Type
Description
NSExtensionFileProvider
ActionIdentifier
String
A unique identifier for the action.
NSExtensionFileProvider
ActionName
String
(Localizable)
The localized name that appears in the
context menu.
NSExtensionFileProvider
ActionActivationRule
Predicate
A predicate that determines whether
the action appears in the context menu
The following sequence of events occurs when the user selects one of your actions from the
context menu:
1. The system instantiates your FPUIActionExtensionViewController subclass.
2. The system calls your view controller’s prepare(forAction:itemIdentifiers:) metho
You can override this method to configure the user interface for the selected action.
3. The system presents your view controller to the user.
4. After the user has finished performing the action, you call the provided FPUIAction
ExtensionContext object’s cancelRequest(withError:) or completeRequest()
method to complete the action.
Use the NSExtensionFileProviderActionActivationRule key to enable or disable
actions based on the selected file provider item. Set the key’s value to a predicate format string
that the system uses to create an NSPredicate object. The system calls the predicate’s
evaluate(with:) method, passing in the selected item, a dictionary with a single
fileproviderItems key. The value is an array of NSFileProviderItem objects representin
the selected items.
Important
Your action must have a predicate or the system won’t display it in the action menu. To always
show an action, use TRUEPREDICATE.
You can use predicates to test the value of any of the NSFileProviderItemProtocol object’
properties. For example, the following predicate tests whether the isUploaded property is set to
Use Predicates to Enable and Disable Actions


## Page 3

true.
You can also use predicates to test custom data that you’ve added to the item’s userInfo
dictionary. For example, the following predicate tests whether the com.example.testBit key
has been set.
If a predicate evaluates to true, the context menu includes the action; if false, the context men
doesn’t include the action. For more about creating predicate format strings, see Predicate Forma
String Syntax.
class FPUIActionExtensionViewController
The custom user interface used to perform a selected action.
See Also
Document Browser Customization


