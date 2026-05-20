# 004_Model Customization.pdf

## Page 1

Customize your Core ML model to make it work better for your specific app. For instance, create
one or more custom layers to improve accuracy by increasing the model’s capacity to capture
information. You can also reduce the model’s size to optimize the contents of your app bundle.
Reducing the Size of Your Core ML App
Reduce the storage used by the Core ML model inside your app bundle.
Creating and Integrating a Model with Custom Layers
Add models with custom neural-network layers to your app.
protocol MLCustomLayer
An interface that defines the behavior of a custom layer in your neural network model.
protocol MLCustomModel
Overview
Topics
Model file size
Custom model layers
Custom models
Core ML / Model Customization
API Collection
Model Customization
Expand and modify your model with new layers.


## Page 2

An interface that defines the behavior of a custom model.
Getting a Core ML Model
Obtain a Core ML model to use in your app.
Updating a Model File to a Model Package
Convert a Core ML model file into a model package in Xcode.
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s
predictions.
class MLModel
An encapsulation of all the details of your machine learning model.
Model Personalization
Update your model to adapt to new data.
See Also
Core ML models


