# 000_AgeRangeService.pdf

## Page 1

Use AgeRangeService to request a person’s age range and manage their access to content on
your app.
This service enables you to create age-range restricted experiences while respecting people’s
privacy and meeting regulatory requirements. The system presents a standardized interface that
people can use to share their age information with your app, and you receive the information
necessary to make content decisions.
The following code demonstrates how to request a person’s age range and determine what conte
to display on your app’s landing page based on their age group:
Overview
Declared Age Range / AgeRangeService
Structure
AgeRangeService
A request for the age range of a person logged onto the current device.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+


## Page 2

The system may override your age-range restrictions based on regulations and the person’s
geographic location. Age ranges are designed to provide the minimum information necessary for
content decisions while protecting privacy. Parental controls and family sharing settings may affe
the availability and accuracy of age information.
static let shared: AgeRangeService
The singleton app instance for accessing age range services.
enum AgeRangeDeclaration
Constants that describe how an adult, parent, or guardian set the age range.
struct AgeRange
Information about a person’s age range based on their response to your age range request.
func requestAgeRange(ageGates: Int, Int?, Int?, in: UIViewController)
async throws -> AgeRangeService.Response
Requests an age range for the person signed in to iCloud on the device.
func requestAgeRange(ageGates: Int, Int?, Int?, in: NSWindow) async 
throws -> AgeRangeService.Response
Requests an age range for the person logged onto iCloud on the device.
enum Response
A response indicating whether a person shared their age range or declined to share it.
struct ParentalControls
An option set to define parental controls enabled and shared as a part of age range
declaration.
Topics
Retrieving the shared instance
Getting the age range


## Page 3

enum Error
An error that occurs when an age range request fails.
var isEligibleForAgeFeatures: Bool
A boolean value that indicates whether an adult, teen, or child is eligible for age gated
features.
struct DeclaredAgeRangeAction
An action that requests a person’s declared age range with automatic UI context
management.
Handling errors
Instance Properties
See Also
Age range requests


