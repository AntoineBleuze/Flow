# 000_MLJob.pdf

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


