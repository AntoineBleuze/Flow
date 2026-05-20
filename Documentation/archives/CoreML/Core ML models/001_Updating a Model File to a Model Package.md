# 001_Updating a Model File to a Model Package.pdf

## Page 1

A Core ML model package is a file-system structure that can store a model in separate files, simil
to an app bundle. Model packages offer more flexibility and extensibility than Core ML model files
including editable metadata and separation of a model’s architecture from its weights and biases.
Update your model file to a model package by converting the model in Xcode.
Open or select a Core ML model in Xcode and update it to an ML package by either clicking the
Edit button or the Update to Model Package button in the Utilities tab.
Overview
Core ML / Updating a Model File to a Model Package
Article
Updating a Model File to a Model Package
Convert a Core ML model file into a model package in Xcode.


## Page 2

Xcode presents a confirmation dialog before it converts the model to the ML package format. By
default, Xcode moves the original model file to the Trash. You can keep your original model file by
deselecting the checkbox in the Xcode dialog. Click Update and Edit when you’re ready to conver
the model to a package.
Once Xcode finishes converting the model, it opens the model’s General tab, where you can edit
any of the metadata text fields, including Description, Author, and License.


## Page 3

You can also add a new metadata field in an ML package by entering a new property name and
value in the Additional Metadata section.
Getting a Core ML Model
Obtain a Core ML model to use in your app.
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s
predictions.
class MLModel
An encapsulation of all the details of your machine learning model.
Model Customization
Expand and modify your model with new layers.
See Also
Core ML models


## Page 4

Model Personalization
Update your model to adapt to new data.


