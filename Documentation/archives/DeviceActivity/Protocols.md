# Protocols.pdf

## Page 1

static var isAuthorized: Bool
Required
static func isAuthorized(String) -> Bool
Required
DeviceActivityAuthorization
Topics
Type Properties
Type Methods
Relationships
Conforming Types
DeviceActivity / DeviceActivityAuthorizing
Protocol
DeviceActivityAuthorizing
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+


## Page 2

Your extension is provided with the data that your app requests when it instantiates a Device
ActivityReport, which it uses to render a View representing the user’s device activity.
associatedtype Body : DeviceActivityReportScene
The body of the extension’s scene.
Required
var body: Self.Body
A body containing a DeviceActivityReportScene for each context that your extension
supports.
Required
Overview
Topics
Associated Types
Instance Properties
DeviceActivity / DeviceActivityReportExtension
Protocol
DeviceActivityReportExtension
An app extension that reports device activity data.
DeviceActivity
SwiftUI
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 3

AppExtension
Relationships
Inherits From


## Page 4

This protocol refines AppExtensionScene and restricts the types that can be passed to a
DeviceActivityReportBuilder. Your extension should provide a scene for each context tha
your app supports.
associatedtype Configuration
A type used to configure your scene’s content.
Required
associatedtype Content : View
The type of view that represents the scene’s content.
Required
var content: (Self.Configuration) -> Self.Content
Overview
Topics
Associated Types
Instance Properties
DeviceActivity / DeviceActivityReportScene
Protocol
DeviceActivityReportScene
Defines a custom device activity report scene.
DeviceActivity
SwiftUI
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 5

A closure that builds your report’s content with the provided configuration.
Required
var context: DeviceActivityReport.Context
The context of the scene.
Required
func makeConfiguration(representing: DeviceActivityResults<Device
ActivityData>) async -> Self.Configuration
Creates a new configuration that represents the provided data.
Required
AppExtensionScene
Instance Methods
Relationships
Inherits From


