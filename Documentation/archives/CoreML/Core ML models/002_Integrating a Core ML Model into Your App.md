# 002_Integrating a Core ML Model into Your App.pdf

## Page 1

This sample app uses a trained model, MarsHabitatPricer.mlmodel, to predict habitat price
on Mars.
Add the model to your Xcode project by dragging the model into the project navigator.
You can see information about the model—including the model type and its expected inputs and
outputs—by opening the model in Xcode. In this sample, the inputs are the number of solar panels
and greenhouses, as well as the lot size of the habitat (in acres). The output is the predicted price
of the habitat.
Xcode also uses information about the model’s inputs and outputs to automatically generate a
custom programmatic interface to the model, which you use to interact with the model in your
code. For MarsHabitatPricer.mlmodel, Xcode generates interfaces to represent the model
(MarsHabitatPricer), the model’s inputs (MarsHabitatPricerInput), and the model’s
output (MarsHabitatPricerOutput).
Use the generated MarsHabitatPricer class’s initializer to create the model:
Overview
Add a model to your Xcode project
Create the model in code
Core ML / Integrating a Core ML Model into Your App
Sample Code
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the
model’s predictions.
Download
iOS 12.0+
iPadOS 12.0+
Xcode 15.2+


## Page 2

This sample app uses a UIPickerView to get the model’s input values from the user:
The MarsHabitatPricer class has a generated prediction(solarPanels:greenhouses
size:) method that’s used to predict a price from the model’s input values—in this case, the
number of solar panels, the number of greenhouses, and the size of the habitat (in acres). The
result of this method is a MarsHabitatPricerOutput instance.
Access the price property of marsHabitatPricerOutput to get a predicted price and displa
the result in the app’s UI.
Note
The generated prediction(solarPanels:greenhouses:size:) method can throw an
error. The most common type of error you’ll encounter when working with Core ML occurs
when the details of the input data don’t match the details the model is expecting—for example,
an image in the wrong format.
Get input values to pass to the model
Use the model to make predictions


## Page 3

Xcode compiles the Core ML model into a resource that’s been optimized to run on a device. This
optimized representation of the model is included in your app bundle and is what’s used to make
predictions while the app is running on a device.
Getting a Core ML Model
Obtain a Core ML model to use in your app.
Updating a Model File to a Model Package
Convert a Core ML model file into a model package in Xcode.
class MLModel
An encapsulation of all the details of your machine learning model.
Model Customization
Expand and modify your model with new layers.
Model Personalization
Update your model to adapt to new data.
Build and run a Core ML app
See Also
Core ML models


