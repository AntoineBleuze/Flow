# 002_MLComputePolicy.pdf

## Page 1

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


## Page 2

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


