# 002_Settings.pdf

## Page 1

Settings are small pieces of data that you use to configure your app’s interface and behavior.
Instead of recompiling your code every time you want to make a change, your code uses settings
alter your app’s configuration dynamically. Typically, you use this kind of data to reflect the
personal preferences of the person using your app. For example, a drawing app might store
whether someone prefers inches or centimeters for distance measurements. However, you can al
use settings to manage internal behaviors, such as the amount of data your app logs during testin
The system stores each app’s settings persistently to disk, so that they are available between
launches. You typically store strings, numbers, and other simple data types to disk, but you can
store more complex types as needed. The UserDefaults type manages settings for your app o
the current device, and doesn’t share those settings with the person’s other devices. To share
settings with instances of your app running on all of the person’s devices, place them in iCloud
using the NSUbiquitousKeyValueStore type.
Accessing settings from your code
Retrieve or change settings and monitor external changes to those values while your app run
class UserDefaults
An interface to the user’s defaults database, which stores system-wide and app-specific
settings.
Overview
Topics
App-specific settings
Foundation / Settings
API Collection
Settings
Configure your app using data you store persistently on the local disk or in iCloud


## Page 2

Adding a settings interface to your app
Create a dedicated interface to display and modify your app’s settings.
Building a Settings bundle for your app
Integrate your app’s custom settings into the Settings app in iOS, iPadOS, tvOS, and visionO
and support a Mac Catalyst settings window.
class NSUbiquitousKeyValueStore
An iCloud-based container of key-value pairs you share among instances of your app runnin
on a person’s devices.
File System
Create, read, write, and examine files and folders in the file system.
Archives and Serialization
Convert objects and values to and from property list, JSON, and other flat binary
representations.
Spotlight
Search for files and other items on the local device, and index your app’s content for
searching.
iCloud
Manage files and key-value data that automatically synchronize among a user’s iCloud
devices.
Optimizing Your App’s Data for iCloud Backup
Settings interfaces
iCloud key and value storage
See Also
Files and Data Persistence


## Page 3

Minimize the space and time that backups take to create by excluding purgeable and
nonpurgeable data from backups.


