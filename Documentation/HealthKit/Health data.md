# Health data.pdf

## Page 1

Your app can create new samples and add them to the HealthKit store. Although all sample types
follow a similar procedure, each type has its own variations:
1. Look up the type identifier for your data. For example, to record the user’s weight, you use the
bodyMass type identifier. For the complete list of type identifiers, see Data types.
2. Use the convenience methods on the HKObjectType class to create the correct object type f
your data. For example, to save the user’s weight, you’d create an HKQuantityType object
using the quantityType(forIdentifier:) method. For a list of convenience methods, se
HKObjectType.
3. Instantiate an object of the matching HKSample subclass using the object type.
4. Save the object to the HealthKit store using the save(_:withCompletion:) method.
Each HKSample subclass has its own convenience methods for instantiating sample objects, whi
modify the steps described in the list above.
Overview
HealthKit / Saving data to HealthKit
Article
Saving data to HealthKit
Create and share HealthKit samples.


## Page 2

For quantity samples, create an instance of the HKQuantity class. The quantity’s units must
correspond to the allowable units described in the type identifier’s documentation. For example,
the height documentation states that it uses length units. Therefore, your quantity must use
centimeters, meters, feet, inches, or another compatible unit. For more information, see
HKQuantitySample.
For category samples, the sample’s value must correspond to the enum described in the type
identifier’s documentation. For example, the sleepAnalysis documentation states that it uses
the HKCategoryValueSleepAnalysis enum. Therefore, you must pass a value from this enum
when creating this sample. For more information, see HKCategorySample.
For correlations, you must first create all the sample objects that the correlation will contain. The
correlation’s type identifier describes both the type and the number of objects that can be
contained. Don’t save the contained objects into the HealthKit store. They’re stored as part of the
correlation. For more information, see HKCorrelation.


## Page 3

Important
In iOS 17.2 and later, the Journal app encourages people to reflect on their day-to-day
experiences, including physical accomplishments, workouts, and emotions and moods. If your
app saves data to HealthKit, high-level summaries of that data can appear as suggestions in
the Journal app, or in other apps that use the Journaling Suggestions framework.
When saving data to the HealthKit store, you often need to choose between using a single sample
to represent the data or splitting the data across multiple, smaller samples. A single, long sample 
better from a performance perspective; however, multiple smaller samples gives the user a more
detailed look into how their data changes over time. Ideally, you want to find a sample size that’s
granular enough to provide the user with useful historical data and you should avoid saving
samples that are 24 hours long or longer.
When recording a workout, you can use high frequency data (a minute or less per sample) to
provide intensity charts and otherwise analyze the user’s performance over the workout. For less
intensive activity, like daily step counts, samples of an hour or less often work best. This lets you
produce meaningful daily and hourly graphs.
Most sample types have restrictions on duration. If you attempt to save a sample that doesn’t me
those restrictions, it fails to save. For more details on checking the duration restrictions, refer to
HKSampleType.
The Health app gives users access to all of the data in their HealthKit store. Users can view, add,
delete, and manage their data.
Specifically, users can:
See a dashboard containing their current health data.
Access all the data stored in HealthKit. Users can view the data by type, by app, or by device.
Manage each app’s permission to read and write from the HealthKit store.
As a result, the Health app has a few important impacts on developing HealthKit apps. First,
remember that users can always modify their data outside your app or even change your
permission to access their data. As a result, your app should always query for the current data in
the HealthKit store or perform background queries to track changes to the store.
Second, you can also use the Health app to view the data your app is saving to the HealthKit store
This can be particularly useful during early testing, to verify that your app is saving everything as
expected.
Balance performance and details
Work with data in the Health app


## Page 4

Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.
See Also
Health data


## Page 5

There are three main ways to access data from the HealthKit Store:
Direct method calls. The HealthKit store provides methods to directly access characteristic
data. These methods only access characteristic data. For more information, see HKHealth
Store.
Queries. Queries return the current snapshot of the requested data from the HealthKit store.
Long-running queries. These queries continue to run in the background and update your app
whenever the system detects changes to the HealthKit store.
Queries return the current snapshot of the data in the HealthKit store. All queries run on an
anonymous background queue. When the query is complete, it executes the results handler on th
background queue. HealthKit provides different types of queries, each designed to return differen
types of data from the HealthKit store.
Sample query. This is a general-purpose query. Use sample queries to access any type of
sample data. Sample queries are particularly useful when you want to sort the results or limit th
total number of samples returned. For more information, see HKSampleQueryDescriptor.
Anchored object query. Use this query to search for changes to the HealthKit store. The first
time you run an anchor query, it returns all the matching samples currently in the store. On
subsequent runs, it returns only those items added or deleted since the last run. For more
information, see HKAnchoredObjectQueryDescriptor.
Statistics query. Use this query to perform statistical calculations over the set of matching
samples. You can use statistics queries to calculate the sum, minimum, maximum, or average
value in the set. For more information, see HKStatisticsQueryDescriptor.
Overview
Queries
HealthKit / Reading data from HealthKit
Article
Reading data from HealthKit
Use queries to request sample data from HealthKit.


## Page 6

Statistics collection query. Use this query to perform multiple statistics queries over a series o
fixed-length time intervals. You often use these queries when creating graphs. They provide a
simple method for calculating things such as the total number of calories consumed each day o
the number of steps taken during each five-minute interval. For more information, see
HKStatisticsCollectionQueryDescriptor.
Correlation query. Use this query to perform complex searches of the data contained in a
correlation. These queries can contain individual predicates for each of the sample types store
in the correlation. If you just want to match the correlation type, use a sample query instead. Fo
more information, see HKCorrelationQuery.
Source query. Use this query to search for sources (apps and devices) that have saved
matching samples to the HealthKit store. A source query lists all the sources that are saving a
particular sample type. For more information, see HKSourceQueryDescriptor.
Activity summary query. Use this query to search for activity summary information for the use
Each activity summary object contains a summary of the user’s activity for a given day. You can
query for either a single day or a range of days. For more information, see HKActivity
SummaryQueryDescriptor.
Document query. Use this query to search for health documents. For more information, see
HKDocumentQuery.
Long-running queries continue to run an anonymous background queue, and update your app
whenever the system detects changes to the HealthKit store. In addition, observer queries can
register for background delivery. This lets HealthKit wake your app in the background whenever a
update occurs.
HealthKit provides the following long-running queries:
Observer query. This long-running query monitors the HealthKit store and alerts you to any
changes to matching samples. Use an observer query when you want the system to notify you
about changes to the store. You can register observer queries for background delivery. For mo
information, see HKObserverQuery.
Anchored object query. In addition to returning the current snapshot of modified data, an
anchored object query can act as a long-running query. If enabled, it continues to run in the
background, providing updates when something adds or removes matching samples from the
store. Unlike the observer query, these updates include a list of items that have changed;
however, you can’t register anchored object queries for background delivery. For more
information, see HKAnchoredObjectQueryDescriptor
Statistics collection query. In addition to calculating the current snapshot of statistical
collections, this query can act as a long-running query. If something adds or removes matching
samples from the store, this query recalculates the statistics collections and updates your app
Long-running queries


## Page 7

You can’t register statistics collection queries for background delivery. For more information, se
HKStatisticsCollectionQueryDescriptor.
Activity summary query. In addition to calculating the current snapshot of the user’s activity
summary, this query can act as a long-running query. If the user’s activity summary data
changes, this query recalculates the activity summary and updates your app. You can’t registe
activity summary queries for background delivery. For more information, see HKActivity
SummaryQueryDescriptor.
Saving data to HealthKit
Create and share HealthKit samples.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.
See Also
Health data


## Page 8

Executing Observer Queries
Reading data from HealthKit
Use a HKHealthStore object to request permission to share or read HealthKit data. After you
have permission, you can use the HealthKit store to save new samples to the store, or to manage
the samples that your app saved. Additionally, you can use the HealthKit store to start, stop, and
manage queries.
For more information, see Setting up HealthKit.
func authorizationStatus(for: HKObjectType) -> HKAuthorizationStatus
Returns the app’s authorization status for sharing the specified data type.
Mentioned in
Overview
Topics
Accessing HealthKit
HealthKit / HKHealthStore
Class
HKHealthStore
The access point for all data managed by HealthKit.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.0+
macOS 13.0+
visionOS 1.0+
watchOS 2.0+


## Page 9

enum HKAuthorizationStatus
Constants indicating the authorization status for a particular data type.
func getRequestStatusForAuthorization(toShare: Set<HKSampleType>, read:
Set<HKObjectType>, completion: (HKAuthorizationRequestStatus, (any Erro
)?) -> Void)
Indicates whether the system presents the user with a permission sheet if your app requests
authorization for the provided types.
enum HKAuthorizationRequestStatus
Values that indicate whether your app needs to request authorization from the user.
class func isHealthDataAvailable() -> Bool
Returns a Boolean value that indicates whether HealthKit is available on this device.
func supportsHealthRecords() -> Bool
Returns a Boolean value that indicates whether the current device supports clinical records.
func requestAuthorization(toShare: Set<HKSampleType>?, read: Set<
HKObjectType>?, completion: (Bool, (any Error)?) -> Void)
Requests permission to save and read the specified data types.
func requestAuthorization(toShare: Set<HKSampleType>, read: Set<HKObjec
Type>) async throws
Asynchronously requests permission to save and read the specified data types.
func requestPerObjectReadAuthorization(for: HKObjectType, predicate:
NSPredicate?, completion: (Bool, (any Error)?) -> Void)
Asynchronously requests permission to read a data type that requires per-object authorizati
(such as vision prescriptions).
func handleAuthorizationForExtension(completion: (Bool, (any Error)?) -
Void)
Requests permission to save and read the data types specified by an extension.
var authorizationViewControllerPresenter: UIViewController?
The view controller that presents HealthKit authorization sheets.
func execute(HKQuery)
Starts executing the provided query.
Querying HealthKit data


## Page 10

func stop(HKQuery)
Stops a long-running query.
func biologicalSex() throws -> HKBiologicalSexObject
Reads someone’s biological sex from the HealthKit store.
func bloodType() throws -> HKBloodTypeObject
Reads the user’s blood type from the HealthKit store.
func dateOfBirth() throws -> Date
Reads the user’s date of birth from the HealthKit store as a date value.
Deprecated
func dateOfBirthComponents() throws -> DateComponents
Reads the user’s date of birth from the HealthKit store as date components.
func fitzpatrickSkinType() throws -> HKFitzpatrickSkinTypeObject
Reads the user’s Fitzpatrick Skin Type from the HealthKit store.
func wheelchairUse() throws -> HKWheelchairUseObject
Reads the user’s wheelchair use from the HealthKit store.
func delete(HKObject, withCompletion: (Bool, (any Error)?) -> Void)
Deletes the specified object from the HealthKit store.
func delete([HKObject], withCompletion: (Bool, (any Error)?) -> Void)
Deletes the specified objects from the HealthKit store.
func deleteObjects(of: HKObjectType, predicate: NSPredicate, with
Completion: (Bool, Int, (any Error)?) -> Void)
Deletes objects saved by this application that match the provided type and predicate.
func earliestPermittedSampleDate() -> Date
Returns the earliest date permitted for samples.
func save(HKObject, withCompletion: (Bool, (any Error)?) -> Void)
Saves the provided object to the HealthKit store.
Reading characteristic data
Working with HealthKit objects


## Page 11

func save([HKObject], withCompletion: (Bool, (any Error)?) -> Void)
Saves an array of objects to the HealthKit store.
func preferredUnits(for: Set<HKQuantityType>, completion: ([HKQuantity
Type : HKUnit], (any Error)?) -> Void)
Returns the user’s preferred units for the given quantity types.
static let HKUserPreferencesDidChange: NSNotification.Name
Notifies observers whenever the user changes his or her preferred units.
func enableBackgroundDelivery(for: HKObjectType, frequency: HKUpdate
Frequency, withCompletion: (Bool, (any Error)?) -> Void)
Enables the delivery of updates to an app running in the background.
com.apple.developer.healthkit.background-delivery
A Boolean value that indicates whether observer queries receive updates while running in th
background.
enum HKUpdateFrequency
Constants that determine how often the system launches your app in response to changes t
HealthKit data.
func disableBackgroundDelivery(for: HKObjectType, withCompletion: (Bool
(any Error)?) -> Void)
Disables background deliveries of update notifications for the specified data type.
func disableAllBackgroundDelivery(completion: (Bool, (any Error)?) ->
Void)
Disables all background deliveries of update notifications.
func splitTotalEnergy(HKQuantity, start: Date, end: Date, resultsHandle
: (HKQuantity?, HKQuantity?, (any Error)?) -> Void)
Calculates the active and resting energy burned based on the total energy burned over the
given duration.
Deprecated
Accessing the preferred units
Managing background delivery
Managing workouts


## Page 12

func recoverActiveWorkoutSession(completion: (HKWorkoutSession?, (any
Error)?) -> Void)
Recovers an active workout session.
var workoutSessionMirroringStartHandler: ((HKWorkoutSession) -> Void)?
A block that the system calls when it starts a mirrored workout session.
func startWatchApp(with: HKWorkoutConfiguration, completion: (Bool, (an
Error)?) -> Void)
Launches or wakes the companion watchOS app to create a new workout session.
func pause(HKWorkoutSession)
Pauses the provided workout session.
func resumeWorkoutSession(HKWorkoutSession)
Resumes the provided workout session.
func recalibrateEstimates(sampleType: HKSampleType, date: Date,
completion: (Bool, (any Error)?) -> Void)
Recalibrates the prediction algorithm used to calculate the specified sample type.
func activityMoveMode() throws -> HKActivityMoveModeObject
Returns the activity move mode for the current user.
static let HKUserPreferencesDidChange: NSNotification.Name
Notifies observers whenever the user changes his or her preferred units.
func add([HKSample], to: HKWorkout, completion: (Bool, (any Error)?) ->
Void)
Associates the provided samples with the specified workout.
Deprecated
Managing workout sessions
Managing estimates
Accessing the move mode
Deprecated symbols


## Page 13

func start(HKWorkoutSession)
Starts a workout session for the current app.
Deprecated
func end(HKWorkoutSession)
Ends a workout session for the current app.
Deprecated
func relateWorkoutEffortSample(HKSample, with: HKWorkout, activity:
HKWorkoutActivity?, completion: (Bool, (any Error)?) -> Void)
func unrelateWorkoutEffortSample(HKSample, from: HKWorkout, activity:
HKWorkoutActivity?, completion: (Bool, (any Error)?) -> Void)
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Health data


## Page 14

Saving data to HealthKit
Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.


## Page 15

Note
This sample code project is associated with WWDC20 session 10664: Getting Started in
HealthKit and WWDC20 session 10184: Synchronizing Your Health Data with HealthKit.
Before you run the sample code project in Xcode:
Download the latest version of Xcode with the iOS 14 SDK. The sample code project requires th
version of Xcode.
Confirm that CareKit is included as a dependency in Swift Packages.
Saving data to HealthKit
Overview
Configure the Sample Code Project
See Also
Health data
HealthKit / Creating a Mobility Health App
Sample Code
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility
data.
Download
iOS 14.0+
iPadOS 14.0+
Xcode 12.4+


## Page 16

Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.


## Page 17

HealthKit uses HKObjectType subclasses to identify the different types of data stored in
HealthKit, from inherent data that doesn’t typically change over time to complex data types that
combine multiple samples or compute values over sets of samples.
To create a type object, call the appropriate HKObjectType class method, and pass in the desire
type identifier.
You can use the resulting object types to request permission to access the data, save new data to
the HealthKit store, or read data from the HealthKit store.
class HKCharacteristicType
A type that represents data that doesn’t typically change over time.
class HKQuantityType
Overview
Topics
Object type subclasses
HealthKit / Data types
API Collection
Data types
Specify the kind of data used in HealthKit.


## Page 18

A type that identifies samples that store numerical values.
class HKCategoryType
A type that identifies samples that contain a value from a small set of possible values.
class HKCorrelationType
A type that identifies samples that group multiple subsamples.
class HKActivitySummaryType
A type that identifies activity summary objects.
class HKAudiogramSampleType
A type that identifies samples that contain audiogram data.
class HKElectrocardiogramType
A type that identifies samples containing electrocardiogram data.
class HKSeriesType
A type that indicates the data stored in a series sample.
class HKClinicalType
A type that identifies samples that contain clinical record data.
class HKWorkoutType
A type that identifies samples that store information about a workout.
class HKObjectType
An abstract superclass with subclasses that identify a specific type of data for the HealthKit
store.
class HKSampleType
An abstract superclass for all classes that identify a specific type of sample when working
with the HealthKit store.
static let activityMoveMode: HKCharacteristicTypeIdentifier
A characteristic identifier for the user’s activity mode.
static let biologicalSex: HKCharacteristicTypeIdentifier
A characteristic type identifier for the user’s sex.
static let bloodType: HKCharacteristicTypeIdentifier
Characteristic identifiers


## Page 19

A characteristic type identifier for the user’s blood type.
static let dateOfBirth: HKCharacteristicTypeIdentifier
A characteristic type identifier for the user’s date of birth.
static let fitzpatrickSkinType: HKCharacteristicTypeIdentifier
A characteristic type identifier for the user’s skin type.
static let wheelchairUse: HKCharacteristicTypeIdentifier
A characteristic identifier for the user’s use of a wheelchair.
static let stepCount: HKQuantityTypeIdentifier
A quantity sample type that measures the number of steps the user has taken.
static let distanceWalkingRunning: HKQuantityTypeIdentifier
A quantity sample type that measures the distance the user has moved by walking or runnin
static let runningSpeed: HKQuantityTypeIdentifier
A quantity sample type that measures the runner’s speed.
static let runningStrideLength: HKQuantityTypeIdentifier
A quantity sample type that measures the distance covered by a single step while running.
static let runningPower: HKQuantityTypeIdentifier
A quantity sample type that measures the rate of work required for the runner to maintain th
speed.
static let runningGroundContactTime: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of time the runner’s foot is in contact with
the ground while running.
static let runningVerticalOscillation: HKQuantityTypeIdentifier
A quantity sample type measuring pelvis vertical range of motion during a single running
stride.
static let distanceCycling: HKQuantityTypeIdentifier
A quantity sample type that measures the distance the user has moved by cycling.
static let pushCount: HKQuantityTypeIdentifier
A quantity sample type that measures the number of pushes that the user has performed
while using a wheelchair.
Activity


## Page 20

static let distanceWheelchair: HKQuantityTypeIdentifier
A quantity sample type that measures the distance the user has moved using a wheelchair.
static let swimmingStrokeCount: HKQuantityTypeIdentifier
A quantity sample type that measures the number of strokes performed while swimming.
static let distanceSwimming: HKQuantityTypeIdentifier
A quantity sample type that measures the distance the user has moved while swimming.
static let distanceDownhillSnowSports: HKQuantityTypeIdentifier
A quantity sample type that measures the distance the user has traveled while skiing or
snowboarding.
static let basalEnergyBurned: HKQuantityTypeIdentifier
A quantity sample type that measures the resting energy burned by the user.
static let activeEnergyBurned: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of active energy the user has burned.
static let flightsClimbed: HKQuantityTypeIdentifier
A quantity sample type that measures the number flights of stairs that the user has climbed.
static let nikeFuel: HKQuantityTypeIdentifier
A quantity sample type that measures the number of NikeFuel points the user has earned.
static let appleExerciseTime: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of time the user spent exercising.
static let appleMoveTime: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of time the user has spent performing
activities that involve full-body movements during the specified day.
static let appleStandHour: HKCategoryTypeIdentifier
A category sample type that counts the number of hours in the day during which the user ha
stood and moved for at least one minute per hour.
static let appleStandTime: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of time the user has spent standing.
static let vo2Max: HKQuantityTypeIdentifier
A quantity sample that measures the maximal oxygen consumption during exercise.
static let lowCardioFitnessEvent: HKCategoryTypeIdentifier


## Page 21

An event that indicates the user’s VO2 max values consistently fall below a particular aerobic
fitness threshold.
class HKAttachment
A file that is attached to a sample in the HealthKit store.
class HKAttachmentStore
The access point for attachments associated with samples in the HealthKit store.
class HKAttachmentDataReader
A reader that provides access to an attachment’s data.
static let height: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s height.
static let bodyMass: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s weight.
static let bodyMassIndex: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s body mass index.
static let leanBodyMass: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s lean body mass.
static let bodyFatPercentage: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s body fat percentage.
static let waistCircumference: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s waist circumference.
static let menstrualFlow: HKCategoryTypeIdentifier
A category sample type that records menstrual cycles.
static let intermenstrualBleeding: HKCategoryTypeIdentifier
A category sample type that records spotting outside the normal menstruation period.
Attachments
Body measurements
Reproductive health


## Page 22

static let infrequentMenstrualCycles: HKCategoryTypeIdentifier
A category sample that indicates an infrequent menstrual cycle.
static let irregularMenstrualCycles: HKCategoryTypeIdentifier
A category sample that indicates an irregular menstrual cycle.
static let persistentIntermenstrualBleeding: HKCategoryTypeIdentifier
A category sample that indicates persistent intermenstrual bleeding.
static let prolongedMenstrualPeriods: HKCategoryTypeIdentifier
A category sample that indicates a prolonged menstrual cycle.
static let basalBodyTemperature: HKQuantityTypeIdentifier
A quantity sample type that records the user’s basal body temperature.
static let cervicalMucusQuality: HKCategoryTypeIdentifier
A category sample type that records the quality of the user’s cervical mucus.
static let ovulationTestResult: HKCategoryTypeIdentifier
A category sample type that records the result of an ovulation home test.
static let progesteroneTestResult: HKCategoryTypeIdentifier
A category type that represents the results from a home progesterone test.
static let sexualActivity: HKCategoryTypeIdentifier
A category sample type that records sexual activity.
static let contraceptive: HKCategoryTypeIdentifier
A category sample type that records the use of contraceptives.
static let pregnancy: HKCategoryTypeIdentifier
A category type that records pregnancy.
static let pregnancyTestResult: HKCategoryTypeIdentifier
A category type that represents the results from a home pregnancy test.
static let lactation: HKCategoryTypeIdentifier
A category type that records lactation.
static let environmentalAudioExposure: HKQuantityTypeIdentifier
A quantity sample type that measures audio exposure to sounds in the environment.
Hearing


## Page 23

static let headphoneAudioExposure: HKQuantityTypeIdentifier
A quantity sample type that measures audio exposure from headphones.
static let environmentalAudioExposureEvent: HKCategoryTypeIdentifier
A category sample type that records exposure to potentially damaging sounds from the
environment.
static let headphoneAudioExposureEvent: HKCategoryTypeIdentifier
A category sample type that records exposure to potentially damaging sounds from
headphones.
static let audioExposureEvent: HKCategoryTypeIdentifier
A category sample type for audio exposure events.
Deprecated
static let heartRate: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s heart rate.
static let lowHeartRateEvent: HKCategoryTypeIdentifier
A category sample type for low heart rate events.
static let highHeartRateEvent: HKCategoryTypeIdentifier
A category sample type for high heart rate events.
static let irregularHeartRhythmEvent: HKCategoryTypeIdentifier
A category sample type for irregular heart rhythm events.
static let restingHeartRate: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s resting heart rate.
static let heartRateVariabilitySDNN: HKQuantityTypeIdentifier
A quantity sample type that measures the standard deviation of heartbeat intervals.
static let heartRateRecoveryOneMinute: HKQuantityTypeIdentifier
A quantity sample that records the reduction in heart rate from the peak exercise rate to the
rate one minute after exercising ended.
static let atrialFibrillationBurden: HKQuantityTypeIdentifier
A quantity type that measures an estimate of the percentage of time a person’s heart shows
signs of atrial fibrillation (AFib) while wearing Apple Watch.
Vital signs


## Page 24

static let walkingHeartRateAverage: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s heart rate while walking.
let HKDataTypeIdentifierHeartbeatSeries: String
A series sample containing heartbeat data.
class HKElectrocardiogramType
A type that identifies samples containing electrocardiogram data.
static let oxygenSaturation: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s oxygen saturation.
static let bodyTemperature: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s body temperature.
static let bloodPressure: HKCorrelationTypeIdentifier
A correlation sample that combines a systolic sample and a diastolic sample into a single
blood pressure reading.
static let bloodPressureSystolic: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s systolic blood pressure.
static let bloodPressureDiastolic: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s diastolic blood pressure.
static let respiratoryRate: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s respiratory rate.
Nutrition Type Identifiers
Type identifiers used for tracking diet and nutrition.
static let bloodAlcoholContent: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s blood alcohol content.
static let numberOfAlcoholicBeverages: HKQuantityTypeIdentifier
A quantity sample type that measures the number of standard alcoholic drinks that the user
has consumed.
Nutrition
Alcohol consumption


## Page 25

static let appleWalkingSteadiness: HKQuantityTypeIdentifier
A quantity sample type that measures the steadiness of the user’s gait.
static let appleWalkingSteadinessEvent: HKCategoryTypeIdentifier
A category sample type that records an incident where the user showed a reduced score for
their gait’s steadiness.
static let sixMinuteWalkTestDistance: HKQuantityTypeIdentifier
A quantity sample type that stores the distance a user can walk during a six-minute walk tes
static let walkingSpeed: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s average speed when walking steadily over
flat ground.
static let walkingStepLength: HKQuantityTypeIdentifier
A quantity sample type that measures the average length of the user’s step when walking
steadily over flat ground.
static let walkingAsymmetryPercentage: HKQuantityTypeIdentifier
A quantity sample type that measures the percentage of steps in which one foot moves at a
different speed than the other when walking on flat ground.
static let walkingDoubleSupportPercentage: HKQuantityTypeIdentifier
A quantity sample type that measures the percentage of time when both of the user’s feet
touch the ground while walking steadily over flat ground.
static let stairAscentSpeed: HKQuantityTypeIdentifier
A quantity sample type measuring the user’s speed while climbing a flight of stairs.
static let stairDescentSpeed: HKQuantityTypeIdentifier
A quantity sample type measuring the user’s speed while descending a flight of stairs.
Symptom Type Identifiers
Identifiers for medical symptoms.
Mobility
Symptoms
Lab and test results


## Page 26

static let bloodAlcoholContent: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s blood alcohol content.
static let bloodGlucose: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s blood glucose level.
static let electrodermalActivity: HKQuantityTypeIdentifier
A quantity sample type that measures electrodermal activity.
static let forcedExpiratoryVolume1: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of air that can be forcibly exhaled from the
lungs during the first second of a forced exhalation.
static let forcedVitalCapacity: HKQuantityTypeIdentifier
A quantity sample type that measures the amount of air that can be forcibly exhaled from the
lungs after taking the deepest breath possible.
static let inhalerUsage: HKQuantityTypeIdentifier
A quantity sample type that measures the number of puffs the user takes from their inhaler.
static let insulinDelivery: HKQuantityTypeIdentifier
A quantity sample that measures the amount of insulin delivered.
static let numberOfTimesFallen: HKQuantityTypeIdentifier
A quantity sample type that measures the number of times the user fell.
static let peakExpiratoryFlowRate: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s maximum flow rate generated during a
forceful exhalation.
static let peripheralPerfusionIndex: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s peripheral perfusion index.
static let mindfulSession: HKCategoryTypeIdentifier
A category sample type for recording a mindful session.
static let sleepAnalysis: HKCategoryTypeIdentifier
A category sample type for sleep analysis information.
static let appleSleepingWristTemperature: HKQuantityTypeIdentifier
A quantity sample type that records the wrist temperature during sleep.
Mindfulness and sleep


## Page 27

enum HKAppleSleepingBreathingDisturbancesClassification
static let toothbrushingEvent: HKCategoryTypeIdentifier
A category sample type for toothbrushing events.
static let handwashingEvent: HKCategoryTypeIdentifier
A category sample type for handwashing events.
let HKWorkoutTypeIdentifier: String
The workout type identifier.
let HKWorkoutRouteTypeIdentifier: String
A series sample containing location data that defines the route the user took during a worko
struct HKClinicalTypeIdentifier
A type identifier for the different categories of clinical records.
static let uvExposure: HKQuantityTypeIdentifier
A quantity sample type that measures the user’s exposure to UV radiation.
let HKVisionPrescriptionTypeIdentifier: String
A type identifier for vision prescription samples.
static let underwaterDepth: HKQuantityTypeIdentifier
A quantity sample that records a person’s depth underwater.
static let waterTemperature: HKQuantityTypeIdentifier
A quantity sample that records the water temperature.
Self care
Workouts
Clinical records
UV exposure
Vision
Diving


## Page 28

struct BufferedAsyncByteIterator
An asynchronous iterator for byte data.
Saving data to HealthKit
Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Samples
Create and save health and fitness samples.
Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.
Utilities
See Also
Health data


## Page 29

The HealthKit store saves most health and fitness data using HKSample subclasses. All sample
subclasses record information at a specified time. If the sample’s startDate and endDate
properties are the same, the sample represents a point in time. If the endDate is after the start
Date, the sample represents a time interval.
HealthKit uses different HKSample subclasses to store different types of data:
HKQuantitySample objects store quantities—a numerical value and units. Most HealthKit da
types use quantity samples. For example, height, heart rate, and dietary energy consumed all
use quantity samples.
HKCategorySample objects store a single option selected from a short list. For example,
category samples record sleep data (the user can be in bed, asleep, or awake).
HKCorrelation samples combine two or more samples into a single value. For example,
correlation samples represent food intake and blood pressure samples. A food sample contains
any number of nutrition samples, while a blood pressure sample contains both a systolic and a
diastolic sample.
HealthKit represents specialized data types with sample subclasses such as HKCDADocument
Sample, HKWorkoutRoute, and HKWorkout.
Saving data to HealthKit
Overview
Topics
Essentials
HealthKit / Samples
API Collection
Samples
Create and save health and fitness samples.


## Page 30

Create and share HealthKit samples.
Reading and Writing HealthKit Series Data
Share and read heartbeat and quantity series data using series builders and queries.
class HKCumulativeQuantitySample
A sample that represents a cumulative quantity.
class HKDiscreteQuantitySample
A sample that represents a discrete quantity.
class HKQuantitySample
A sample that represents a quantity, including the value and the units.
class HKCategorySample
A sample with values from a short list of possible values.
class HKCorrelation
A sample that groups multiple related samples into a single entry.
Units and quantities
Objects used to specify a quantity for a given unit, and to convert between units.
Metadata Keys
Constants used to add metadata to objects stored in HealthKit.
class HKQuantitySeriesSampleBuilder
A builder object for incrementally building a sample that contains multiple quantities.
class HKHeartbeatSeriesBuilder
A builder object for incrementally building a heartbeat series.
class HKHeartbeatSeriesSample
A sample that represents a series of heartbeats.
class HKElectrocardiogram
Basic samples
Series data
Electrocardiograms


## Page 31

A sample for electrocardiogram data.
class VoltageMeasurement
The voltage for all leads at a single point in time.
class HKAudiogramSample
A sample that stores an audiogram.
class HKAudiogramSensitivityPoint
A hearing sensitivity reading associated with a hearing test.
Accessing Health Records
Read clinical record data from the HealthKit store.
Accessing Sample Data in the Simulator
Set up sample accounts to build and test your app.
Accessing a User’s Clinical Records
Request authorization to query HealthKit for a user’s clinical records and display them in you
app.
Accessing Data from a SMART Health Card
Query for and validate a verifiable clinical record.
class HKClinicalRecord
A sample that stores a clinical record.
class HKFHIRResource
An object containing Fast Healthcare Interoperability Resources (FHIR) data.
class HKVerifiableClinicalRecord
A sample that represents the contents of a SMART Health Card or EU Digital COVID
Certificate.
class HKVerifiableClinicalRecordSubject
The subject associated with a signed clinical record.
class HKCDADocumentSample
Audiograms
Medical records


## Page 32

A Clinical Document Architecture (CDA) sample that stores a single document.
class HKDocumentSample
An abstract class that represents a health document in the HealthKit store.
static let CDA: HKDocumentTypeIdentifier
The CDA Document type identifier, used when requesting permission to read or share CDA
documents.
class HKDocumentType
A sample type used to create queries for documents.
class HKVisionPrescription
A sample that stores a vision prescription.
class HKGlassesPrescription
A sample that stores a prescription for glasses.
class HKContactsPrescription
A sample that store a prescription for contacts.
class HKGlassesLensSpecification
An object that contains the glasses prescription data for one eye.
class HKContactsLensSpecification
An object that contains the contacts prescription data for one eye.
class HKLensSpecification
An abstract superclass for lens specifications.
class HKVisionPrism
Prescription data for eye alignment.
class HKPrescriptionType
A type that identifies samples that store a prescription.
enum HKAppleWalkingSteadinessClassification
A classification of a score based on the steadiness of the user’s gait.
Vision prescriptions
Walking steadiness classifications


## Page 33

class HKAttachment
A file that is attached to a sample in the HealthKit store.
class HKAttachmentStore
The access point for attachments associated with samples in the HealthKit store.
class HKAttachmentDataReader
A reader that provides access to an attachment’s data.
Adding Digital Signatures
Cryptographically sign samples.
class HKQuantitySample
A sample that represents a quantity, including the value and the units.
class HKSample
A HealthKit sample represents a piece of data associated with a start and end time.
class HKObject
A piece of data that can be stored inside the HealthKit store.
class HKCumulativeQuantitySeriesSample
A sample representing a series of cumulative quantity values.
Deprecated
Attachments
Digital signatures
Abstract superclasses
Deprecated classes
See Also
Health data


## Page 34

Saving data to HealthKit
Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.


## Page 35

Use queries to read sample data from the HealthKit store. You can also use queries to list all the
sources for a particular data type, or to perform statistical calculations for a data type. For
example, statistical queries can calculate the minimum and maximum heart rate for a given week,
or the total step count for a given day.
You run a query by calling the HealthKit store’s execute(_:) method. HealthKit returns a
snapshot of the current results to the query’s results handler. Long-running queries continue to
monitor the HealthKit store, and return any relevant changes to the query’s update handler. To
return sorted or filtered results, give the query a sort descriptor or predicate.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
Running Queries with Swift Concurrency
Use Swift concurrency to manage one-shot and long-running queries.
protocol HKAsyncQuery
A protocol that defines an asynchronous method for running queries.
Overview
Topics
Essentials
Swift concurrency support
HealthKit / Queries
API Collection
Queries
Query health and fitness data.


## Page 36

protocol HKAsyncSequenceQuery
A protocol that defines a method for running queries that returns results using an
asynchronous sequence.
struct HKSamplePredicate
A predicate for queries that return a collection of matching sample objects.
struct HKSampleQueryDescriptor
A query interface that reads samples using Swift concurrency.
class HKSampleQuery
A general query that returns a snapshot of all the matching samples currently saved in the
HealthKit store.
class HKCorrelationQuery
A query that performs complex searches based on the correlation’s contents, and returns a
snapshot of all matching samples.
class HKQueryDescriptor
A descriptor that specifies a set of samples based on the data type and a predicate.
class HKQuery
An abstract class for all the query classes in HealthKit.
struct HKQuantitySeriesSampleQueryDescriptor
A query interface that reads the series data associated with quantity samples using Swift
concurrency.
class HKQuantitySeriesSampleQuery
A query that accesses the series data associated with a quantity sample.
struct HKWorkoutRouteQueryDescriptor
A query interface that reads the location data stored in a workout route using Swift
concurrency.
class HKWorkoutRouteQuery
A query to access the location data stored in a workout route.
Basic queries
Series queries


## Page 37

struct HKHeartbeatSeriesQueryDescriptor
A query interface that reads the heartbeat series data stored in a heartbeat sample using
Swift concurrency.
class HKHeartbeatSeriesQuery
A query that returns the heartbeat data contained in a heartbeat series sample.
struct HKElectrocardiogramQueryDescriptor
A query interface that reads the underlying voltage measurements for an electrocardiogram
sample using Swift concurrency.
class HKElectrocardiogramQuery
A query that returns the underlying voltage measurements for an electrocardiogram sample.
class HKWorkoutEffortRelationship
class HKWorkoutEffortRelationshipQuery
struct HKActivitySummaryQueryDescriptor
A query interface that reads activity summaries using Swift concurrency.
class HKActivitySummaryQuery
A query for reading activity summary objects from the HealthKit store.
struct HKAnchoredObjectQueryDescriptor
A query interface that runs anchored object queries using Swift concurrency.
class HKAnchoredObjectQuery
A query that returns changes to the HealthKit store, including a snapshot of new changes an
continuous monitoring as a long-running query.
class HKObserverQuery
A long-running query that monitors the HealthKit store and updates your app when the
HealthKit store saves or deletes a matching sample.
struct HKSourceQueryDescriptor
A query interface that uses Swift concurrency to read the apps and devices that produced th
matching samples.
Long-running queries
Sources and devices


## Page 38

class HKSourceRevision
An object indicating the source of a HealthKit sample.
class HKSource
An object indicating the app or device that created a HealthKit sample
class HKDevice
A device that generates data for HealthKit.
class HKSourceQuery
A query that returns a list of sources, such as apps and devices, that have saved matching
queries to the HealthKit store.
Executing Statistical Queries
Create and run statistical queries.
Executing Statistics Collection Queries
Calculate statistical data for graphs and charts.
struct HKStatisticsQueryDescriptor
A query descriptor that calculates the minimum, maximum, average, or sum over a set of
samples from the HealthKit store.
class HKStatisticsQuery
A query that performs statistical calculations over a set of matching quantity samples, and
returns the results.
struct HKStatisticsCollectionQueryDescriptor
A query descriptor that gathers a collection of statistics calculated over a series of fixed-
length time intervals.
class HKStatisticsCollectionQuery
A query that performs multiple statistics queries over a series of fixed-length time intervals.
class HKStatistics
An object that represents the result of calculating the minimum, maximum, average, or sum
over a set of samples from the HealthKit store.
class HKStatisticsCollection
An object that manages a collection of statistics, representing the results calculated over
separate time intervals.
Statistics


## Page 39

struct HKStatisticsOptions
Options for specifying the statistic to calculate.
struct HKVerifiableClinicalRecordQueryDescriptor
A query interface that provides one-time access to a SMART Health Card or EU Digital COVI
Certificate using Swift concurrency.
class HKVerifiableClinicalRecordQuery
A query for one-time access to a SMART Health Card or EU Digital COVID Certificate.
struct HKVerifiableClinicalRecordSourceType
The source type for the verifiable clinical record.
struct HKVerifiableClinicalRecordCredentialType
The type of record returned by a verifiable clinical record query.
class HKDocumentQuery
A query that returns a snapshot of all matching documents currently saved in the HealthKit
store.
class HKClinicalCoding
A clinical coding that represents a medical concept using a standardized coding system.
class HKHealthConceptIdentifier
A unique identifier for a specific health concept within a domain.
class HKMedicationConcept
An object that describes a specific medication concept.
class HKMedicationDoseEvent
class HKMedicationDoseEventType
class HKUserAnnotatedMedication
A reference to the tracked medication and the details a person can customize.
class HKUserAnnotatedMedicationQuery
class HKUserAnnotatedMedicationType
Clinical record queries
Medication queries


## Page 40

struct HKHealthConceptDomain
A domain that represents a health concept.
struct HKMedicationGeneralForm
The manufactured form of a medication.
struct HKUserAnnotatedMedicationQueryDescriptor
Saving data to HealthKit
Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.
See Also
Health data


## Page 41

Note
This sample code project is associated with WWDC24 session 10083: Get started with
HealthKit in visionOS and session 10109: Explore wellbeing APIs in HealthKit.
Before you run the sample code project:
1. Open the sample with the latest version of Xcode.
2. Set the developer team for the project target to let Xcode automatically manage the provisionin
profile. For more information, see Assign a project to a team.
Overview
Configure the sample code project
See Also
Health data
HealthKit / Visualizing HealthKit State of Mind in visionOS
Sample Code
Visualizing HealthKit State of Mind in
visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in
visionOS.
Download
iOS 18.1+
iPadOS 18.1+
visionOS 2.1+
Xcode 16.1+


## Page 42

Saving data to HealthKit
Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
Queries
Query health and fitness data.
Logging symptoms associated with a medication
Fetch medications and dose events from the HealthKit store, and create symptom samples t
associate with them.


## Page 43

Note
This sample code project is associated with WWDC25 session 321: Meet the HealthKit
Medications API.
Before you run the sample code project:
1. Open the sample with the latest version of Xcode.
2. Set the developer team for the project target to let Xcode automatically manage the provisionin
profile. For more information, see Set the bundle ID and Assign the project to a team.
To play with the sample app:
1. Launch the Health app on your iPhone, select the Browse tab, and tap Medications.
2. In the Medications view, add Acetaminophen 500 mg Oral Capsule, Carbinoxamine Maleate
Biphasic Release Oral Capsule (10 mg), or Ciprofloxacin Injection 200 mg/20 mL as a sample
medication. The sample app associates symptoms with these three medications using their
Overview
Configure the sample code project
HealthKit / Logging symptoms associated with a medication
Sample Code
Logging symptoms associated with a
medication
Fetch medications and dose events from the HealthKit store, and create symptom
samples to associate with them.
Download
iOS 26.0+
iPadOS 26.0+
Xcode 26.0+


## Page 44

RxNorm codes by mapping the codes to their symptoms in the SideEffects dictionary in
SideEffects.swift.
3. For each medication, log a dose as taken in the As Needed Medications section. The sample ap
forms a predicate to only look for doses marked as taken.
4. Build and run the sample app on the iPhone to see the medication list after providing
authorization. Tap a medication to see the most-recent dose event and associated symptoms.
When tapping a medication, an additional authorization sheet prompts for authorization to
access symptoms data.
5. To add more medications in the Health app and view them in the sample app, add their RxNorm
codes to the SideEffects dictionary, along with their associated symptoms. For instance, fo
piroxicam, the RxNorm code is 105929, and the symptoms can be headache, loss of appetite,
and nausea. To view the symptoms, modify SideEffects by adding the following code:
6. Log doses for medications over time, and observe them in the Charts tab of the sample app.
Saving data to HealthKit
Create and share HealthKit samples.
Reading data from HealthKit
Use queries to request sample data from HealthKit.
class HKHealthStore
The access point for all data managed by HealthKit.
Creating a Mobility Health App
Create a health app that allows a clinical care team to send and receive mobility data.
Data types
Specify the kind of data used in HealthKit.
Samples
Create and save health and fitness samples.
See Also
Health data


## Page 45

Queries
Query health and fitness data.
Visualizing HealthKit State of Mind in visionOS
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.


