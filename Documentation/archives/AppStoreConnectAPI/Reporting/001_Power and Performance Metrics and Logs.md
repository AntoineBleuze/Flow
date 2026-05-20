# 001_Power and Performance Metrics and Logs.pdf

## Page 1

The perfPowerMetricsresource resource is a read-only resource where you get the power
and performance metrics and diagnostics for App Store versions of your app. Use this information
to improve your app’s performance. Customers can opt-in to share this information with you on
their devices.
A metric is a measurement of the power and performance impact of an app running on a device.
The MetricCategory type lists the categories of measurements the system makes; for example
the LAUNCH metric measures how long it takes an app to present its first frame. Use the Get
Power and Performance Metrics for an App and Get Power and Performance
Metrics for a Build endpoints to get the metrics reports for the most recent version of you
app or for a specific build.
An insight is an automatically generated analysis that shows a trend based on a set of metrics dat
Insights compare the performance of the most recent app version with previous versions. Look fo
insights in the response body object, xcodeMetrics.
A diagnostic signature is a recurring pattern of function calls your app makes that are associated
with a metric. To get a diagnostic log for a signature, first call the List All Diagnostic
Signatures for a Build endpoint to get the resource IDs for signatures you’re interested in
Then call Download Logs for a Diagnostic Signature using the signature resource IDs
to download the logs.
To learn more about power and performance metrics, see About Metrics organizer, and
Improving Your App's Performance.
Overview
Topics
App Store Connect API / Power and Performance Metrics and Logs
API Collection
Power and Performance Metrics and Logs
Get power and performance metrics, logs, and signatures.


## Page 2

Retrieve Power and Performance Metrics and Log Insights
Use the App Store Connect API to collect and parse diagnostic logs and metrics for your app
Get Power and Performance Metrics for an App
Get the performance and power metrics data for the most recent version of an app.
Get Power and Performance Metrics for a Build
Get the performance and power metrics data for a specific build.
List All Diagnostic Signatures for a Build
List the aggregate backtrace signatures captured for a specific build.
Download Logs for a Diagnostic Signature
Get the anonymized backtrace logs associated with a specific diagnostic signature.
object xcodeMetrics
A response that contains power and performance measurements for your app.
object DiagnosticInsight
The data structure that represents the Diagnostic Insight resource.
object DiagnosticSignaturesResponse
A response that contains a list of Diagnostic Signature resources.
object DiagnosticSignature
The data structure that represents the Diagnostic Signatures resource.
object diagnosticLogs
A response containing log data for a diagnostic signature.
object DiagnosticLog
The data structure that represents the Diagnostic Logs resource.
object DiagnosticLogCallStackNode
Diagnostic information that describes a single line in a call stack.
object MetricsInsight
Getting Metrics and Diagnostic Logs
Objects and Types


## Page 3

Results of an analysis of metric data for a single metric category for your app.
type MetricCategory
Categories of metric reports for apps that you distribute through the App Store.
object PerfPowerMetric
Unused.
object AppPerfPowerMetricsLinkagesResponse
object DiagnosticSignatureLogsLinkagesResponse
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Sales and Finance
Download your sales and financial reports.
Analytics
Get data about your apps and usage.
See Also
Related Documentation
Reporting


