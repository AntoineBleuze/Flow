# Model structure.pdf

## Page 1

case neuralNetwork(MLModelStructure.NeuralNetwork)
Overview
Topics
Model structures
Core ML / MLModelStructure
Enumeration
MLModelStructure
An enum representing the structure of a model.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
macOS 14.4+
tvOS 17.4+
visionOS 1.0+
watchOS 10.4+


## Page 2

Represents a NeuralNetwork model, the associated value is the structure of the
NeuralNetwork.
struct NeuralNetwork
A struct representing the structure of a NeuralNetwork model..
case pipeline(MLModelStructure.Pipeline)
Represents a Pipeline model, the associated value is the structure of the Pipeline.
struct Pipeline
A struct representing the structure of a Pipeline model..
case program(MLModelStructure.Program)
Represents a MLProgram model. the associated value is the structure of the Program.
struct Program
A struct representing the structure of an ML Program model.
case unsupported
Represents an unsupported model.
static func load(asset: MLModelAsset) async throws -> MLModelStructure
Load the model structure asynchronously from the model asset.
static func load(contentsOf: URL) async throws -> MLModelStructure
Load the model structure asynchronously given the location of its on-disk representation.
Sendable, SendableMetatype
Loading a model structure
Relationships
Conforms To
See Also


## Page 3

class MLComputePlan
A class representing the compute plan of a model.
struct MLComputePolicy
The compute policy determining what compute device, or compute devices, to execute ML
workloads on.
func withMLTensorComputePolicy<R>(MLComputePolicy, () async throws -> R
async rethrows -> R
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.
func withMLTensorComputePolicy<Result>(MLComputePolicy, () throws ->
Result) rethrows -> Result
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.
Compute plan


