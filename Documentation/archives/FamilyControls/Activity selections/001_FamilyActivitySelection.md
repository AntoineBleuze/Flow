# 001_FamilyActivitySelection.pdf

## Page 1

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


## Page 2

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


## Page 3

Decodable, Encodable, Equatable
struct FamilyActivityPicker
A view in which users specify applications, web domains, and categories without revealing
their choices to the app.
See Also
Activity selections


