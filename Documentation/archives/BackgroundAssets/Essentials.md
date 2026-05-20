# Essentials.pdf

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


## Page 5

Let Apple host your app’s assets for you with your Apple Developer Program membership. Apple-
Hosted Background Assets hosts up to 200GB of compressed assets and is available for apps on
TestFlight or the App Store that use the Managed Background Assets features on all platforms
except watchOS. You can use the service to host many different types of assets — such as textur
files, machine learning models, Metal shader libraries, and videos — and update them independen
of your app build. Background Assets provides a default implementation of a downloader extensio
that manages asset pack downloads, background updates, compression, and more on people’s
systems that you can customize in your downloader extension code.
To create asset packs with a manifest file that the system manages, see Creating managed asset
packs. To test your asset packs before uploading them to App Store Connect, see Testing asset
packs locally.
To use Apple-Hosted Background Assets, add a downloader extension target to your project,
configure the App Groups capability for both the app and the extension targets, and add some
Background Assets information property list keys.
Background Assets uses your app’s downloader extension to schedule downloads when your app
isn’t running. Add a downloader extension that is preconfigured for Managed Background Assets 
your Xcode project from a template. Choose New > Target and, in the sheet that appears, choose
the Background Download template under Application Extension, and click Next. In the dialog,
enter a target name, choose Apple-Hosted, Managed as the extension type, and click Finish. In th
next dialog, click Activate to use the extension scheme Xcode creates.
Overview
Configure your project for Apple-Hosted Background
Assets
Background Assets / Downloading Apple-hosted asset packs
Article
Downloading Apple-hosted asset packs
Configure your project and write the code to download asset packs hosted by
Apple.


## Page 6

Your app and your downloader extension target need to share an app group, which Background
Assets uses to facilitate coordination between the two. Add each of the two targets to a shared ap
group in the Signing & Capabilities tab of the target editor in Xcode.
In the project editor, select the app target and click the Info tab. Then, add the following keys to th
information property list file:
BAAppGroupID
The string ID of the app group that your app and downloader extension targets share.
BAHasManagedAssetPacks
For apps that use Managed Background Assets (including Apple-Hosted Background Assets
you must set this key to YES.
BAUsesAppleHosting
For apps that use Apple-Hosted Background Assets, you must set this key to YES.
For apps that use Apple-Hosted Background Assets, omit all other Background Assets informatio
property list keys from your project.
The default system implementation supports automatic downloads, background updates,
compression, and more that you can customize. The system calls the shouldDownload(_:)
method each time it downloads a new asset pack based on its download policy. Optionally, use th
method to filter downloads at runtime.
Customize downloads


## Page 7

If you don’t need to customize the download behavior for your asset packs beyond the download
policies that you configure in the manifest files, remove the shouldDownload(_:) method
implementation from your downloader-extension structure. Otherwise, if your asset packs have
specific compatibility requirements, provide a custom implementation for the should
Download(_:) method.
An instance of the AssetPack structure represents an individual asset pack that’s available for
download from the server, including metadata, such as its identifier that you set in the manifest fil
To obtain an AssetPack instance, call the assetPack(withID:) method on the shared asset-
pack manager:
To ensure that the system downloads an asset pack, pass it to the ensureLocal
Availability(of:) method:
If the system previously downloaded the asset pack, the ensureLocalAvailability(of:)
method returns quickly without downloading it again. For an asset pack with an essential or a
prefetch download policy, the system may finish downloading the asset pack before you call this
method. To download an asset pack with an on-demand download policy, this method initiates th
download and waits for it to finish before returning. If this method returns without throwing an err
the asset pack is available to access locally.
Note
Even for an asset pack with an essential download policy, network dropouts or other
uncommon issues can prevent the system from downloading it until you call the ensure
LocalAvailability(of:) method.
When downloading asset packs in the foreground, display a progress indicator.
In Swift, you can await status updates on the asynchronous sequence that the status
Updates(forAssetPackWithID:) method returns:
Download asset packs from your app
Show download progress


## Page 8

In Objective-C, you can create a class that conforms to the BAManagedAssetPackDownload
Delegate protocol:
Then, set the shared asset-pack manager’s delegate property to an instance of that class.
To cancel a download, call the cancel() method on any of the Progress objects that you
receive in the download status updates:


## Page 9

To read the contents of an asset pack, call the contents(at:searchingInAssetPackWith
ID:options:) method on the shared asset-pack manager, passing a relative path from the root
of the source repository — the folder where you ran the packaging tool command — to the file tha
you want to read:
The system automatically merges all of your asset packs into a shared namespace, effectively
reconstructing your asset root folder as if it were pasted on a person’s device. This way, you can
access individual files without needing to know which asset pack they reside in.
By default, the contents(at:searchingInAssetPackWithID:options:) method returns
memory-mapped Data instance, which is suitable even for large asset files that take up a lot of
space in memory. If you need low-level access to the file descriptor — for example, to read a file
into memory procedurally — then you can use the descriptor(for:searchingInAssetPac
WithID:) method instead:
Important
It’s your responsibility to close the file descriptor when you’re done using it.
The system tracks which asset packs you download and automatically keeps them up to date in t
background. However, the system won’t automatically remove your asset packs while your app is
installed. Therefore, when you are done with an asset pack, call the remove(assetPackWith
Load files in a downloaded asset pack


## Page 10

ID:) method on the shared asset-pack manager to free up storage space on the device. For
example, remove the tutorial asset pack when a person finishes playing the tutorial:
To redownload an asset pack, call the ensureLocalAvailability(of:) method again.
Creating managed asset packs
Create managed asset packs, choose download options, and upload Apple-hosted asset
packs to App Store Connect.
Testing asset packs locally
Test your system-managed asset packs using a mock server on your Mac.
See Also
Essentials


## Page 11

Before you submit your asset packs to TestFlight or the App Store, you can use a mock server to
test downloading asset packs and accessing files locally.
Background Assets uses HTTPS for all downloads, so you need an SSL certificate for the mock
server to use. If you don’t have access to a publicly trusted certificate authority (CA), then you ca
create your own root CA, manually trust it on your test devices, and use it to issue an SSL
certificate.
To create Apple-hosted asset packs that specify a download policy, see Creating managed asset
packs. To add an Apple-Hosted Background Assets downloader extension to your app, see
Downloading Apple-hosted asset packs.
You create a root CA on your Mac using Keychain Access. To quickly open Keychain Access, searc
for Keychain Access in Spotlight and press Return. Then follow these steps to create a self-signed
certificate:
1. In Keychain Access, choose Keychain Access > Certificate Assistant > Create a Certificate
Authority
2. In the Create Your Certificate Authority sheet, enter a name for the root CA, choose Self Signed
Root CA as the identity type, and select SSL Server for user certificate. Enable “Let me override
defaults”, enter an email address, and click Continue.
3. In the Certificate Information sheet, deselect “Sign your invitation” and click Continue.
4. In the next Certificate Information sheet, optionally provide information about your organization
and then click Continue.
Overview
Create a root CA
Background Assets / Testing asset packs locally
Article
Testing asset packs locally
Test your system-managed asset packs using a mock server on your Mac.


## Page 12

5. In these following sheets, leave the default options with all the text fields blank and click
Continue:
Key Pair Information For This CA
Specify Key Pair Information For Users of This CA
Key Usage Extension For This CA
Key Usage Extension For Users of This CA
Extended Key Usage Extension For This CA
Extended Key Usage Extension For Users Of This CA
Basic Constraints Extension For This CA
Basic Constraints Extension For Users Of This CA
Subject Alternate Name Extension For This CA
Subject Alternate Name Extension For Users Of This CA
6. In the Specify a Location For The Certificate sheet, select “login” as the keychain, enable “On
this machine, trust certificates signed by this CA,” and click Create.
7. If necessary, authenticate with Touch ID, your Apple Watch, or your password.
8. Review the information in the Conclusion sheet, and then close the Certificate Assistant window


## Page 13

In Keychain Access, select the “login” keychain in the sidebar and click the Certificates tab (not th
My Certificates tab). Control-click on your new CA and select Export Certificate Name. In the dial
that appears, choose Certificate (.cer) as the file format, select a location to save the exported
certificate, and click Save.
For more information on creating certificate authorities, see Keychain Access User Guide.
First you create a profile containing the CA, and then you install and trust the profile on test
devices.
To create the profile, download Apple Configurator from the App Store. Then, open Apple
Configurator and choose File > New Profile in the menu bar or press Command-N. In the window
that appears, follow these steps:
1. In the General tab, enter a name and an ID for the profile.
2. In the Certificates tab, click Configure.
3. In the sheet that appears, select your exported CA and click Open.
Install the CA on test devices using a profile


## Page 14

4. In Apple Configurator, choose File > Save.
To install the profile on test devices, see Install a configuration profile on your iPhone, iPad, or
Apple Vision Pro. To install the profile on macOS devices, see Use configuration profiles to
standardize settings on Mac computers.
To trust the CA on test devices, see Trust manually installed certificate profiles in iOS, iPadOS, an
visionOS.
To trust the CA on macOS, open Keychain Access, select the “login” keychain in the sidebar, click
the Certificates tab, Control-click your root CA, and choose Get Info. In the window that appears,
expand the Trust section and select Always Trust. If necessary, authenticate yourself.
In Keychain Access on your Mac, choose Keychain Access > Certificate Assistant > Create a
Certificate. In the Certificate Assistant window that appears, follow these steps:
1. In the first sheet, enter this information and click Continue:
Set the name to the IP address, hostname, or domain name where you’re hosting the mock
server.
Set the identity type to Leaf.
Set the certificate type to SSL Server.
Enable “Let me override defaults.”
Issue an SSL certificate


## Page 15

Important
Unlike with a root CA, your SSL certificate’s name must be a valid IP address, hostname, or
domain name.
2. In the Certificate Information sheet, leave the default options and click Continue.
3. In the next Certificate Information sheet, set the name (common name) to the same IP address
hostname, or domain name that you provided earlier. Optionally, provide information about you
organization, and then click Continue.


## Page 16

4. In the Choose An Issuer sheet, select your root CA as the issuer and click Continue.
5. In these next sheets, just click Continue:
Key Pair Information
Key Usage Extension
Extended Key Usage Extension
Basic Constraints Extension
6. In the Subject Alternate Name Extension sheet, either set dNSName to the hostname or domai
name that you provided earlier or set iPAddress to the IP address that you provided earlier. Lea
all other text fields blank and click Continue.


## Page 17

Important
Provide exactly one IP address, hostname, or domain name in the appropriate text field and
leave the other three text fields blank.
7. In the Specify a Location For The Certificate sheet, select the “login” keychain and click Create
8. In the Conclusion sheet, click Done.
In Terminal, start the mock server with the --host flag set to the same IP address, hostname, or
domain name that you used when issuing your SSL certificate, and pass the paths to the asset
packs (files with a .aar filename extension) that you want to host:
Start the mock server with the SSL certificate


## Page 18

In the Choose An Identity window that appears, select your SSL certificate (not your root CA) and
click Choose. If necessary, authenticate with your password.
To create asset pack archives, see Creating managed asset packs.
Enable Developer Mode on all of your test devices (see Enabling Developer Mode on a device).
In iOS, iPadOS, tvOS, and visionOS, go to Settings > Developer and click Development Overrides
under Background Assets Testing. Under URL Override, enter your server’s base URL.
In macOS, install Xcode, and in Terminal, run the following command:
Include the HTTPS scheme in the base URL and omit the path. Now, when you build and run your
app through Xcode, your app downloads its asset packs from the mock server.
Creating managed asset packs
Create managed asset packs, choose download options, and upload Apple-hosted asset
packs to App Store Connect.
Downloading Apple-hosted asset packs
Configure your project and write the code to download asset packs hosted by Apple.
Configure a URL override in Developer settings
See Also
Essentials


