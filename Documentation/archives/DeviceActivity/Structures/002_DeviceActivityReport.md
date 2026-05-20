# 002_DeviceActivityReport.pdf

## Page 1

When you create a report, the system asks your app’s device activity report extension to provide 
View representing the user’s device activity. To protect the user’s privacy, your extension runs in
sandbox. This sandbox prevents your extension from making network requests or moving sensitiv
content outside the extension’s address space. The extension point identifier for all device activity
report extensions is com.apple.deviceactivityui.report-extension. You can configur
a report with a custom context and filter, and then display the report like any SwiftUI view.
Overview
DeviceActivity / DeviceActivityReport
Structure
DeviceActivityReport
A view that reports the user’s application, category, and web domain activity in a
privacy-preserving way.
DeviceActivity
SwiftUI
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+


## Page 2

The system will only provide your extension with device activity data if the user has authorized yo
app for family controls on their device or on the device(s) of children in their iCloud family. See


## Page 3

AuthorizationCenter for more details.
struct Context
A context indicating how your device activity report extension should configure its Device
ActivityReportView.
init(DeviceActivityReport.Context, filter: DeviceActivityFilter)
Creates a new device activity report.
var body: some View
The content of the device activity report.
Sendable, SendableMetatype, View
Topics
Structures
Initializers
Instance Properties
Relationships
Conforms To


