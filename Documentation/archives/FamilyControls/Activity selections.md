# Activity selections.pdf

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


## Page 5

To protect the user’s privacy, FamilyActivitySelection holds opaque values that represent
categories, applications, and web domains selected by the user.
You can then pass these opaque values to instances and methods from the ManagedSettings and
DeviceActivity frameworks to set up and manage parental controls.
Important
If a user, parent, or guardian revokes authorization of your app, any tokens that Family
ActivitySelection provided while your app was authorized are voided.
For more information on prompting the user to select items, see FamilyActivityPicker.
var categories: Set<ActivityCategory>
A set of category instances selected by the user.
Overview
Topics
Accessing selected categories
Family Controls / FamilyActivitySelection
Structure
FamilyActivitySelection
A collection of applications, categories, and web domains selected by the user.
iOS 15.0+
iPadOS 15.0+


## Page 6

var categoryTokens: Set<ActivityCategoryToken>
Tokens that represent categories selected by the user.
init(includeEntireCategory: Bool)
Creates a new activity selection instance.
var applications: Set<Application>
A set of application instances selected by the user.
var applicationTokens: Set<ApplicationToken>
Tokens that represent applications selected by the user.
var webDomains: Set<WebDomain>
A set of web domain instances selected by the user.
var webDomainTokens: Set<WebDomainToken>
Tokens that represent web domains selected by the user.
init()
Creates a new activity selection instance.
let includeEntireCategory: Bool
A Boolean value that indicates whether the selection should include applications and web
domains from the selected categories.
Accessing selected applications
Accessing selected web domains
Creating activity selections
Comparing activity selections
Relationships
Conforms To


## Page 7

Decodable, Encodable, Equatable
struct FamilyActivityPicker
A view in which users specify applications, web domains, and categories without revealing
their choices to the app.
See Also
Activity selections


