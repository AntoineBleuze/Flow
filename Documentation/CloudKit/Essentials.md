# Essentials.pdf

## Page 1

Use iCloud to store your app’s data and make that data available on the web and on each device a
person owns. iCloud provides a number of options for storing app data, where each option provid
a different set of features and a varying amount of control over that data. Some options are easier
to implement than others, so it’s important that you carefully consider each one and its suitability
for your app before choosing CloudKit.
If your app creates files such as documents and images, and you want those files to sync across a
person’s devices, use iCloud Documents. You decide which files to sync by storing them in your
app’s ubiquity container, and iCloud manages the persistence and synchronization of those files f
you. For more information, see url(forUbiquityContainerIdentifier:) and Configuring
iCloud services.
In addition, the device’s owner can use iCloud Backup to store a snapshot of their device, includin
files that your app creates. That person can then restore an existing or new device from that
snapshot. Even though your app isn’t explicitly participating in the system backup process, any
files your app creates contribute to the backup’s overall size, and large backups may lead to longe
restore times. If your app has files that the system doesn’t need to back up, such as temporary or
cached files, use the available APIs to indicate to the system that it can ignore them. For more
information, see Optimizing Your App’s Data for iCloud Backup.
Overview
Store documents, images, and other file types in iCloud
Sync preferences and other key-value pairs using iCloud
CloudKit / Deciding whether CloudKit is right for your app
Article
Deciding whether CloudKit is right for your
app
Explore the various options you have for using iCloud to store and sync your app’s
data.


## Page 2

If your app maintains a set of feature flags or other lightweight configuration, or enables someone
to customize the app’s look and feel, you may want to synchronize that state across a person’s
devices to create a rich and consistent experience. Using iCloud key-value storage, your app can
store a maximum of 1,024 string keys, with associated data, and iCloud automatically keeps those
key-value pairs in sync. Key-value storage supports only numeric types, as well as Bool, String
Date, Data, Array, and Dictionary. For more information, see NSUbiquitousKeyValue
Store.
If your app manages a complex graph of model objects, which may include relationships between
those objects, use one of the options in the following table:
NSPersistent
CloudKit
Container
If you don’t require granular control over how and when your data
syncs, or your app already uses NSPersistentContainer to persis
data to disk, prefer this approach. NSPersistentCloudKit
Container provides a fully managed schema, maintains a local repli‐
ca of your data, and supports the public, private, and shared databas
es. For more information, see Setting Up Core Data with CloudKit.
CKSyncEngine
With a sync engine, you retain control of your data but the engine
automatically schedules sync operations to fetch and send changes to
that data. Your app participates in those operations by handling sync
events and providing changed records when the engine requests them.
Use CKSyncEngine with private and shared databases.
CKDatabase,
CKOperation, and
related types
CloudKit’s base types provide full control over the data you store, and
the design and management of your container’s schema. This approach
however, is the most intricate and requires you to manually fetch and
send records, resolve any conflicts, schedule operations, handle iCloud
account changes, process change notifications, persist server change
tokens, and so on. For more information, see Enabling CloudKit in Your
App.
Enabling CloudKit in Your App
Store model objects in CloudKit
See Also
Essentials


## Page 3

Configure your app to store data in iCloud using CloudKit.


## Page 4

Once you’ve determined that CloudKit is right for your app, you’re ready to set up your Xcode
project to enable CloudKit development.
Adding the iCloud capability to your project sets up the initial project entitlements. Before you
proceed, verify that your Apple Developer Program membership is active and has admin
permissions.
To add the iCloud capability:
1. In the Xcode Project navigator, select your project and your project target.
2. Click the “Signing and Capabilities” tab and select “Automatically manage signing.”
3. Specify your development team.
4. Make sure that your bundle identifier is one you want to use for your app. (This identifier
determines the name of the iCloud container created in a later step.)
5. Click the + Capability button, then search for iCloud in the Add Capability editor and select that
capability. An iCloud section appears on your app’s Signing and Capabilities page.
Overview
Add the iCloud capability to your Xcode project
CloudKit / Enabling CloudKit in Your App
Article
Enabling CloudKit in Your App
Configure your app to store data in iCloud using CloudKit.


## Page 5

Next, add the CloudKit service to add the appropriate entitlements to your project and tell iCloud 
create a container for your app data:
1. Select the CloudKit checkbox. In addition to adding the CloudKit capability to your app, this
selection also creates an iCloud container and adds the Push Notifications capability. The name
of the container is your app’s bundle identifier prefixed with “iCloud.”
2. Check the box next to the container name.
Create your container


## Page 6

Multiple apps and users have access to iCloud, but each app’s data and schema, together, are
typically in separate containers. Although an app can have multiple containers or share a containe
each app has one default container. Once you’ve created a container, you can’t delete or rename 
You need an iCloud account to save records to a container. In your app or the simulator on which
you test your app during development, enter the credentials for this iCloud account. If you don’t
have an iCloud account, create one for use during development. In macOS, launch System
Preferences and click Sign In. Click Create Apple ID under the Apple ID text field and follow the
instructions.
Note that your iCloud account is distinct from your Apple Developer account; however, you can us
the same email address for both. Doing so gives you access to your iCloud account’s private user
data in CloudKit Dashboard, which can be helpful for debugging.
Enter your iCloud account credentials on a simulator or app-testing device. Entering the iCloud
credentials enables reading from—and writing to—users’ own private and shared databases and,
potentially, writing to the container’s public database.
To enter your credentials on an iOS or iPadOS device:
1. Launch the Settings app and click “Sign in to your iPhone/iPad.”
2. Enter your Apple ID and password.
Select or create an iCloud account for development
Enter iCloud credentials before running your app


## Page 7

3. Click Next. Wait until the system verifies your iCloud account.
4. To enable iCloud Drive, choose iCloud and then click the iCloud Drive switch. If the switch
doesn’t appear, iCloud Drive is already enabled.
Perform the same sign-in process for each iOS or iPadOS simulator you test your app on. You can
access the simulators from Xcode by choosing Xcode > Open Developer Tool > Simulator.
To enter your credentials for macOS, go to System Preferences.
CloudKit Console is a web-based tool that lets you manage your app’s iCloud containers. It appea
within the Apple Developer web portal, and you can use it to ensure that your container exists.
1. Using a web browser, such as Safari, navigate to the CloudKit Console webpage at
https://icloud.developer.apple.com/.
2. If you’re asked to sign in, enter your credentials and click Sign In.
3. On the subsequent page, verify that your container appears in the container list.
View your container in CloudKit Console


## Page 8

For more information on CloudKit Console, see Managing iCloud Containers with CloudKit
Database App.
Deciding whether CloudKit is right for your app
Explore the various options you have for using iCloud to store and sync your app’s data.
See Also
Essentials


