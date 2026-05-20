# Definite Integration.pdf

## Page 1

The following code illustrates using a Quadrature structure to calculate the area under a curve,
defined by y = sqrt(radius * radius - pow(x - radius, 2)):
Overview
Accelerate / Quadrature
Structure
Quadrature
A structure that approximates the definite integral of a function over a finite
interval.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 2

Alternatively, you can integrate over a function that uses vectors for its source and destination. Fo
example:
init(integrator: Quadrature.Integrator, absoluteTolerance: Double,
relativeTolerance: Double)
Initializes and returns a quadrature instance.
var absoluteTolerance: Double
The requested absolute tolerance on the result.
var relativeTolerance: Double
The requested relative tolerance on the result.
func integrate(over: ClosedRange<Double>, integrand: (Double) -> Double
-> Result<(integralResult: Double, estimatedAbsoluteError: Double),
Quadrature.Error>
Performs the integration over the supplied scalar function.
Topics
Initializers
Instance Properties
Instance Methods


## Page 3

func integrate(over: ClosedRange<Double>, integrand: (UnsafeBuffer
Pointer<Double>, UnsafeMutableBufferPointer<Double>) -> ()) -> Result
<(integralResult: Double, estimatedAbsoluteError: Double), Quadrature.
Error>
Performs the integration over the supplied vector function.
struct QAGPointsPerInterval
Constants that specify the number of points per interval for the globally adaptive integrator.
enum Error
Errors thrown by the Quadrature structure.
enum Integrator
Constants that define different integrators.
typealias quadrature_function_array
struct quadrature_integrate_function
struct quadrature_integrate_options
struct quadrature_integrator
Constants that specify integration algorithms.
struct quadrature_status
Constants that indicate the status of a quadrature operation.
Structures
Enumerations
Type Aliases
See Also
Quadrature


