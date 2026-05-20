# Creation.pdf

## Page 1

An App Clip is a lightweight version of your app that offers some of its functionality when and
where people need it or that people use to try out your full app. With Xcode, you can add an App
Clip target to your app’s project, share code and assets between the App Clip and the full app, an
build, run, and debug your App Clip.
App Clips require a corresponding full app that offers at least the same functionality as the App
Clip; you use the same Xcode project for your full app and your App Clip. If you’re starting a new
app project, first create a new iOS project with Xcode. If you want to add an App Clip to your
existing iOS app, open its Xcode project. Then, add an App Clip target to the Xcode project:
1. Add a new target using the App Clip template.
2. Choose a product name, select applicable options for your App Clip, and click Finish.
Overview
Add an App Clip target
App Clips / Creating an App Clip with Xcode
Article
Creating an App Clip with Xcode
Add an App Clip target to your Xcode project and share code between the App Cl
and its corresponding full app.


## Page 2

Xcode creates all required files for the options you choose and adds a target for your App Clip wit
A scheme to build and run your App Clip and its tests
A new capability named On Demand Install Capable that adds the com.apple.developer
.on-demand-install-capable entitlement
The Parent Application Identifiers Entitlement
An app identifier for the App Clip, using the full app’s app identifier as its prefix, followed by a
string. For example, if your full app’s app identifier is $(AppIdentifierPrefix)com
.example.MyApp, the app identifier for your App Clip would be $(AppIdentifier
Prefix)com.example.MyApp.Clip
The _XCAppClipURL environment variable for the scheme of your App Clip that allows you to
debug invocations
Support for the same devices as the full app, not including macOS
Additionally, Xcode creates a new build phase for the app target that embeds the App Clip in the
app.
Before you add code to the App Clip target, run the App Clip in Simulator or on a device. At this
point, the App Clip shows an empty white screen because you haven’t yet added any code and
assets to the App Clip target.


## Page 3

Note
When you archive the app that comes with an App Clip, Xcode adds the com.apple
.developer.associated-appclip-app-identifiers entitlement to your app.
Together with the Parent Application Identifiers Entitlement, it associates your
App Clip with your app.
App Clips make use of the same frameworks as full apps, and adding code or assets to an App Cl
target works just like it does for any other target. Create new source files and assets, or use
existing source files and assets, and add them as members to the App Clip target. To ensure the
project’s maintainability, both the full app and the App Clip should share as much code as possibl
If you create a new app, build it with creating an App Clip in mind, and follow best practices tha
promote a modular code base. For example, create reusable components, bundle them as Swif
packages, and use the packages in both the full app and the App Clip. For more information, se
Organizing your code with local packages.
If you add an App Clip to an existing app, set aside time to refactor the app’s code base to be
modular and share code between the App Clip and the full app to avoid duplicating code.
Add shared assets to a new asset catalog, and use the catalog in both the full app and the App
Clip. For more information about asset catalogs, see Managing assets with asset catalogs.
Your App Clips must be small to launch instantly. Aim to keep your App Clip well below the
applicable limits outlined in Choosing the right functionality for your App Clip.
To measure the size of your App Clip, create an app-size report for your App Clip:
1. In Xcode, archive the app that belongs to your App Clip, open the Organizer window, select the
archive, and click Distribute App.
2. Export the App Clip as an Ad Hoc or Development build with App Thinning enabled.
The output folder for your exported App Clip contains its size report, a file named App Thinnin
Size Report.txt. Open the text file, note the uncompressed size of your App Clip for each
variant, and then make adjustments to your project to keep the uncompressed size for each varia
below the applicable size limit.
For more information on measuring your app’s size, see Reducing your app’s size.
Add code and assets
Verify the size of your App Clip


## Page 4

App Clips can use Background Assets to download additional content. If your App Clip offers an in
the-moment experience, ensure instant availability by keeping the App Clip as small as possible
and avoiding usage of Background Assets.
If you create an App Clip to offer a demo version of your app or your game, and are confident that
people have a reliable and fast network connection when they invoke your App Clip, use
Background Assets to down additional content. For example, the App Clip demo of a game might
include assets needed for people to start the demo and create their in-game hero. To keep the Ap
Clip small, it might not include the assets needed to play the first three levels of the game but
downloads them while people create their hero.
To download additional assets in the background, make sure you configure Background Assets fo
your app and App Clip targets. Note that your App Clip can’t set a background asset download’s
priority to essential with isEssential.
Adding an App Clip to your app is a good opportunity to refactor your app’s code to be modular
and reusable. Most functionality and frameworks available to your full app are available to your Ap
Clip. However, you may encounter cases where you can’t use some of your app’s code in the App
Clip, and creating separate modules for your app and App Clip code isn’t feasible. In these cases,
take advantage of the Active Compilation Conditions build setting, where you can declare a
condition to exclude code.
Start by navigating to your App Clip target’s build settings and creating a new value for the Active
Compilation Condition build setting (for example, APPCLIP). Then, add a check in your shared
code where needed, to exclude code you don’t want to use in your App Clip.
The following code checks for the APPCLIP value you added to the Active Compilation Condition
build setting:
Download additional assets
Use active compilation conditions


## Page 5

Adding an App Clip target to your app’s Xcode project and modifying the project are only the first
steps in offering an App Clip. Next, plan to spend time designing the launch experience of your Ap
Clip by:
Reviewing how invocations work
Identifying invocations you want to support
Planning which URLs launch your App Clip
Changing your code to respond to invocations
Based on the decisions you make, you’ll use App Store Connect to:
Configure the required default App Clip experience
Use the default App Clip link or the App Clip demo link
Configure optional advanced App Clip experience
Add code to respond to different invocation URLs
Create App Clip Codes
To learn more about the App Clip launch experience for your App Clip, see Configuring App Clip
experiences and Responding to invocations.
You may also have to associate your App Clip with your website and make changes to your server
For more information, refer to Associating your App Clip with your website.
When it’s time to test your App Clip, use Xcode to test the launch experience locally or test it with
TestFlight. For more information, see Testing the launch experience of your App Clip.
Fruta: Building a feature-rich app with SwiftUI
Create a shared codebase to build a multiplatform app that offers widgets and an App Clip.
Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
com.apple.developer.associated-appclip-app-identifiers
A list of App Clip identifiers for an app with exactly one entry.
Review next steps
See Also
Creation


## Page 6

com.apple.developer.on-demand-install-capable
A Boolean value that indicates whether a bundle represents an App Clip.


## Page 7

Note
This sample project is associated with WWDC21 sessions 10107: Platforms State of the Union,
10012: What’s New in App Clips, 10013: Build Light and Fast App Clips, 10220: Localize your
SwiftUI App.
It’s also associated with WWDC20 sessions 10637: Platforms State of the Union, 10146:
Configure and Link Your App Clips, 10120: Streamline Your App Clip, 10118: Create App Clips
for Other Businesses, 10096: Explore Packages and Projects with Xcode Playgrounds, and
10028: Meet WidgetKit.
The Fruta sample project builds an app for macOS, iOS, and iPadOS that implements SwiftUI
platform features like widgets, App Clips, and localization. Users can order smoothies, save favor
drinks, collect rewards, and browse recipes. It contains two flavors of app targets:
Simple iOS and macOS app targets that you build using Personal Team signing. This iOS app
runs in Simulator, and only requires a standard Apple ID to install on a device. The simple app
implements a rich, localized SwiftUI interface. Users can browse and order smoothies, and sav
favorite drinks.
Full featured iOS All and macOS All app targets. The full iOS app runs in Simulator, and on
devices with an Apple Developer membership. This app includes widget extensions that enable
Overview
App Clips / Fruta: Building a feature-rich app with SwiftUI
Sample Code
Fruta: Building a feature-rich app with
SwiftUI
Create a shared codebase to build a multiplatform app that offers widgets and an
App Clip.
Download
iOS 15.4+
iPadOS 15.4+
macOS 12.3+
Xcode 13.3+


## Page 8

users to add a widget to their iOS Home Screen or the macOS Notification Center, and to view
their rewards or a favorite smoothie. This app also embeds an App Clip. With the App Clip, use
can discover and instantly launch some of the app’s functionality on their iPhone or iPad withou
installing the app.
The Fruta sample app leverages Sign in with Apple and PassKit (Apple Pay and Wallet) to provide 
streamlined user experience.
To build this project for iOS 15.4, use Xcode 13.3. The runtime requirement is iOS 15.4. To build th
project for macOS 12.3, use Xcode 13.3.
To configure the iOS and macOS app targets without an Apple Developer account, follow these
steps:
1. In the targets’ Signing & Capabilities panes click Add Account, and log in with your Apple ID.
2. Chose the Your Name (Personal Team) from the team drop down menu.
3. Click build-and-run.
4. On iOS and iPadOS devices you need to navigate to Settings > General > VPN & Device
Management and trust your developer certificate.
To configure the iOS All and macOS All apps, follow these steps:
1. To run on your devices, including on macOS, set your team in the targets’ Signing & Capabilitie
panes. Xcode manages the provisioning profiles for you.
2. To run on an iOS or iPadOS device, open the iOSClip.entitlements file and update the
value of the Parent Application Identifiers Entitlement to match the iOS app’s
bundle identifier.
3. Make a note of the App Group name on the iOS target’s Signing & Capabilities tab in Project
Settings. Substitute this value for group.example.fruta in the Model.swift file.
4. To enable the in-app-purchase flow, edit the Fruta iOS “Run” scheme, and select
Configuration.storekit for StoreKit Configuration.
To create a single app definition that works for multiple platforms, the project defines a structure
that conforms to the App protocol. Because the @main attribute precedes the structure definition
the system recognizes the structure as the entry point into the app. Its computed body property
returns a WindowGroup scene that contains the view hierarchy displayed by the app to the user.
SwiftUI manages the presentation of the scene and its contents in a platform-appropriate manner
Configure the sample code project
Create a shared codebase in SwiftUI


## Page 9

For more information, see App organization.
On iOS and iPadOS, the Fruta app offers some of its functionality to users who don’t have the full
app installed as an App Clip. The app’s Xcode project contains an App Clip target, and, instead of
duplicating code, reuses code that’s shared across all platforms to build the App Clip. In shared
code, the project makes use of the Active Compilation Condition build setting to exclude code for
targets that don’t define the APPCLIP value. For example, only the App Clip target presents an A
Store overlay to prompt the user to get the full app.
Offer an App Clip


## Page 10

For more information, see Creating an App Clip with Xcode and Choosing the right functionality fo
your App Clip.
To allow users to see some of the app’s content as a widget on their iOS Home screen or in the
macOS Notification Center, the Xcode project contains targets for widget extensions. Both use
code that’s shared across all targets.
For more information, see WidgetKit.
Creating an App Clip with Xcode
Add an App Clip target to your Xcode project and share code between the App Clip and its
corresponding full app.
Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
com.apple.developer.associated-appclip-app-identifiers
A list of App Clip identifiers for an app with exactly one entry.
com.apple.developer.on-demand-install-capable
Create a widget
See Also
Creation


## Page 11

A Boolean value that indicates whether a bundle represents an App Clip.


## Page 12

Key
com.apple.developer.parent-application-identifiers
Type
Array of strings
The Parent Application Identifiers entitlement establishes a secure association between an App C
and its corresponding app. Add it only to an App Clip target.
Note
When you add an App Clip target to your project as described in Creating an App Clip with
Xcode, Xcode creates this entitlement and adds the correct value.
Because an App Clip is always associated with exactly one app, ensure the parent application
entitlement has exactly one entry, the corresponding app’s application identifier.
Ensure that the application identifier for the App Clip uses the full app’s application identifier as its
prefix, followed by a string. For example, if your app’s application identifier is $(AppIdentifier
Prefix)com.example.MyApp, the App Clip’s application identifier may be $(AppIdentifie
Prefix)com.example.MyApp.Clip.
Details
Discussion
Bundle Resources / Entitlements / Parent Application Identifiers Entitlement
Property List Key
Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
iOS 14.0+
iPadOS 14.0+


## Page 13

com.apple.developer.associated-appclip-app-identifiers
A list of App Clip identifiers for an app with exactly one entry.
com.apple.developer.on-demand-install-capable
A Boolean value that indicates whether a bundle represents an App Clip.
See Also
App Clips


## Page 14

Type
Array of strings
The com.apple.developer.associated-appclip-app-identifiers entitlement
provides an app with the bundle ID of its associated App Clip. Together with the Parent Applicatio
Identifiers Entitlement, the Associated App Clip Identifiers entitlement establishes an association
between your App Clip and your app that the system uses to enable data sharing between them.
For additional information on sharing data between your App Clip and your full app, see Sharing
data between your App Clip and your full app.
Note
Xcode adds this entitlement when you archive an app that includes an App Clip.
Details
Discussion
See Also
App Clips
Bundle Resources / Entitlements / com.apple.developer.associated-appclip-app-identifiers
Property List Key
com.apple.developer.associated-appclip-
app-identifiers
A list of App Clip identifiers for an app with exactly one entry.
iOS 15.4+
iPadOS 15.4+


## Page 15

Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
Key: com.apple.developer.parent-application-identifiers
com.apple.developer.on-demand-install-capable
A Boolean value that indicates whether a bundle represents an App Clip.


## Page 16

Type
Boolean
Adding an App Clip target to your project as described in Creating an App Clip with Xcode enable
a capability called On Demand Install Capable for the App Clip target.
When you code-sign your full app, Xcode embeds the App Clip in the full app and applies the com
.apple.developer.on-demand-install-capable entitlement. Because of this behavior,
the App Clip’s .entitlements file doesn’t include this entitlement if you open the file in Xcode’
Project navigator.
To see the entitlement in the .entitlements file, first archive the full app, then export the App
Clip for distribution as described in Distributing your App Clip. Next, open the Terminal app and ru
codesign -d --entitlements :- /path/to/ExampleApp.app/AppClips/Example
AppClip.app.
Details
Discussion
See Also
App Clips
Bundle Resources / Entitlements / com.apple.developer.on-demand-install-capable
Property List Key
com.apple.developer.on-demand-install-
capable
A Boolean value that indicates whether a bundle represents an App Clip.
iOS 14.0+
iPadOS 14.0+


## Page 17

Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
Key: com.apple.developer.parent-application-identifiers
com.apple.developer.associated-appclip-app-identifiers
A list of App Clip identifiers for an app with exactly one entry.


