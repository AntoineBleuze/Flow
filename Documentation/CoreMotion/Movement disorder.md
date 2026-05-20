# Movement disorder.pdf

## Page 1

The CMMovementDisorderManager class provides a power-efficient approach for you to
continuously measure and record tremors and dyskinetic symptoms for Parkinson’s disease for
your app.
Important
Apple doesn’t market the movement disorder monitoring as a regulated medical device.
Depending on how your app uses the API, you may need to meet additional regulatory
obligations. Seek the relevant regulatory advice as needed for your app.
When you begin retrieving data from the movement disorder manager, Apple Watch starts to
gather motion data. To preserve battery life, the manager doesn’t perform calculations in real time
Instead, it periodically and opportunistically analyzes the raw data, saving the results on the user’
device. To preserve disk space, the manager only keeps results for seven days. During this time,
you can use the manager to query for the results.
For more information about the scientific validation and algorithms behind disorder detection and
recording, see Smartwatch inertial sensors continuously monitor real-world motor fluctuations in
Parkinson’s disease, or download a PDF from Science Translational Medicine Magazine.
Apps that use the CMMovementDisorderManager must:
Confirm the user’s diagnosis of Parkinson’s disease.
Only report on symptoms diagnosed by a clinician or self-reported by the user.
Remind the user to wear Apple Watch on their most affected arm in order to collect the most
useful data.
Overview
Core Motion / Getting movement disorder symptom data
Article
Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.


## Page 2

Important
To use the Movement Disorder API, your app must adhere to the Movement Disorder Program
Requirements. For more information, see Adhering to the movement disorder data collection
requirements. Additionally, your app must follow best practices for handling the user’s health
data, as defined by the HealthKit guidelines. For more information, see Protecting user privacy.
To retrieve Parkinson’s tremors or dyskinetic symptoms data from a watchOS app:
1. Provide a motion usage description in your WatchKit extension’s Info.plist file.
2. Instantiate a CMMovementDisorderManager object.
3. Ensure that movement disorder monitoring is available on the current device.
4. Begin monitoring the user.
5. Query for tremors or dyskinetic symptoms.
Your watchOS app must provide an NSMotionUsageDescription key with a String value in the
WatchKit extension’s Info.plist file. The system displays the motion usage description
whenever it asks a user for permission to record their data. The description string appears in the
Motion and Fitness authorization prompt.
At a minimum, your description must contain the following text: “In addition, this app would like to
access your tremor and dyskinetic symptom data. This is only intended for use in those already
diagnosed with Parkinson’s disease.”
You can include additional information explaining why the user should grant your app permission,
and what your app intends to do with the data after this text.
The following example shows how to set up your movement disorder manager, and begin
monitoring the user’s symptoms:
Provide the motion usage description
Monitor and query for results


## Page 3

After you start monitoring, the manager leverages the CMSensorRecorder to record high-rate
accelerometer data passively. When enabled, the CMSensorRecorder records 100 Hz samples.
The movement disorder algorithms then periodically and opportunistically use this data to calcula
tremors and dyskinetic symptoms.
The movement disorder manager stores the results of these calculations on the device for seven
days. To access the results, use the manager to query for the desired results, as shown in this
example:


## Page 4

To extend the monitoring past the initial expiration date, call the monitorKinesias(for
Duration:) method again.
CMMovementDisorderManager measures resting tremors from Parkinson’s disease in the 3-7
Hz range. It returns metrics about the presence and relative severity of resting tremor as a
CMTremorResult object. The CMMovementDisorderManager also computes metrics about
choreiform dyskinetic symptoms, measuring the likely presence or absence of dyskinetic
symptoms as observed at the wrist where the user wears their Apple Watch. It returns the results
as CMDyskineticSymptomResult objects.
CMMovementDisorderManager operates under the following constraints:
The user should wear Apple Watch on the most affected arm.
Employ dyskinetic symptom tracking only for users who have chorea on the affected arm, eithe
self-reported or diagnosed by a clinician.
There are many types of tremors. The movement disorder manager explicitly tracks resting
tremor; it doesn’t track action tremor or postural tremor, and it may not track finger tremor.
The manager doesn’t explicitly track dystonia.
The results may include false positives and false negatives. The user’s activity, watch band fit,
and concomitant conditions (such as restless legs syndrome and non-Parkinsonian tremor) can
affect the quality of the results.
The manager only explicitly measures symptoms from the wrist wearing Apple Watch. However,
Apple Watch may sense symptoms transmitted through the body from other affected body parts,
possibly resulting in misleading or false metrics.
Adhering to the movement disorder data collection requirements
Ensure that your users understand and have control over the data your app collects.
Movement disorder algorithm changelog
Understand the manager’s limitations
See Also
Movement disorder


## Page 5

A chronological log of notable changes to the movement disorder algorithm.
class CMMovementDisorderManager
A manager for recording and querying movement disorder data.
class CMTremorResult
A result object that contains data about the presence and strength of tremors during a one-
minute interval.
class CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic symptoms during a
one-minute interval.


## Page 6

When using the movement disorder APIs, it’s critical that your app provides a transparent data
collection experience. Your app must display an introductory screen that describes its data use
policy. Additionally, some data types require specific disclosures.
Important
Apps that offer movement disorders monitoring must adhere to the Movement Disorder API
Addendum. Note that only Apple Developer Program account holders can access the
addendum. In addition, all health-related apps must follow best practices for handling the
user’s health data, as defined by the HealthKit guidelines (see Protecting user privacy).
Apps that perform movement disorder monitoring must display an introduction screen when the
user first launches the app. This screen must describe the following:
The app’s purpose and target audience.
The data that your app collects during movement disorder monitoring.
How you plan to use the data.
Whether your app collects data while running in the background.
Instructions on how to opt out of data collection in the future.
Overview
Explain your app’s data use policy
Core Motion / Adhering to the movement disorder data collection requirements
Article
Adhering to the movement disorder data
collection requirements
Ensure that your users understand and have control over the data your app
collects.


## Page 7

For some types of data, your app must include additional text in the introduction screen. For each
of the following situations, add the specified text:
Resting tremor data
“This app is monitoring and collecting your Parkinsonian resting tremor data, only if you self-
report or have been clinically diagnosed with resting tremor, and indicate within the app that
this is true.”
Choreiform dyskinesia data
“This app is monitoring and collecting your choreiform dyskinesia data, only if you self-report
or have been clinically diagnosed with choreiform dyskinesias, and indicate within the app tha
this is true.”
Movement disorder data in the background
“This app is able to collect your movement disorder data even when the app is not active, on
screen, or responding to your user input.”
Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.
Movement disorder algorithm changelog
A chronological log of notable changes to the movement disorder algorithm.
class CMMovementDisorderManager
A manager for recording and querying movement disorder data.
class CMTremorResult
A result object that contains data about the presence and strength of tremors during a one-
minute interval.
class CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic symptoms during a
one-minute interval.
Include required disclosures
See Also
Movement disorder


## Page 8

The movement disorder algorithm measures and records tremors and dyskinetic symptoms for
Parkinson’s disease. For more information on receiving and using this data, see Getting movemen
disorder symptom data.
The version() method for checking the algorithm’s current version is available in watchOS 9
Released the algorithm used in watchOS 5 and later.
Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.
Adhering to the movement disorder data collection requirements
Ensure that your users understand and have control over the data your app collects.
Overview
Unreleased
1.0.0 — 2018-07-17
Added
See Also
Movement disorder
Core Motion / Movement disorder algorithm changelog
Article
Movement disorder algorithm changelog
A chronological log of notable changes to the movement disorder algorithm.


## Page 9

class CMMovementDisorderManager
A manager for recording and querying movement disorder data.
class CMTremorResult
A result object that contains data about the presence and strength of tremors during a one-
minute interval.
class CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic symptoms during a
one-minute interval.


## Page 10

Getting movement disorder symptom data
Important
Only collect data from patients clinically diagnosed with a movement disorder. This API is not
designed to collect data from users who have not been diagnosed with a movement disorder.
All medical decisions should be made through the guidance of a licensed clinician. For more
information, see Adhering to the movement disorder data collection requirements.
Use CMMovementDisorderManager to measure a resting Parkinsonian tremor in the 3-7 Hz
range and choreiform dyskinetic symptoms. When collecting data, the user should wear Apple
Watch on their most affected arm.
CMMovementDisorderManager requires an entitlement from Apple. To apply for the entitlemen
see Movement Disorder Entitlement Request.
Mentioned in
Overview
Core Motion / CMMovementDisorderManager
Class
CMMovementDisorderManager
A manager for recording and querying movement disorder data.
watchOS 5.0+


## Page 11

Important
To use this API, you must include the NSMotionUsageDescription key in your app’s Info
.plist file and provide a usage description string for this key. The usage description appears
in the prompt that the user must accept the first time the system asks the user to access
motion data for your app. If you don’t include a usage description string, your app crashes
when you call this API.
class func isAvailable() -> Bool
A Boolean value indicating whether the current device supports the movement disorder
manager.
class func authorizationStatus() -> CMAuthorizationStatus
A value indicating whether the user has authorized the app to monitor and query for
movement disorder data.
class func version() -> String?
Returns a string that describes the movement disorder algorithm’s current version.
func monitorKinesias(forDuration: TimeInterval)
Calculate and store tremor and dyskinetic symptom results for the duration of the specified
time interval.
func monitorKinesiasExpirationDate() -> Date?
Returns the expiration date for the most recent monitoring period.
func queryTremor(from: Date, to: Date, withHandler: CMTremorResult
Handler)
Query for tremor results from the provided time interval.
typealias CMTremorResultHandler
A completion handler for accessing and processing tremor results.
Topics
Checking Availablility
Recording Movement Disorders
Querying for Movement Disorders


## Page 12

func queryDyskineticSymptom(from: Date, to: Date, withHandler:
CMDyskineticSymptomResultHandler)
Query for dyskinetic symptoms from the provided time interval.
typealias CMDyskineticSymptomResultHandler
A completion handler for processing dyskinetic symptom results.
func lastProcessedDate() -> Date?
Returns the date of the most recently calculated results.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.
Adhering to the movement disorder data collection requirements
Ensure that your users understand and have control over the data your app collects.
Movement disorder algorithm changelog
A chronological log of notable changes to the movement disorder algorithm.
Relationships
Inherits From
Conforms To
See Also
Movement disorder


## Page 13

class CMTremorResult
A result object that contains data about the presence and strength of tremors during a one-
minute interval.
class CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic symptoms during a
one-minute interval.


## Page 14

Getting movement disorder symptom data
The following equation is always true: percentUnknown + percentNone + percentSlight +
percentMild + percentModerate + percentStrong = 1.0.
var startDate: Date
The result’s start time and date.
var endDate: Date
The result’s end time and date.
Mentioned in
Overview
Topics
Reading the Time Interval
Core Motion / CMTremorResult
Class
CMTremorResult
A result object that contains data about the presence and strength of tremors
during a one-minute interval.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+
visionOS 1.0+
watchOS 5.0+


## Page 15

var percentUnknown: Float
The percentage of time when the algorithm couldn’t make a determination.
var percentNone: Float
The percentage of time when no tremor was detected.
var percentSlight: Float
The percentage of time when a tremor was likely, and the displacement amplitude was slight
var percentMild: Float
The percentage of time when a tremor was likely, and the displacement amplitude was mild.
var percentModerate: Float
The percentage of time when a tremor was likely, and the displacement amplitude was
moderate.
var percentStrong: Float
The percentage of time when a tremor was likely, and the displacement amplitude was stron
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Accessing Tremor Data
Relationships
Inherits From
Conforms To


## Page 16

NSSecureCoding
Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.
Adhering to the movement disorder data collection requirements
Ensure that your users understand and have control over the data your app collects.
Movement disorder algorithm changelog
A chronological log of notable changes to the movement disorder algorithm.
class CMMovementDisorderManager
A manager for recording and querying movement disorder data.
class CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic symptoms during a
one-minute interval.
See Also
Movement disorder


## Page 17

Getting movement disorder symptom data
Dyskinesias are uncontrolled, involuntary movements that occur as a side effect of taking Levado
to control Parkinson’s disease. Dyskinesias can manifest in a single body part, such as the arm, le
or head, or they can affect the entire body. Particular dyskinesias resemble actions like fidgeting,
writhing, wriggling, head bobbing, or body swaying. These symptoms tend to occur during the
drug’s peak dosage. Dyskinesias typically occur in patients with advanced Parkinson’s disease,
who may require higher dosages of Levadopa.
The following equation is always true: percentUnlikely + percentLikely = 1.0.
Important
Gather and present data on dyskinetic symptom results only to users with choreiform
dyskinesias, either self-reported or diagnosed by a clinician.
Mentioned in
Overview
Core Motion / CMDyskineticSymptomResult
Class
CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic
symptoms during a one-minute interval.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+
watchOS 5.0+


## Page 18

var startDate: Date
The result’s start time and date.
var endDate: Date
The result’s end time and date.
var percentUnlikely: Float
The percentage of time when dyskinetic symptoms were unlikely.
var percentLikely: Float
The percentage of time when dyskinetic symptoms were likely.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Topics
Reading the Time Interval
Accessing Dyskinetic Symptom Data
Relationships
Inherits From
Conforms To


## Page 19

Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.
Adhering to the movement disorder data collection requirements
Ensure that your users understand and have control over the data your app collects.
Movement disorder algorithm changelog
A chronological log of notable changes to the movement disorder algorithm.
class CMMovementDisorderManager
A manager for recording and querying movement disorder data.
class CMTremorResult
A result object that contains data about the presence and strength of tremors during a one-
minute interval.
See Also
Movement disorder


