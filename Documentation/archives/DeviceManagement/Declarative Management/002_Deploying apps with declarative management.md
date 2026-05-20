# 002_Deploying apps with declarative management.pdf

## Page 1

Device management services can install, manage, update, configure, and remove apps using the
AppManaged configuration. Devices can report managed app status using the StatusApp
ManagedList status item.
If a device management service already manages an app using the Install Application or
Install Enterprise Application commands, it can convert the app to declarative app
management.
In macOS, device management services can install, update, and remove packages using the
Package configuration. They can then manage apps that a package installs using an AppManage
configuration targeting the app. Devices can report package status using the StatusPackage
List status item.
Installing, managing, updating, and removing apps
Use declarative management to handle all aspects of managing apps on devices.
Displaying managed apps and packages
Use a management app to display managed apps and packages to the user.
Configuring managed apps and extensions
Provide managed apps and extensions with app configuration and secrets.
Overview
Topics
Supporting managed apps
Device Management / Deploying apps with declarative management
Deploying apps with declarative
management
Use declarative app configurations to deploy managed apps to devices.


## Page 2

Transferring management of apps to declarative management
Seamlessly transition apps to declarative management without needing to reinstall.
Processing status for managed apps
Process the status that declarative management reports for managed apps.
Installing packages
Use declarative package management to install and remove packages in macOS.
Leveraging the declarative management data model to scale devices
Use declarative management to make devices more autonomous and proactive.
Integrating Declarative Management
Use the declarative management protocol to manage MDM features such as device
enrollment and un-enrollment and device and user authentication.
Declarations
The available declarations for device management.
Status Reports
Reports from the device about its current state.
See Also
Declarative Management


