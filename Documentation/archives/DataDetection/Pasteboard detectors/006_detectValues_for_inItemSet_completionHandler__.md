# 006_detectValues_for_inItemSet_completionHandler__.pdf

## Page 1

keyPaths
A set of key paths you use to indicate which types of data you want the data detection system
to match.
itemSet
A set of indexes you provide to indicate which pasteboard items the data detection system
inspects to detect values.
completionHandler
A closure you provide to process values the data detection system matches, or to handle
errors.
Parameters
Discussion
UIKit / UIPasteboard / detectValues(for:inItemSet:completionHandler:)
Instance Method
detectValues(for:inItemSet:completion
Handler:)
Requests that the data detection system identify the types of data that you speci
for the pasteboard items, and provide the values that it matches to your closure.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
visionOS


## Page 2

Because this method gives the app access to the values it detects in a pasteboard item, the syste
notifies the user about reading the contents of the pasteboard.
func detectPatterns(for: Set<PartialKeyPath<UIPasteboard.DetectedValues
>>, completionHandler: (Result<Set<PartialKeyPath<UIPasteboard.Detected
Values>>, any Error>) -> ())
Requests that the data detection system identify the patterns that you specify for the
pasteboard, and provide the patterns that it matches to your closure.
func detectedPatterns(for: Set<PartialKeyPath<UIPasteboard.Detected
Values>>) async throws -> Set<PartialKeyPath<UIPasteboard.DetectedValue
>>
Requests that the data detection system asynchronously identify the patterns that you spec
for the pasteboard, and return the patterns that it matches.
func detectPatterns(for: Set<PartialKeyPath<UIPasteboard.DetectedValues
>>, inItemSet: IndexSet?, completionHandler: (Result<[Set<PartialKeyPat
<UIPasteboard.DetectedValues>>], any Error>) -> ())
Requests that the data detection system identify the patterns that you specify for the
pasteboard items, and provide the patterns that it matches to your closure.
func detectedPatterns(for: Set<PartialKeyPath<UIPasteboard.Detected
Values>>, inItemSet: IndexSet?) async throws -> [Set<PartialKeyPath<
UIPasteboard.DetectedValues>>]
Requests that the data detection system asynchronously identify the patterns that you spec
for the pasteboard items, and return the patterns that it matches.
func detectValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues>>
completionHandler: (Result<UIPasteboard.DetectedValues, any Error>) ->
())
Requests that the data detection system identify the types of data that you specify for the
pasteboard, and provide the values that it matches to your closure.
func detectedValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues
>>) async throws -> UIPasteboard.DetectedValues
Requests that the data detection system asynchronously identify the types of values that yo
specify for the pasteboard, and return the values that it matches.
See Also
Detecting patterns of content in pasteboard items


## Page 3

func detectedValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues
>>, inItemSet: IndexSet?) async throws -> [UIPasteboard.DetectedValues]
Requests that the data detection system asynchronously identify the types of values that yo
specify for the pasteboard item, and return the values that it matches for each pasteboard.
struct DetectedValues
An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


