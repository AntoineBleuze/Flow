# 001_detectedPatterns_for__.pdf

## Page 1

keyPaths
A set of key paths you use to indicate which types of patterns you want the data detection
system to match.
A set of key paths that represent the patterns the data detection system matches in the
pasteboard.
Because this method only gives an indication of whether a pasteboard item matches a particular
pattern and doesn’t allow the app to access the contents, the system doesn’t notify the user abou
reading the contents of the pasteboard.
Parameters
Return Value
Discussion
See Also
UIKit / UIPasteboard / detectedPatterns(for:)
Instance Method
detectedPatterns(for:)
Requests that the data detection system asynchronously identify the patterns tha
you specify for the pasteboard, and return the patterns that it matches.
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
func detectValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues>>
inItemSet: IndexSet?, completionHandler: (Result<[UIPasteboard.Detected
Values], any Error>) -> ())
Requests that the data detection system identify the types of data that you specify for the
pasteboard items, and provide the values that it matches to your closure.
func detectedValues(for: Set<PartialKeyPath<UIPasteboard.DetectedValues
>>, inItemSet: IndexSet?) async throws -> [UIPasteboard.DetectedValues]
Requests that the data detection system asynchronously identify the types of values that yo
specify for the pasteboard item, and return the values that it matches for each pasteboard.
Detecting patterns of content in pasteboard items


## Page 3

struct DetectedValues
An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


