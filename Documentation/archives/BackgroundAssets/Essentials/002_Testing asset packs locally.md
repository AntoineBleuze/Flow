# 002_Testing asset packs locally.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

Important
Unlike with a root CA, your SSL certificate’s name must be a valid IP address, hostname, or
domain name.
2. In the Certificate Information sheet, leave the default options and click Continue.
3. In the next Certificate Information sheet, set the name (common name) to the same IP address
hostname, or domain name that you provided earlier. Optionally, provide information about you
organization, and then click Continue.


## Page 6

4. In the Choose An Issuer sheet, select your root CA as the issuer and click Continue.
5. In these next sheets, just click Continue:
Key Pair Information
Key Usage Extension
Extended Key Usage Extension
Basic Constraints Extension
6. In the Subject Alternate Name Extension sheet, either set dNSName to the hostname or domai
name that you provided earlier or set iPAddress to the IP address that you provided earlier. Lea
all other text fields blank and click Continue.


## Page 7

Important
Provide exactly one IP address, hostname, or domain name in the appropriate text field and
leave the other three text fields blank.
7. In the Specify a Location For The Certificate sheet, select the “login” keychain and click Create
8. In the Conclusion sheet, click Done.
In Terminal, start the mock server with the --host flag set to the same IP address, hostname, or
domain name that you used when issuing your SSL certificate, and pass the paths to the asset
packs (files with a .aar filename extension) that you want to host:
Start the mock server with the SSL certificate


## Page 8

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


