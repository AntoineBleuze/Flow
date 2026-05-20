# 005_ENAPIVersion.pdf

## Page 1

Type
Number
1
Use version 1 of the API.
2
Use version 2 of the API.
Default: 1
Important
This type is available in iOS 12.5, and in iOS 13.7 and later.
iOS 13.7 introduces a new method to calculate the user’s Exposure Risk Value, described in
ENExposureConfiguration. Set this value to 2 to use this new version and its calculation
Details
Possible Values
Attributes
Discussion
Bundle Resources / Information Property List / ENAPIVersion
Property List Key
ENAPIVersion
A number that specifies the version of the API to use.
iOS 13.7+
iPadOS 13.7+


## Page 2

method, or set this value to 1 to use the earlier API and its calculation method. If you don’t explici
set this value, the default is 1.
ENDeveloperRegion
A string that specifies the region that the app supports.
See Also
Exposure notification


