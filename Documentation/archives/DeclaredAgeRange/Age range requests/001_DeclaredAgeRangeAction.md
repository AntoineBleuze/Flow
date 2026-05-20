# 001_DeclaredAgeRangeAction.pdf

## Page 1

Use DeclaredAgeRangeAction in SwiftUI views to request age ranges without manually
managing the presentation context. This action automatically handles the differences between
macOS windows and iOS view controllers, providing a unified interface for age range requests
across platforms.
func callAsFunction(ageGates: Int, Int?, Int?) async throws -> AgeRange
Service.Response
Returns a response indicating whether the person has set their age range.
Overview
Topics
Requesting the age range
See Also
Declared Age Range / DeclaredAgeRangeAction
Structure
DeclaredAgeRangeAction
An action that requests a person’s declared age range with automatic UI context
management.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+


## Page 2

struct AgeRangeService
A request for the age range of a person logged onto the current device.
Age range requests


