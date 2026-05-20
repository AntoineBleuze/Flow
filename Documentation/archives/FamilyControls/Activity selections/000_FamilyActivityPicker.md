# 000_FamilyActivityPicker.pdf

## Page 1

To prompt the user for their selection, create a binding to a FamilyActivitySelection
instance, and use the binding to create a FamilyActivityPicker instance. You can then
display the picker like any SwiftUI view.
Overview
Family Controls / FamilyActivityPicker
Structure
FamilyActivityPicker
A view in which users specify applications, web domains, and categories without
revealing their choices to the app.
iOS 15.0+
iPadOS 15.0+


## Page 2

Note
A FamilyActivityPicker shown on a parent device only displays applications and
websites from authorized child devices within the Family Sharing Group. A FamilyActivity
Picker shown on an individually authorized device includes applications and websites from
that same device.
To streamline this process, call the familyActivityPicker(isPresented:selection:)
modifier on a view in your user interface. This modifier displays the picker view as a sheet over yo
user interface when the isPresented binding is true.
When you present the FamilyActivityPicker, the system displays a view where the user can
select categories, applications, and web domains. As soon as the user confirms their selection, th
system updates the FamilyActivitySelection binding with the user’s selections. To protect
the user’s privacy, the system uses opaque values to represent the selections.
Your app passes the selected values to the appropriate instances and methods from the
ManagedSettings and DeviceActivity frameworks.


## Page 3

init(selection: Binding<FamilyActivitySelection>)
Creates a new activity picker.
var body: some View
The content of this view.
View Modifiers
Apply standard modifiers to configure the family activity picker view and the views it contain
init(headerText: String?, footerText: String?, selection: Binding<Famil
ActivitySelection>)
Creates a new activity picker with optional header and footer text.
Sendable, SendableMetatype, View
Topics
Creating activity pickers
Accessing the content
Adding view modifiers
Initializers
Relationships
Conforms To
See Also
Activity selections


## Page 4

struct FamilyActivitySelection
A collection of applications, categories, and web domains selected by the user.


