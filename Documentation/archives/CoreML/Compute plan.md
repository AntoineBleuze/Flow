# Compute plan.pdf

## Page 1

The application can use the compute plan to estimate the necessary cost and resources of the
model before running the predictions.
Overview
Core ML / MLComputePlan
Class
MLComputePlan
A class representing the compute plan of a model.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
macOS 14.4+
tvOS 17.4+
visionOS 1.0+
watchOS 10.4+


## Page 2

static func load(asset: MLModelAsset, configuration: MLModel
Configuration) async throws -> MLComputePlan
Construct the compute plan of a model asynchronously given the model asset.
static func load(contentsOf: URL, configuration: MLModelConfiguration)
async throws -> MLComputePlan
Construct the compute plan of a model asynchronously given the location of its on-disk
representation.
let modelStructure: MLModelStructure
The model structure.
func deviceUsage(for:)
Returns the anticipated compute devices that would be used for executing a NeuralNetwork
layer.
func deviceUsage(for: MLModelStructure.NeuralNetwork.Layer) -> MLComput
Plan.DeviceUsage?
Returns the anticipated compute devices that would be used for executing a NeuralNetwork
layer.
func deviceUsage(for: MLModelStructure.Program.Operation) -> MLCompute
Plan.DeviceUsage?
Returns the anticipated compute devices that would be used for executing a MLProgram
operation.
struct DeviceUsage
The anticipated compute devices that would be used for executing a layer/operation.
Topics
Loading a compute plan
Getting the model structure
Getting the device usage
Getting the estimated cost


## Page 3

func estimatedCost(of: MLModelStructure.Program.Operation) -> MLCompute
Plan.Cost?
Returns the estimated cost of executing a MLProgram operation.
struct Cost
A struct containing information on the estimated cost of executing a layer/operation.
enum MLModelStructure
An enum representing the structure of a model.
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
See Also
Compute plan


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

static var cpuAndGPU: MLComputePolicy
Execute ML workloads using the GPU if available, otherwise falling back to the CPU.
static var cpuOnly: MLComputePolicy
Execute ML workloads using the CPU.
init(MLComputeUnits)
Creates a new compute policy using the given compute units.
CustomReflectable Implementations
CustomStringConvertible Implementations
Topics
Compute policies
Creating a compute policy
Default Implementations
Core ML / MLComputePolicy
Structure
MLComputePolicy
The compute policy determining what compute device, or compute devices, to
execute ML workloads on.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 8

Copyable
CustomReflectable
CustomStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
class MLComputePlan
A class representing the compute plan of a model.
enum MLModelStructure
An enum representing the structure of a model.
func withMLTensorComputePolicy<R>(MLComputePolicy, () async throws -> R
async rethrows -> R
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.
func withMLTensorComputePolicy<Result>(MLComputePolicy, () throws ->
Result) rethrows -> Result
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.
Relationships
Conforms To
See Also
Compute plan


## Page 9

computePolicy
A compute policy that will be set before the closure gets called and restored after the closure
returns.
body
A nullary closure. If the closure has a return value, that value is also used as the return value 
the withMLTensorComputePolicy(_:_:) function.
The return value, if any, of the body closure.
Parameters
Return Value
See Also
Compute plan
Core ML / withMLTensorComputePolicy(_:_:)
Function
withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute
policy to influence what compute device tensor operations are executed on.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Show all declarations


## Page 10

class MLComputePlan
A class representing the compute plan of a model.
enum MLModelStructure
An enum representing the structure of a model.
struct MLComputePolicy
The compute policy determining what compute device, or compute devices, to execute ML
workloads on.
func withMLTensorComputePolicy<Result>(MLComputePolicy, () throws ->
Result) rethrows -> Result
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


## Page 11

computePolicy
A compute policy that will be set before the closure gets called and restored after the closure
returns.
body
A nullary closure. If the closure has a return value, that value is also used as the return value 
the withMLTensorComputePolicy(_:_:) function.
The return value, if any, of the body closure.
Parameters
Return Value
See Also
Compute plan
Core ML / withMLTensorComputePolicy(_:_:)
Function
withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute
policy to influence what compute device tensor operations are executed on.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Show all declarations


## Page 12

class MLComputePlan
A class representing the compute plan of a model.
enum MLModelStructure
An enum representing the structure of a model.
struct MLComputePolicy
The compute policy determining what compute device, or compute devices, to execute ML
workloads on.
func withMLTensorComputePolicy<R>(MLComputePolicy, () async throws -> R
async rethrows -> R
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


