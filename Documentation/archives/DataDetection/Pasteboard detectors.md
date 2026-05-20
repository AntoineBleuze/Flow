# Pasteboard detectors.pdf

## Page 1

keyPaths
A set of key paths you use to indicate which types of patterns you want the data detection
system to match.
completionHandler
A closure you provide to process patterns the data detection system matches, or to handle
errors.
Because this method only gives an indication of whether a pasteboard item matches a particular
pattern and doesn’t allow the app to access the contents, the system doesn’t notify the user abou
reading the contents of the pasteboard.
Parameters
Discussion
See Also
UIKit / UIPasteboard / detectPatterns(for:completionHandler:)
Instance Method
detectPatterns(for:completionHandler:)
Requests that the data detection system identify the patterns that you specify for
the pasteboard, and provide the patterns that it matches to your closure.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
visionOS


## Page 2

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


## Page 4

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


## Page 5

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


## Page 6

struct DetectedValues
An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


## Page 7

keyPaths
A set of key paths you use to indicate which types of patterns you want the data detection
system to match.
itemSet
A set of indexes you provide to indicate which pasteboard items the data detection system
inspects to detect patterns.
completionHandler
A closure you provide to process patterns the data detection system matches, or to handle
errors.
Parameters
Discussion
UIKit / UIPasteboard / detectPatterns(for:inItemSet:completionHandler:)
Instance Method
detectPatterns(for:inItemSet:completion
Handler:)
Requests that the data detection system identify the patterns that you specify for
the pasteboard items, and provide the patterns that it matches to your closure.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
visionOS


## Page 8

Because this method only gives an indication of whether a pasteboard item matches a particular
pattern and doesn’t allow the app to access the contents, the system doesn’t notify the user abou
reading the contents of the pasteboard.
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
See Also
Detecting patterns of content in pasteboard items


## Page 9

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


## Page 10

keyPaths
A set of key paths you use to indicate which types of pattern you want the data detection
system to match.
itemSet
A set of indexes you provide to indicate which pasteboard items the data detection system
inspects to detect patterns.
A set of key paths that represent the patterns the data detection system matches in the
pasteboard.
Because this method only gives an indication of whether a pasteboard item matches a particular
pattern and doesn’t allow the app to access the contents, the system doesn’t notify the user abou
reading the contents of the pasteboard.
Parameters
Return Value
Discussion
UIKit / UIPasteboard / detectedPatterns(for:inItemSet:)
Instance Method
detectedPatterns(for:inItemSet:)
Requests that the data detection system asynchronously identify the patterns tha
you specify for the pasteboard items, and return the patterns that it matches.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
visionOS


## Page 11

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
See Also
Detecting patterns of content in pasteboard items


## Page 12

Requests that the data detection system asynchronously identify the types of values that yo
specify for the pasteboard item, and return the values that it matches for each pasteboard.
struct DetectedValues
An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


## Page 13

keyPaths
A set of key paths you use to indicate which types of data you want the data detection system
to match.
completionHandler
A closure you provide to process data the data detection system matches, or to handle errors
Because this method gives the app access to the values it detects in the pasteboard, the system
notifies the user about reading the contents of the pasteboard.
Parameters
Discussion
See Also
UIKit / UIPasteboard / detectValues(for:completionHandler:)
Instance Method
detectValues(for:completionHandler:)
Requests that the data detection system identify the types of data that you speci
for the pasteboard, and provide the values that it matches to your closure.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
visionOS


## Page 14

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


## Page 15

struct DetectedValues
An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


## Page 16

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


## Page 17

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


## Page 18

An object that contains common types of data that the data detection system matches for a
pasteboard.
struct DetectionPattern
An object that represents a pattern to detect for the pasteboard, such as a URL, text, or a
number.


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


