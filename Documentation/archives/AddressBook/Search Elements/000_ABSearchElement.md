# 000_ABSearchElement.pdf

## Page 1

The ABSearchElement class is “toll-free bridged” with its procedural C opaque-type
counterpart. This means that the ABSearchElementRef type is interchangeable in function or
method calls with instances of the ABSearchElement class.
init!(forConjunction: ABSearchConjunction, children: [Any]!)
Returns a compound search element, created by combining the search elements in an array
with the given conjunction.
func matchesRecord(ABRecord!) -> Bool
Tests whether or not a record matches a search element.
Overview
Topics
Searching
Matching
Address Book / ABSearchElement
Class
ABSearchElement
An object you use to specify a search query for records in the Address Book
database.
macOS


## Page 2

typealias ABSearchConjunction
Constants used to create compound search elements.
typealias ABSearchComparison
Constants used to specify the type of comparison beingmade.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ABSearchElementRef
A reference to an ABSearchElement object.
Constants
Relationships
Inherits From
Conforms To
See Also
Search Elements


