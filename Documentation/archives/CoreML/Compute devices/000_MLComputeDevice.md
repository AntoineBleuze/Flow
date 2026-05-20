# 000_MLComputeDevice.pdf

## Page 1

case cpu(MLCPUComputeDevice)
A device that represents a CPU compute device.
case gpu(MLGPUComputeDevice)
A device that represents a GPU compute device.
case neuralEngine(MLNeuralEngineComputeDevice)
A device that represents a Neural Engine compute device.
static var allComputeDevices: [MLComputeDevice]
Returns an array that contains all of the compute devices that are accessible.
Topics
Device types
Getting all devices
Relationships
Core ML / MLComputeDevice
Enumeration
MLComputeDevice
Compute devices for framework operations.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 2

CustomStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
class MLCPUComputeDevice
An object that represents a CPU compute device.
class MLGPUComputeDevice
An object that represents a GPU compute device.
class MLNeuralEngineComputeDevice
An object that represents a Neural Engine compute device.
protocol MLComputeDeviceProtocol
An interface that represents a compute device type.
Conforms To
See Also
Compute devices


