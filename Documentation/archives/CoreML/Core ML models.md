# Core ML models.pdf

## Page 1

Core ML supports a variety of machine learning models, including neural networks, tree ensemble
support vector machines, and generalized linear models. Core ML requires the Core ML model
format (models with a .mlmodel file extension).
Using Create ML and your own data, you can train custom models to perform tasks like recognizin
images, extracting meaning from text, or finding relationships between numerical values. Models
trained using Create ML are in the Core ML model format and are ready to use in your app.
Apple also provides several popular, open source models that are already in the Core ML model
format. You can download these models and start using them in your app.
Additionally, various research groups and universities publish their models and training data, whic
may not be in the Core ML model format. Use Core ML Tools to convert these models to use in yo
app.
Updating a Model File to a Model Package
Convert a Core ML model file into a model package in Xcode.
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s
predictions.
Overview
See Also
Core ML models
Core ML / Getting a Core ML Model
Article
Getting a Core ML Model
Obtain a Core ML model to use in your app.


## Page 2

class MLModel
An encapsulation of all the details of your machine learning model.
Model Customization
Expand and modify your model with new layers.
Model Personalization
Update your model to adapt to new data.


## Page 3

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


## Page 4

Xcode presents a confirmation dialog before it converts the model to the ML package format. By
default, Xcode moves the original model file to the Trash. You can keep your original model file by
deselecting the checkbox in the Xcode dialog. Click Update and Edit when you’re ready to conver
the model to a package.
Once Xcode finishes converting the model, it opens the model’s General tab, where you can edit
any of the metadata text fields, including Description, Author, and License.


## Page 5

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


## Page 6

Model Personalization
Update your model to adapt to new data.


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

Downloading and Compiling a Model on the User’s Device
Encrypting a Model in Your App
MLModel encapsulates a model’s prediction methods, configuration, and model description.
In most cases, you can use Core ML without accessing the MLModel class directly. Instead, use t
programmer-friendly wrapper class that Xcode automatically generates when you add a model (s
Integrating a Core ML Model into Your App). If your app needs the MLModel interface, use the
wrapper class’s model property.
With the MLModel interface, you can:
Make a prediction with your app’s custom MLFeatureProvider by calling
prediction(from:) or prediction(from:options:).
Make multiple predictions with your app’s custom MLBatchProvider by calling
predictions(fromBatch:) or predictions(from:options:).
Inspect your model’s metadata and MLFeatureDescription instances through model
Description.
If your app downloads and compiles a model on the user’s device, you must use the MLModel
class directly to make predictions. See Downloading and Compiling a Model on the User’s Device
Mentioned in
Overview
Core ML / MLModel
Class
MLModel
An encapsulation of all the details of your machine learning model.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 11

Important
Use an MLModel instance on one thread or one dispatch queue at a time. Do this by either
serializing method calls to the model, or by creating a separate model instance for each thread
and dispatch queue.
class func load(contentsOf: URL, configuration: MLModelConfiguration)
async throws -> MLModel
Construct a model asynchronously from a compiled model asset.
class func load(MLModelAsset, configuration: MLModelConfiguration,
completionHandler: (MLModel?, (any Error)?) -> Void)
Construct a model asynchronously from a compiled model asset.
class func load(contentsOf: URL, configuration: MLModelConfiguration,
completionHandler: (Result<MLModel, any Error>) -> Void)
Creates a Core ML model instance asynchronously from a compiled model file, a custom
configuration, and a completion handler.
convenience init(contentsOf: URL) throws
Creates a Core ML model instance from a compiled model file.
convenience init(contentsOf: URL, configuration: MLModelConfiguration)
throws
Creates a Core ML model instance from a compiled model file and a custom configuration.
convenience init(contentsOfURL: URL) throws
convenience init(contentsOfURL: URL, configuration: MLModelConfiguratio
) throws
class compileModel(at:)
class func compileModel(at: URL, completionHandler: (Result<URL, any
Error>) -> Void)
Compile a model for a device.
Topics
Loading a model
Compiling a model


## Page 12

func prediction(from:)
func prediction(from:options:)
func predictions(fromBatch: any MLBatchProvider) throws -> any MLBatch
Provider
Generates predictions for each input feature provider within the batch provider.
func predictions(from: any MLBatchProvider, options: MLPredictionOption
) throws -> any MLBatchProvider
Generates a prediction for each input feature provider within the batch provider using the
prediction options.
func prediction(from:using:)
func prediction(from:using:options:)
class MLPredictionOptions
The options available when making a prediction.
func makeState() -> MLState
Creates a new state object.
static var availableComputeDevices: [MLComputeDevice]
The list of available compute devices that the model’s prediction methods use.
var configuration: MLModelConfiguration
The configuration of the model set during initialization.
var modelDescription: MLModelDescription
Model information you use at runtime during development, which Xcode also displays in its
Core ML model editor view.
class MLModelDescription
Information about a model, primarily the input and output format for each feature the model
expects, and optional metadata.
Making predictions
Making state
Inspecting a model


## Page 13

func parameterValue(for: MLParameterKey) throws -> Any
Returns a model parameter value for a key.
class MLParameterKey
The keys for the parameter dictionary in a model configuration or a model update context.
class MLModelConfiguration
The settings for creating or updating a machine learning model.
struct MLOptimizationHints
class MLKey
An abstract base class for machine learning key types.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting a Core ML Model
Supporting types
Relationships
Inherits From
Conforms To
See Also
Core ML models


## Page 14

Obtain a Core ML model to use in your app.
Updating a Model File to a Model Package
Convert a Core ML model file into a model package in Xcode.
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s
predictions.
Model Customization
Expand and modify your model with new layers.
Model Personalization
Update your model to adapt to new data.


## Page 15

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


## Page 16

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


## Page 17

On-device model updates provide your app the flexibility to personalize a user’s experience. For
example, ordering a mocha at your favorite coffee shop every day increases a model’s ability to
recommend that drink on subsequent visits. With the Core ML framework, you can adapt to
incoming data with an updatable model at runtime on the user’s device.
class MLTask
An abstract base class for machine learning tasks.
Personalizing a Model with On-Device Updates
Modify an updatable Core ML model by running an update task with labeled data.
class MLUpdateTask
A task that updates a model with additional training data.
Overview
Topics
On-device model updates
See Also
Core ML models
Core ML / Model Personalization
API Collection
Model Personalization
Update your model to adapt to new data.


## Page 18

Getting a Core ML Model
Obtain a Core ML model to use in your app.
Updating a Model File to a Model Package
Convert a Core ML model file into a model package in Xcode.
Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s
predictions.
class MLModel
An encapsulation of all the details of your machine learning model.
Model Customization
Expand and modify your model with new layers.


