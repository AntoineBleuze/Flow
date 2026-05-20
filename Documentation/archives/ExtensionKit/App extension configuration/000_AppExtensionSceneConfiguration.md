# 000_AppExtensionSceneConfiguration.pdf

## Page 1

Use this type to provide the configuration details for an AppExtension type when the
corresponding app extension provides a custom UI.
init<Content>(@autoclosure () -> Content)
Creates a scene configuration from a closure.
init<Content, Configuration>(@autoclosure () -> Content, configuration:
Configuration?)
Creates a scene configuration object from a closure and extension configuration.
func accept(connection: NSXPCConnection) -> Bool
Overview
Topics
Creating the configuration
Accepting a connection to the host app
ExtensionKit / AppExtensionSceneConfiguration
Structure
AppExtensionSceneConfiguration
An object you use to configure an app extension that provides a custom UI.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

A closure the framework calls when a host tries to connect to this extension.
AppExtensionConfiguration, Sendable, SendableMetatype
Relationships
Conforms To


