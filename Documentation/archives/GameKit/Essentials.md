# Essentials.pdf

## Page 1

Game Center is a social gaming network that helps players discover your games across Apple
devices. Players can track their scores on leaderboards, view achievement progress, participate i
challenges, and more. Before you can use the GameKit framework and access Game Center data
you need to enable Game Center. When you enable Game Center in your project, Xcode adds the
Game Center entitlement to your App ID.
After you enable Game Center, you can configure the features you want to use in your game — lik
leaderboards, achievements, activites, and challenges — right in Xcode or in App Store Connect.
For more information about the Game Center service, see Overview of Game Center.
Add the Game Center capability to your project, so you can configure gameplay features for your
game:
1. In Xcode, select the project in the main window.
2. Select the target in the project editor that appears on the right.
3. Click the Signing & Capabilities tab.
4. Click the add capability button (+ Capability) in the toolbar.
5. Add the Game Center capability by double-clicking on it.
Overview
Enable Game Center
GameKit / Initializing and configuring Game Center
Article
Initializing and configuring Game Center
Enable Game Center, configure features, and test them locally in your Xcode
project.


## Page 2

For Mac targets, ensure that you enable both Incoming Connections and Outgoing Connections in
the App Sandbox capability under Network.
Use a GameKit bundle file to configure achievements, activities, challenges, leaderboards, and
leaderboard sets. You need to configure these features in Xcode before you can access them in
your code and begin testing them. When you configure resources, you can organize the list in the
way you want Game Center to present them.
Begin configuring the feature you want by creating a GameKit bundle file:
1. In Xcode 16.3 and later, choose File > New > File from Template.
2. Choose either iOS or macOS as the platform.
3. Scroll down to Other, and select the GameKit Bundle template.
4. Click Next.
5. In the sheet that appears, enter a name for the configuration and select the appropriate targets
6. Click Create.
Configure Game Center features


## Page 3

When you’re ready to deploy your configuration updates, sync them with App Store Connect. If yo
already configured features in App Store Connect, you can sync your existing configuration with
the GameKit bundle file:
1. At the bottom of the left column, click the More (…) button.
2. Choose Pull from App Store Connect.
3. Select your development team.
4. Select the bundle ID or Game Center group.
5. Click Pull.
The details for the resource then appear in the editor at right. If you already pushed your
configuration changes to App Store Connect, removing a resource from the local configuration fil
doesn’t remove it from App Store Connect.
If you don’t have an app record in App Store Connect, create one so you can sync your
configuration while you develop your game. To create an app record in App Store Connect that
matches your App ID in your developer account, see Add a new app in App Store Connect Help. T
enable Game Center for versions of your app, see the “Enable app version for Game Center”
section of Manage an app version for Game Center.
Test Game Center features by using the Game
Progress Manager


## Page 4

Use Game Progress Manager to test your game features locally during development by modifying
properties, reporting updates, and resetting resources. You can also use it to test features and
deep links to your game.
Before testing your GameKit configuration, turn on Debug Mode in Xcode:
1. Choose Product > Scheme > Edit Scheme.
2. Select the Run configuration in the left column.
3. Select Options.
4. Scroll down to GameKit Configuration, and click the Enable Debug Mode checkbox.
5. Click Close.
To test your configuration, open Game Progress Manager in Xcode:
1. Choose Debug > GameKit > Manage Game Progress.
2. In the sidebar, click the “Select a device” pop-up button, and select the physical device you us
for testing.
3. Click the pop-up button beneath that and select the project you want to debug.
The test data stays local to your machine and doesn’t rely on App Store Connect to test.


## Page 5

Important
Testing your app with the Game Progress Manager requires a physical device and is available
for iOS 18.4 and later, macOS 15.4 and later, tvOS 18.4 and later, and visionOS 2.4 and later.
After selecting the device and app, choose the Game Center feature you want to test. In the
inspector panel for a resource, you can simulate a variety of updates, like achievement progress,
leaderboard scores, and deep links to your game activities.
Tip
When testing score submissions to a leaderboard, the system can notify you when they
happen instead of needing to manually check. In iOS, open Settings > Developer and turn on
Notify About Score Submissions.
To reset the progress for your Game Center resource, click the reset button at the top of the Gam
Progress Manager. You can’t access previous occurrences of a resource after resetting the Game
Progress Manager.
In your game, you need to initialize the local player before you can use any GameKit APIs and Gam
Center services. Game Center isn’t a single sign-on (SSO) authentication service, so don’t use it f
authentication. When you initialize the player, you connect the player with the Game Center
services.
The best time to initialize Game Center is when the player launches your game, so don’t hide
initialization behind game menus or the settings screen. When you initialize the local player, Game
Center:
Checks whether you configured your game for Game Center
Verifies the credentials of the player and ensures their account is ready for use
To initialize the player, set authenticateHandler on the shared instance of GKLocalPlayer
that represents the player of your game:
For more information about initializing a local player, see Authenticating a player.
Initialize the local player


## Page 6

You use the handler to initialize Game Center. If you need to authenticate a person with your own
server, continue the flow with fetchItems(forIdentityVerificationSignature:).
Authenticating a player
Confirm player credentials and device capabilities and check for account restrictions.
Improving the player experience for games with large downloads
Provide ample content in your base installation and then use on-demand resources and the
Background Assets API to handle additional content.
Game Center Entitlement
A Boolean value that indicates whether users of the app may see and compare achievement
on a leaderboard, invite friends, and start multiplayer games.
See Also
Essentials


## Page 7

To identify themselves and access their game data from all their devices, players create a Game
Center account that includes a profile with an avatar and nickname. A single account allows playe
to sign in to Game Center once and use the same credentials for all Game Center games on their
device.
In the GameKit framework, you use player objects to post scores, award achievements, build
leaderboards, and start multiplayer games. The local player (GKLocalPlayer) represents the us
playing your game and other players (GKPlayer) may be friends, recent matches, or global playe
of your and other games.
Before you access any Game Center data, you must verify that the local player signed in to Game
Center on the device. Check if the player has any account restrictions and adjust your game
accordingly. On Apple TV, your game can also support the ability to switch between user account
In your game, you need to initialize the local player before you can use any GameKit APIs and Gam
Center services. Game Center verifies the credentials of the player and ensures their account is
ready for use. Game Center also checks whether you configured your game for Game Center.
To initialize the user, set the handler (authenticateHandler) on the shared instance of
GKLocalPlayer that represents the player of your game as in:
Overview
Initialize the local player
GameKit / Authenticating a player
Article
Authenticating a player
Confirm player credentials and device capabilities and check for account
restrictions.


## Page 8

Note
You use the handler to initialize Game Center. If you need to authenticate a person with your
own server, continue the flow with GKLocal
Player/fetchitems(foridentityverificationsignature:).
GameKit calls the handler, possibly several times, for the following cases:
If the local player needs to perform some action, GameKit passes a view controller that you mu
present to the player to complete initialization.
If the player successfully signs in, GameKit sets the local player’s isAuthenticated propert
to true and calls the handler again, this time passing nil for both the view controller and erro
parameters. You can then start the game.
If the player decides not to sign in or create a Game Center account, GameKit sets the local
player’s isAuthenticated property to false and calls the handler again by passing an erro
that indicates the reason the player isn’t available. In this case, disable Game Center in your
game.
If the local player previously signed in on the device when you set the handler, GameKit sets th
local player’s isAuthenticated property to true and passes nil for both the view controll
and error parameters, and you can start the game.
Before starting a game, check the local player’s account for restrictions and disable or hide
features and content accordingly.
Check if there are any restrictions in the handler when the player signs in to Game Center. In
addition to checking whether the player is underage (isUnderage) or not allowed to play
multiplayer games (isMultiplayerGamingRestricted), check for any communication
restrictions (isPersonalizedCommunicationRestricted).
Check for restrictions


## Page 9

If the isPersonalizedCommunicationRestricted property is true, then the player isn’t
allowed to use voice or messaging features during a multiplayer game. If your game includes any
custom communication features, you should disable them. Note that if the player is underage, this
property is always true.
Multiple people can sign in to their accounts on a single Apple TV and you can allow players to run
your game on Apple TV using their individual Game Center account. After you configure your app
add code to support user switching; otherwise, the system runs your game as the default user.
To support user switching, add the User Management capability to your app in Xcode. In the
project editor, select the target, click the Signing & Capabilities tab, click the Library button (+),
and then double-click the User Management capability or drag it to the Signing & Capabilities
pane. Under User Management in the Signing & Capabilities pane, select Run as Current User. Th
entitlement grants your game access to the current user’s Game Center data.
Support user switching


## Page 10

When the user switches on Apple TV, the system relaunches your game. To save game data if the
users switch while your game is in the foreground, implement the applicationWill
Terminate(_:) method. To save data when the user switches to another app, implement the
applicationWillResignActive(_:) method.
When the system relaunches your game, GameKit passes the new user to the handler you use to
initialize Game Center. For more information on user switching, see Personalizing Your App for Ea
User on Apple TV.
Initializing and configuring Game Center
Enable Game Center, configure features, and test them locally in your Xcode project.
Improving the player experience for games with large downloads
Provide ample content in your base installation and then use on-demand resources and the
Background Assets API to handle additional content.
Game Center Entitlement
A Boolean value that indicates whether users of the app may see and compare achievement
on a leaderboard, invite friends, and start multiplayer games.
See Also
Essentials


## Page 11

As games become larger and more visually impressive, it’s important to balance initial download
time with a smooth gameplay experience and responsible disk usage. Providing a small base
installation that merely begins another installation phase doesn’t make for a great experience whe
players are excited to play your game. Instead, provide enough content in your initial download th
a player can evaluate your game, and keep your initial download to under 30 minutes. Apple
provides two technologies that your game can use to provide the right amount of content in your
base installation and help you download additional content in the background: on-demand
resources and the Background Assets framework.
If your game targets iOS 18, iPadOS 18, or any version of tvOS, your game’s app bundle can be up
to 4 GB in size, as outlined in the table below. You need to deliver any additional content through
on-demand resources, the Background Assets framework, or your own in-game solution.
Minimum deployment target
Maximum bundle size
iOS 17, iPadOS 17, or earlier
2 GB
iOS 18 or iPadOS 18
4 GB
tvOS (any version)
4 GB
Overview
Maximize your app bundle’s size
GameKit / Improving the player experience for games with large downloads
Article
Improving the player experience for games
with large downloads
Provide ample content in your base installation and then use on-demand resource
and the Background Assets API to handle additional content.


## Page 12

With on-demand resources, you can specify additional content to download from the App Store
while your game installs. Alternatively, you can use the Background Assets framework to write an
extension that downloads content from your own website or CDN. With either solution, the player
sees a single progress indicator while the system downloads your game’s app bundle and any
additional first-launch content. A purely in-app solution can’t include additional content in the bas
installation.
On-demand resources are assets hosted by Apple. To use them, split your game’s content into
asset packs, apply one or more tags to each pack, and submit your asset packs to the App Store
along with your game. For more information on applying tags to your assets, see Creating and
Assigning Tags.
After you assign tags to your asset packs, use the Prefetch view to identify which tags you should
include in your game’s base installation. Asset packs matching these tags are included in the base
installation progress and are available when your game first launches. You can also specify an
additional set of tags to automatically download after the base installation completes. This
prefetched content might not finish downloading before the user launches your game. For more
information, see Prefetching Tags.
Your game can programmatically download asset packs using the NSBundleResourceRequest
API. This allows you to save disk space by only downloading content after the player unlocks it
through progression or In-App Purchases. Because asset packs can have multiple tags, splitting
your content into smaller asset packs can further reduce your game’s disk space usage. Use the
NSBundleResourceRequest API to request tags, which prompt the system to download any
matching asset packs as necessary.
For content unlocked by progress, requesting tags before they’re needed can make the content
available to the player without waiting. In case the download doesn’t complete before the player
needs the content, use the progress property to keep the user informed.
When the player completes part of your game’s content, use the setPreservation
Priority(_:forTags:) method of the Bundle class to inform the system that the asset pack
containing that content are no longer necessary.
Include additional content in your game’s base installation
Apply tags to use on-demand resources
Identify which tags apply to essential and early-game
content
Use the on-demand resources API for later-game and
optional content


## Page 13

If your game targets iOS 18, iPadOS 18, or tvOS 18, it can have up to 70 GB of assets in up to 1,00
asset packs, an unlimited subset of which you can include in your initial install tags or prefetch
tags. The table below shows the resource limits:
Item
Size prior to iOS 17,
iPadOS 17, and tvOS
17
Size when targeting
iOS 17, iPadOS 17, or
tvOS 17
Size when targeting
iOS 18, iPadOS 18, or
tvOS 18
Tag
512 MB
512 MB
8 GB
Asset packs
1,000
1,000
1,000
Initial install tags
2 GB
2 GB
No limit
Initial install and
prefetch tags
4 GB
4 GB
No limit
In-use on-
demand
resources
2 GB
2 GB
No limit
Hosted on-
demand
resources
20 GB
40 GB
70 GB
Use the Background Assets framework if you want to host your game’s additional content outside
the App Store. To use Background Assets, write a Background Assets extension that tells the
system how to download assets from your website or CDN. Your extension can also react to
authentication challenges and changes in download status. Your game uses the BADownload
Manager API to stay informed of completed downloads and schedule new downloads.
Related sessions from WWDC22 and WWDC23
Session 110403: Meet Background Assets
Session 10108: What’s New in Background Assets
Stay within the on-demand resources limits
Use Background Assets for content outside the App Store
Add information about your essential content


## Page 14

The BAEssentialDownloadAllowance key tells the App Store how much additional content
your Background Assets Extension downloads during installation. Your App Store listing includes
this information in the displayed download size. The BAEssentialMaxInstallSize key tells t
system how much space those assets require when uncompressed.
The system places downloaded files in a purgeable location. When the system finishes
downloading your essential content, it informs your game if the user launched it immediately or it
informs your extension. The process that receives the notification must extract the assets to a
stable location where your game can find them. Choose a location within your game’s Caches
directory. Don’t extract your assets to the Documents directory because this causes them to get
included in device backups. To find the appropriate Caches directory, use the FileManager AP
Extract your assets to the correct location


## Page 15

If an essential download fails, the system skips it, and installation of your app proceeds. Therefore
reschedule the asset as nonessential so that it begins downloading. The system delivers the failur
notification to your game if it’s running or else to your extension.
Redownload essential assets on failure


## Page 16

Initializing and configuring Game Center
Enable Game Center, configure features, and test them locally in your Xcode project.
Authenticating a player
Confirm player credentials and device capabilities and check for account restrictions.
Game Center Entitlement
A Boolean value that indicates whether users of the app may see and compare achievement
on a leaderboard, invite friends, and start multiplayer games.
See Also
Essentials


## Page 17

Key
com.apple.developer.game-center
Type
Boolean
To add this entitlement to your app, enable the Game Center capability in Xcode.
Initializing and configuring Game Center
Enable Game Center, configure features, and test them locally in your Xcode project.
Details
Discussion
See Also
Related Documentation
Bundle Resources / Entitlements / Game Center Entitlement
Property List Key
Game Center Entitlement
A Boolean value that indicates whether users of the app may see and compare
achievements on a leaderboard, invite friends, and start multiplayer games.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 13.0+
macOS 10.8+
visionOS 1.0+


