# 001_LocationButton.pdf

## Page 1

LocationButton simplifies requesting one-time authorization to access location data. Add this
button to your SwiftUI user interface in situations when users may want to grant temporary acces
to their location data each time they use a particular feature of your app.
The first time a user taps this button, Core Location asks the user to confirm that they’re
comfortable using this UI element when they want to grant temporary access to their location dat
If the user agrees, the app receives temporary CLAuthorizationStatus.authorizedWhenI
Use authorization, like when the user chooses Allow Once in response to your app’s standard
location authorization request. This temporary authorization expires when your app is no longer in
use.
After the user agrees to using LocationButton, the button becomes approved to request futur
authorizations without displaying an additional alert to the user. The next time the user taps it, thi
button simply grants one-time authorization without requiring confirmation.
After you receive this temporary authorization, fetch the user’s location using the Core Location A
and perform any app-specific tasks related to that location data. Connect the button to initiate th
tasks you want to perform after getting authorization by specifying an action when you create the
Overview
CoreLocationUI / LocationButton
Structure
LocationButton
A SwiftUI button that grants one-time location authorization.
CoreLocationUI
SwiftUI
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
watchOS 8.0+


## Page 2

button. Keep in mind that this action activates every time the user taps this button, regardless of
whether the app already has location authorization.
Create a LocationButton in SwiftUI like this:
Important
When a user taps the button, it only provides one-time authorization to fetch location data —
not the location data itself. For more details about fetching location data, see Configuring your
app to use location services.
Configure the button to display an icon, a label, or both using the labelStyle(_:) view modifie
If you include an icon, you can customize its appearance using the symbol
Variant(_:) modifier. For design guidance, see Human Interface Guidelines.
init(LocationButton.Title?, action: () -> Void)
Creates a location button with the specified title and action.
struct Title
Constants that specify the text of a button title.
Sendable, SendableMetatype, View
Topics
Creating a location button
Relationships
Conforms To


## Page 3

Sharing Your Location to Find a Park
Ask for location access using a customizable location button.
class CLLocationButton
A button that grants one-time location authorization.
See Also
Location authorization


