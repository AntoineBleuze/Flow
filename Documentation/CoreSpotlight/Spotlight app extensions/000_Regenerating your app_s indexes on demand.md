# 000_Regenerating your app_s indexes on demand.pdf

## Page 1

Keeping your app’s indexes up to date requires periodic maintenance. An app that crashes while
updating its index might leave that index in an incorrect state. The system can also ask your app t
regenerate the index if it’s missing or needs updated data. If your app isn’t running when the
system needs these updates, it uses your reindexing app extension to generate them instead.
A reindexing app extension is an important tool for keeping your indexes up to date at all times.
Include this app extension in your app bundle, and make sure it has access to all of your app’s
indexable data.
Xcode provides a template to make it easy to add a reindexing app extension to your app. Add thi
template to your project using the following steps:
1. Open the Xcode project with your app.
2. Select File > New > Target.
3. Select the platform for your app.
4. In the Application Extension section, select the CoreSpotlight Delegate template.
5. Click Next.
6. Give your app extension a name and configure the other options.
7. Click Finish.
Overview
Add a reindexing app extension to your app
Core Spotlight / Regenerating your app’s indexes on demand
Article
Regenerating your app’s indexes on
demand
Create an app extension to maintain your app’s indexes and regenerate them as
needed.


## Page 2

The CoreSpotlight Delegate template contains empty implementations for the key functions of th
CSSearchableIndexDelegate protocol, including the methods you use to update the index.
Add your custom code to these methods, and make sure to call the acknowledgement handlers fo
your main indexing functions, as shown:
For information about how to add content to your app’s indexes, see Adding your app’s content to
Spotlight indexes.
Verify your app extension behaves as expected using the Xcode debugger. Start by building your
app extension and attaching the debugger to it.
1. Select your app target
2. Build and run your app.
3. Back in Xcode, select your app extension target.
4. Select Debug > Attach to Process by PID or Name.
5. Set the name of the process to the bundle ID of your app extension.
6. Click the Attach button.
Debug your app extension code


## Page 3

Because you can’t predict when the system will run your app extension, you need to force the
system to run it immediately using the mdutil command-line tool. Open Terminal and run that
command with the -cr option, followed by the bundle identifier of your app extension. Here’s an
example of this command:
The mdutil tool starts the reindexing process for the app extension you specify. If you set any
breakpoints in your app extension’s code, the attached debugger stops at them and gives you a
chance to examine the state of your extension.
class CSIndexExtensionRequestHandler
An interface that implements an index-maintenance app extension.
class CSImportExtension
An object that provides searchable attributes for file types that the app supports.
See Also
Spotlight app extensions


