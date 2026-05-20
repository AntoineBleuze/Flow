# 006_Queries.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


