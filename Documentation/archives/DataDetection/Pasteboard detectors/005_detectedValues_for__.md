# 005_detectedValues_for__.pdf

## Page 1

keyPaths
A set of key paths you use to indicate which types of values you want the data detection
system to match.
An object that contains the values the data detection system matches in the pasteboard.
Because this method gives the app access to the values it detects in the pasteboard, the system
notifies the user about reading the contents of the pasteboard.
Parameters
Return Value
Discussion
See Also
Detecting patterns of content in pasteboard items
UIKit / UIPasteboard / detectedValues(for:)
Instance Method
detectedValues(for:)
Requests that the data detection system asynchronously identify the types of
values that you specify for the pasteboard, and return the values that it matches.
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
func detectValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues>>
inItemSet: IndexSet?, completionHandler: (Result<[UIPasteboard.Detected
Values], any Error>) -> ())
Requests that the data detection system identify the types of data that you specify for the
pasteboard items, and provide the values that it matches to your closure.
func detectedValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues
>>, inItemSet: IndexSet?) async throws -> [UIPasteboard.DetectedValues]
Requests that the data detection system asynchronously identify the types of values that yo
specify for the pasteboard item, and return the values that it matches for each pasteboard.
struct DetectedValues


## Page 3

An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


