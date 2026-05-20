# Compute devices.pdf

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


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
MLComputeDeviceProtocol
NSObjectProtocol
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To
See Also
Compute devices
Core ML / MLCPUComputeDevice
Class
MLCPUComputeDevice
An object that represents a CPU compute device.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 4

enum MLComputeDevice
Compute devices for framework operations.
class MLGPUComputeDevice
An object that represents a GPU compute device.
class MLNeuralEngineComputeDevice
An object that represents a Neural Engine compute device.
protocol MLComputeDeviceProtocol
An interface that represents a compute device type.


## Page 5

var metalDevice: (any MTLDevice)!
The device that represents the underlying metal device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
MLComputeDeviceProtocol
Topics
Getting the metal device
Relationships
Inherits From
Conforms To
Core ML / MLGPUComputeDevice
Class
MLGPUComputeDevice
An object that represents a GPU compute device.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 6

NSObjectProtocol
Sendable
SendableMetatype
enum MLComputeDevice
Compute devices for framework operations.
class MLCPUComputeDevice
An object that represents a CPU compute device.
class MLNeuralEngineComputeDevice
An object that represents a Neural Engine compute device.
protocol MLComputeDeviceProtocol
An interface that represents a compute device type.
See Also
Compute devices


## Page 7

var totalCoreCount: Int
The total number of cores in the Neural Engine.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
MLComputeDeviceProtocol
Topics
Getting the Total Core Count
Relationships
Inherits From
Conforms To
Core ML / MLNeuralEngineComputeDevice
Class
MLNeuralEngineComputeDevice
An object that represents a Neural Engine compute device.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 8

NSObjectProtocol
Sendable
SendableMetatype
enum MLComputeDevice
Compute devices for framework operations.
class MLCPUComputeDevice
An object that represents a CPU compute device.
class MLGPUComputeDevice
An object that represents a GPU compute device.
protocol MLComputeDeviceProtocol
An interface that represents a compute device type.
See Also
Compute devices


## Page 9

NSObjectProtocol
MLCPUComputeDevice, MLGPUComputeDevice, MLNeuralEngineComputeDevice
enum MLComputeDevice
Compute devices for framework operations.
class MLCPUComputeDevice
An object that represents a CPU compute device.
class MLGPUComputeDevice
Relationships
Inherits From
Conforming Types
See Also
Compute devices
Core ML / MLComputeDeviceProtocol
Protocol
MLComputeDeviceProtocol
An interface that represents a compute device type.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 10

An object that represents a GPU compute device.
class MLNeuralEngineComputeDevice
An object that represents a Neural Engine compute device.


