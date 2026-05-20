# Model training Control.pdf

## Page 1

var checkpoints: AnyPublisher<MLCheckpoint, Never>
A publisher that sends a checkpoint for each of the session’s checkpoint intervals.
var result: AnyPublisher<Result, any Error>
A publisher that provides a result when the training session has finished.
var phase: AnyPublisher<MLPhase, Never>
Phase publisher.
func cancel()
Stops the training session’s execution.
var isCanceled: Bool
A Boolean value that indicates whether you canceled the job.
Topics
Receiving progress updates
Managing a job
Create ML / MLJob
Class
MLJob
The representation of a model’s asynchronous training session you use to monito
the session’s progress or terminate its execution.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 11.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

let startDate: Date
The date and time when the training session began.
let progress: Progress
The training session’s current progress.
struct MLProgress
A convenience type that exposes information about the progress of a training session.
Cancellable
class MLTrainingSession
The current state of a model’s asynchronous training session.
struct MLTrainingSessionParameters
The configuration settings for a training session.
struct MLCheckpoint
The state of a model’s asynchronous training session at a specific point in time during the
feature extraction or training phase.
Inspecting a job
Relationships
Conforms To
See Also
Model training Control


## Page 3

var phase: MLPhase
The training session’s current state.
enum MLPhase
The possible states of a training session.
var iteration: Int
The iteration number of a training session’s phase.
var checkpoints: [MLCheckpoint]
An array of checkpoints the training session has created so far.
func removeCheckpoints((MLCheckpoint) -> Bool) throws
Removes the checkpoints that satisfy your closure from the training session.
Topics
Checking a training session’s progress
Removing checkpoints
Reusing features from a previous session
Create ML / MLTrainingSession
Class
MLTrainingSession
The current state of a model’s asynchronous training session.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 11.0+
tvOS 16.0+
visionOS 1.0+


## Page 4

func reuseExtractedFeatures(from: MLTrainingSession<Task>) throws
Uses the features another session has already extracted from its dataset.
var date: Date
The time when you created this training session.
let parameters: MLTrainingSessionParameters
The parameters you used to create the training session.
Sendable, SendableMetatype
class MLJob
The representation of a model’s asynchronous training session you use to monitor the
session’s progress or terminate its execution.
struct MLTrainingSessionParameters
The configuration settings for a training session.
struct MLCheckpoint
The state of a model’s asynchronous training session at a specific point in time during the
feature extraction or training phase.
Inspecting a session
Relationships
Conforms To
See Also
Model training Control


## Page 5

init(sessionDirectory: URL?, reportInterval: Int, checkpointInterval:
Int, iterations: Int)
Creates a set of parameters for a training session.
let sessionDirectory: URL?
The location in the file system where the session stores its progress.
var reportInterval: Int
The number of iterations the session completes before it reports its progress.
var checkpointInterval: Int
The number of iterations the session completes before it saves a checkpoint.
var iterations: Int
The maximum number of iterations for the training session.
Topics
Creating a session’s parameters
Configuring the session’s parameters
Create ML / MLTrainingSessionParameters
Structure
MLTrainingSessionParameters
The configuration settings for a training session.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 11.0+
tvOS 16.0+
visionOS 1.0+


## Page 6

Sendable, SendableMetatype
class MLJob
The representation of a model’s asynchronous training session you use to monitor the
session’s progress or terminate its execution.
class MLTrainingSession
The current state of a model’s asynchronous training session.
struct MLCheckpoint
The state of a model’s asynchronous training session at a specific point in time during the
feature extraction or training phase.
Relationships
Conforms To
See Also
Model training Control


## Page 7

var phase: MLPhase
The training session’s phase when it created the checkpoint.
var iteration: Int
The iteration number of a training session’s phase when it created the checkpoint.
var date: Date
The time when the training session created the checkpoint.
var url: URL
The location of the checkpoint in the file system.
var metrics: [MLProgress.Metric : Any]
Measurements of the model’s performance at the time the session saved the checkpoint.
enum Metric
Topics
Inspecting a checkpoint
Assessing a checkpoint
Create ML / MLCheckpoint
Structure
MLCheckpoint
The state of a model’s asynchronous training session at a specific point in time
during the feature extraction or training phase.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 11.0+
tvOS 16.0+
visionOS 1.0+


## Page 8

Metrics you use to evaluate a model’s performance during a training session.
func encode(to: any Encoder) throws
Encodes the checkpoint into the encoder.
init(from: any Decoder) throws
Creates a new checkpoint by decoding from the decoder.
Decodable
Encodable
Sendable
SendableMetatype
class MLJob
The representation of a model’s asynchronous training session you use to monitor the
session’s progress or terminate its execution.
class MLTrainingSession
The current state of a model’s asynchronous training session.
struct MLTrainingSessionParameters
The configuration settings for a training session.
Encoding and decoding a checkpoint
Relationships
Conforms To
See Also
Model training Control


