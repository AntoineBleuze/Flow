# 000_Creating managed asset packs.pdf

## Page 1

Before you can use Managed Background Assets, you need to create asset packs with a manifest
file that specifies a download policy and provides other details. Then Managed Background Asset
can automatically manage downloads, updates, compression, and more for your assets.
If you use Apple-Hosted Background Assets, you upload the asset packs to App Store Connect a
update them there along with your app builds. Apple-Hosted Background Assets can host up to
200GB of compressed assets and is available for apps distributed through the App Store on all
platforms except watchOS.
To add an Apple-Hosted Background Assets downloader extension to your app, see Downloading
Apple-hosted asset packs. To test your asset packs before uploading them to App Store Connect
see Testing asset packs locally.
Group assets that you want to download together into asset packs. For example, create an asset
pack that contains the textures, sound effects, and GPU shaders for a tutorial in your game. You
can also include CPU and GPU executables in an asset pack, but not macOS executables.
Decide on a download policy for each asset pack, which the system uses to manage the assets on
a device:
essential
Downloads the asset pack as part of the app’s installation process. The asset-pack download
contributes to the overall download progress that people see in the App Store, in TestFlight,
and on the Home Screen (in iOS, iPadOS, and tvOS) or in the Home View (in visionOS).
prefetch
Overview
Identify asset packs and choose download policies
Background Assets / Creating managed asset packs
Article
Creating managed asset packs
Create managed asset packs, choose download options, and upload Apple-hoste
asset packs to App Store Connect.


## Page 2

Downloads the asset pack during the app’s installation process, but lets it continue in the
background after installation finishes.
`onDemand’
Downloads the asset pack only when you explicitly use an API to request the asset pack.
For example, choose essential for the tutorial asset pack so that people can run the tutorial
immediately after installing your game without delay.
For limits on asset packs hosted by Apple, see Apple-hosted asset pack size limits in App Store
Connect Help.
Add a manifest file to your asset pack that specifies a download policy and other details. Create a
JSON manifest file that contains information about your asset pack. After you install Xcode, run th
xcrun command in Terminal to generate a manifest template:
Then, enter the information about your asset pack in the manifest file following the instructions in
the comments:
1. Set the assetPackID key to an identifier that you use in your code to access the asset pack.
2. Set the downloadPolicy key to an object with a single key that’s either essential,
prefetch, or onDemand.
For essential and prefetch, set the nested installationEventTypes key to an arr
of firstInstallation, subsequentUpdate, or both.
For onDemand, leave the value as an empty object.
3. Add the paths to the files and folders that you want to include in the asset pack as file-selector
objects in the fileSelectors array. Use the file key for individual assets and the
directory key for folders that contain assets. All nested folders are also included.
4. Specify the platforms on which you want to make the asset pack available in the platforms
array.
Important
The paths that you include in the manifest file must be relative to the directory where you run
the packaging tool command.
Create a manifest file


## Page 3

This example shows a manifest file for downloading assets for a game’s tutorial. The first time
people install this game, the system downloads the tutorial’s assets, and later, when people updat
the game, the system doesn’t download the tutorial’s assets again.
Next, use the packaging tool command to compress the assets, along with the manifest file, into a
archive. Set the current directory in Terminal to the root of your source repository and pass the
manifest file to the packaging tool command:
For Apple-hosted asset packs, upload your asset packs — independent of your app builds — to A
Store Connect using the Transporter app, the altool command-line tool, iTMSTransporter, or th
App Store Connect API. Later, when you want to test your app using TestFlight with external teste
or to distribute it on the App Store, you can submit your asset packs for review.
For more information about managing your asset packs in App Store Connect, see Overview of
Apple-hosted asset packs in App Store Connect Help. To use web services, see Uploading and
versioning Apple hosted background assets.
Archive asset packs
Manage asset packs in App Store Connect


## Page 4

Downloading Apple-hosted asset packs
Configure your project and write the code to download asset packs hosted by Apple.
Testing asset packs locally
Test your system-managed asset packs using a mock server on your Mac.
See Also
Essentials


