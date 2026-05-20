# Feedback.pdf

## Page 1

Improving the safety of generative model output
LanguageModelFeedback is a namespace with structures for describing feedback in a
consistent way. LanguageModelFeedback.Sentiment describes the sentiment of the
feedback, while LanguageModelFeedback.Issue offers a standard template for issues.
Given a model session, use logFeedbackAttachment(sentiment:issues:desired
Output:) to produce structured feedback.
Mentioned in
Overview
Foundation Models / LanguageModelFeedback
Structure
LanguageModelFeedback
Feedback appropriate for logging or attaching to Feedback Assistant.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

struct Issue
An issue with the model’s response.
enum Sentiment
A sentiment regarding the model’s response.
func logFeedbackAttachment(sentiment: LanguageModelFeedback.Sentiment?,
issues: [LanguageModelFeedback.Issue], desiredOutput: Transcript.Entry?
-> Data
Logs and serializes data that includes session information that you attach when reporting
feedback to Apple.
Topics
Creating feedback


