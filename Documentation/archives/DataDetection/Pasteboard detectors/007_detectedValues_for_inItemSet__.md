# 007_detectedValues_for_inItemSet__.pdf

## Page 1

keyPaths
A set of key paths you use to indicate which types of values you want the data detection
system to match.
itemSet
A set of indexes you provide to indicate which pasteboard items the data detection system
inspects to detect values.
An array of objects that contain the values the data detection system matches in each pasteboard
item.
Because this method gives the app access to the values it detects in a pasteboard item, the syste
notifies the user about reading the contents of the pasteboard.
Parameters
Return Value
Discussion
UIKit / UIPasteboard / detectedValues(for:inItemSet:)
Instance Method
detectedValues(for:inItemSet:)
Requests that the data detection system asynchronously identify the types of
values that you specify for the pasteboard item, and return the values that it
matches for each pasteboard.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
visionOS


## Page 2

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

func detectValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues>>
inItemSet: IndexSet?, completionHandler: (Result<[UIPasteboard.Detected
Values], any Error>) -> ())
Requests that the data detection system identify the types of data that you specify for the
pasteboard items, and provide the values that it matches to your closure.
struct DetectedValues
An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


