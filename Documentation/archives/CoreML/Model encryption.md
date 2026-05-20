# Model encryption.pdf

## Page 1

Use a model’s encryption key to encrypt a model archive for deployment or to encrypt a model
compiled and bundled into your app.
Important
You must have signed in with your Apple ID in the Apple ID pane in System Preferences to
generate a model encryption key in Xcode.
Open a model in Xcode, click the Utilities tab, and click Create Encryption Key.
Overview
Create the model encryption key
Core ML / Generating a Model Encryption Key
Article
Generating a Model Encryption Key
Create a model encryption key to encrypt a compiled model or model archive.


## Page 2

Select the development team that your app’s target uses from the menu, and click Continue.


## Page 3

Xcode’s confirmation dialog provides an arrow button that takes you to the encryption key in
Finder.


## Page 4

Use the first button in the confirmation dialog to show the model encryption key in Finder, or
navigate to the model’s enclosing folder.
Xcode saves the model encryption key file in the same folder as the original model file, and uses i
base name with the .mlmodelkey extension. For example, the encryption key for a model named
Locate the model encryption key


## Page 5

Classifier.mlmodel has the name Classifier.mlmodelkey in the same directory.
Use this model encryption file to:
Encrypt a model archive as you generate it using Xcode (see Generating a Model
Archive).
Encrypt a model that Xcode includes in your app’s bundle as it compiles the model (see
Encrypting a Model in Your App).
Encrypting a Model in Your App
Encrypt your app’s built-in model at compile time by adding a compiler flag.
See Also
Model encryption


## Page 6

Tell Xcode to encrypt your model as it compiles your app by adding a compiler flag to your build
target.
In Xcode, navigate to your project’s target and open its Build Phases tab. Expand the Compile
Sources section and select the model you want Xcode to encrypt at compile time. Open the
model’s compiler flags editor by double-clicking the model’s entry.
In the editor, add:
1. The encryption flag “--encrypt”
2. A space character
3. The absolute path to the model’s encryption key file you created (see Generating a Model
Encryption Key), between quotation marks
Press the Return key or click outside the editor to close it.
Overview
Add a compiler flag
Core ML / Encrypting a Model in Your App
Article
Encrypting a Model in Your App
Encrypt your app’s built-in model at compile time by adding a compiler flag.


## Page 7

At runtime, you load the encrypted model the same way you load any other built-in model by usin
its load(completionHandler:completionHandler:) type method. This method behaves
similarly to the MLModel type method loadContentsOfURL:configuration:completion
Handler: and creates an instance of the model using the convenience class that Xcode
generates.
Generating a Model Encryption Key
Create a model encryption key to encrypt a compiled model or model archive.
Load the model
See Also
Model encryption


