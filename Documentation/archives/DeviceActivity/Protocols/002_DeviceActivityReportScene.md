# 002_DeviceActivityReportScene.pdf

## Page 1

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


## Page 2

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


