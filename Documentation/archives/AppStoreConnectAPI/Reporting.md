# Reporting.pdf

## Page 1

App Store Connect provides data that allows you to measure the performance of your app and vie
payments from Apple. Use the App Store Connect API to apply filters to select and configure the
data, and automate the download of sales and financial reports. For detailed information on repor
see Overview of reporting tools.
These endpoints require a Team key and aren’t usable with an Individual key. To learn more about
keys and roles, see Creating API Keys for App Store Connect API.
Download Finance Reports
Download finance reports filtered by your specified criteria.
Download Sales and Trends Reports
Download sales and trends reports filtered by your specified criteria.
type gzip
Overview
Topics
Downloading Reports
Objects
App Store Connect API / Sales and Finance
API Collection
Sales and Finance
Download your sales and financial reports.


## Page 2

Power and Performance Metrics and Logs
Get power and performance metrics, logs, and signatures.
Analytics
Get data about your apps and usage.
See Also
Reporting


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

Use the Analytics Reports API to analyze your app’s performance on iOS and the App Store and
find opportunities for improvement. To learn more about interpreting the data using the glossary o
report fields and definitions, see Analytics Reports.
To help protect user privacy, where appropriate, Apple is applying measures to protect personally
identifable infomation. For specific reports, Apple adds noise or applies crowd anonymity, and use
both approaches for other reports. Apple only reports totals when a specific number of data point
are available. For more infomation about these measures, see Protecting user privacy in report
data.
To download analytics reports, be sure you have one of the following user roles:
ADMIN
SALES AND REPORTS
FINANCE
This table outlines which roles can use which resources:
Role
Manage requests
List and download reports
Admin
Request reports and Delete a
report request
Read reports for a
specific request
Finance
Read reports for a
specific request
Sales and
Reports
Read reports for a
specific request
Overview
App Store Connect API / Analytics
API Collection
Analytics
Get data about your apps and usage.


## Page 7

The Sales and Reports role can also read Download Sales and Trends Reports in addition
to Analytics Reports.
To learn more about roles, see Program Roles.
Note
If you have any questions about the data made available in this API, including about how Apple
applies privacy measures to protect user privacy and complies with legal obligations, contact
Apple through Feedback Assistant by selecting the following option:
Developer Tools & Resources > App Store Connect API > Data Request
Learn more about how to use Feedback Assistant.
Downloading Analytics Reports
Learn how to request and review data about your apps, their usage, engagement, and
performance.
Request reports
Request analytics reports for your apps.
Read report requests
Read analytics report requests for a specific app.
Read report request information
Get details for and the state of a specific analytics report request.
Read reports for a specific request
Get a list of reports generated from a specific analytics report request.
Read reports Ids for a specific request
Get a list of reports Ids from a specific analytics report request.
Delete a report request
Remove a specific analytics report request.
Topics
Essentials
Making, Reading, and Deleting Requests


## Page 8

Read report information
Get details for a specific analytics report.
Read a list of instances of a report
Read list of all the granularity options for a specific type of analytics report.
Read report instance information
Get details for a specific instance of an analytics report.
Read the segments for a report
Get details for a specific analytics report segment.
Read segment IDs for a report
Get Ids for a specific analytics report segment.
Read the details for a report segment
Get details and download information for a specific analytics report segment.
Read a list of a report instant IDs
Read list of all the instance IDs for a specific type of analytics report.
object AnalyticsReportRequest
The data structure that represents an analytics report request.
object AnalyticsReportRequestCreateRequest
The request body you use to create an analytics report request.
object AnalyticsReportRequestResponse
A response that contains a single analytics report request resource.
object AnalyticsReportRequestsResponse
A response that contains a list of analytics report request resources.
object AnalyticsReport
The data structure that represents an analytics report.
object AnalyticsReportResponse
Reading Reports, Instances, and Segments
Objects


## Page 9

A response that contains a single analytics report resource.
object AnalyticsReportsResponse
A response that contains a list of analytics report resources.
object AnalyticsReportInstance
The data structure that represents an analytics report instance.
object AnalyticsReportInstanceResponse
A response that contains a single analytics report instance resource.
object AnalyticsReportInstancesResponse
A response that contains a list of analytics report instance resources.
object AnalyticsReportSegment
The data structure that represents an analytics report segment.
object AnalyticsReportSegmentResponse
A response that contains a single analytics report segment resource.
object AnalyticsReportSegmentsResponse
A response that contains a list of analytics report segment resources.
object AnalyticsReportInstanceSegmentsLinkagesResponse
object AnalyticsReportInstancesLinkagesResponse
object AnalyticsReportRequestReportsLinkagesResponse
object AppAnalyticsReportRequestsLinkagesResponse
Sales and Finance
Download your sales and financial reports.
Power and Performance Metrics and Logs
Get power and performance metrics, logs, and signatures.
See Also
Reporting


## Page 10



