# 001_MLTrainingSession.pdf

## Page 1

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


## Page 2

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


