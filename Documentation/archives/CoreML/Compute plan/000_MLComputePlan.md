# 000_MLComputePlan.pdf

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


