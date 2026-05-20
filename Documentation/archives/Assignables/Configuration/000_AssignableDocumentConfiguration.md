# 000_AssignableDocumentConfiguration.pdf

## Page 1

var maxScore: Double?
An optional maximum score for this assessment. If nil, this value will be synthesized from t
question data and associated annotations.
Required
var correctScoreMarkType: AssignableDocument.CorrectMarkType
The glyph to use for a correct score mark in the assessment.
Required
var pointsPerBonusScoreMark: Double
The value of each bonus score mark in the assessment.
Required
var pointsPerCorrectScoreMark: Double
The value of each correct score mark in the assessment.
Required
var pointsPerIncorrectScoreMark: Double
The value of each incorrect score mark in the assessment.
Topics
Configuring a document
Assignables / AssignableDocumentConfiguration
Protocol
AssignableDocumentConfiguration
A type that specifies the options for an assignable document.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

Required
Equatable, Hashable
protocol AssignedWorkDocumentConfiguration
A type that specifies the score of a document.
Relationships
Inherits From
See Also
Configuration


