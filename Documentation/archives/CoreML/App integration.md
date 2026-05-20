# App integration.pdf

## Page 1

Download and compile models within your app as an alternative to bundling with the app. Scenari
where this is a practical approach include:
Reducing the app’s download size of your app on the App Store
Determining the right models for the user after installation based on their location, specific
interests, and A/B testing
Providing model updates over the network
Download the model definition file (ending in .mlmodel) onto the user’s device by using
URLSession, CloudKit, or another networking toolkit. Then compile the model definition by callin
compileModel(at:).
This creates a new, compiled model file with the same name as the model description but ending 
.mlmodelc. Create a new MLModel instance by passing the compiled model URL to its initializer
Model instances you create from model files you’ve downloaded have the same capabilities as
those you create from model files that you bundle with your app.
Overview
Download and compile the model in the background
Core ML / Downloading and Compiling a Model on the User’s Device
Article
Downloading and Compiling a Model on
the User’s Device
Install Core ML models on the user’s device dynamically at runtime.


## Page 2

MLModel saves models it compiles to a temporary location. If your app can reuse the model later
reduce your resource consumption by saving the compiled model to a permanent location.
Build the URL to a permanent location that your app can access in the future, such as Application
Support.
Create the URL for the permanent compiled model file.
Move or copy the file to its permanent location.
Important
You should consider the user’s iCloud Backup size when saving large, compiled Core ML
models. You can store models in the app’s container using /tmp and /Library/Caches
directories, which contain purgeable data that isn’t backed up. When the models aren’t
purgeable, you can exclude them from backup by setting the isExcludedFromBackup
resource value to true. To learn more about excluding files from iCloud Backup, see
Optimizing Your App’s Data for iCloud Backup.
Model Integration Samples
Save Reusable Models to a Permanent Location
See Also
App integration


## Page 3

Integrate tabular, image, and text classifcation models into your app.


## Page 4

Use the provided Core ML sample code projects to learn how to classify numeric values, images,
and text within applications. For example, you can detect poses of the human body, classify a
group of images, and locate answers to questions in a text document.
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s
predictions.
Using Core ML for semantic image segmentation
Identify multiple objects in an image by using the DEtection TRansformer image-segmentati
model.
Classifying Images with Vision and Core ML
Crop and scale photos using the Vision framework and classify them with a Core ML model.
Detecting human body poses in an image
Locate people and the stance of their bodies by analyzing an image with a PoseNet model.
Understanding a Dice Roll with Vision and Object Detection
Overview
Topics
Tabular data models
Image classification models
Core ML / Model Integration Samples
Model Integration Samples
Integrate tabular, image, and text classifcation models into your app.


## Page 5

Detect dice position and values shown in a camera frame, and determine the end of a roll by
leveraging a dice detection model.
Finding answers to questions in a text document
Locate relevant passages in a document by asking the Bidirectional Encoder Representation
from Transformers (BERT) model a question.
Downloading and Compiling a Model on the User’s Device
Install Core ML models on the user’s device dynamically at runtime.
Text classification models
See Also
App integration


