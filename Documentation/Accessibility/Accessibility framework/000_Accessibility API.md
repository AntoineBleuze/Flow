# 000_Accessibility API.pdf

## Page 1

While many Apple frameworks provide built-in accessibility support, the Accessibility framework
defines API for supporting additional accessibility features across multiple platforms. The
Accessibility framework includes API that enable you to:
Respond to changes in Accessibility system settings
Post accessibility notifications
Define an accessible representation of your chart to support audio graphs
Interact with hardware such as braille displays and hearing devices
Generate a localized description of a color
struct AccessibilitySettings
A structure for working with accessibility system settings.
enum AccessibilityNotification
Types of accessibility notifications that an app can post.
Overview
Topics
System settings
Notifications
Accessibility / Accessibility API
API Collection
Accessibility API
Browse API in the Accessibility framework.


## Page 2

struct AccessibilityTechnology
static let automation: AccessibilityTechnology
static let fullKeyboardAccess: AccessibilityTechnology
static let hoverText: AccessibilityTechnology
static let speakScreen: AccessibilityTechnology
static let switchControl: AccessibilityTechnology
static let voiceControl: AccessibilityTechnology
static let voiceOver: AccessibilityTechnology
static let zoom: AccessibilityTechnology
class AccessibilityRequest
Customized accessibility content
Customize your apps to deliver accessibility information to your users in measured portions 
they need it.
Audio graphs
Define an accessible representation of your chart for VoiceOver to generate an audio graph.
Hearing device support
Access information about paired hearing aid devices and streaming status.
func AXNameFromColor(CGColor) -> String
Returns a localized description of the color to use in accessibility attributes.
Braille displays
Display a graphical representation of images, icons, data, and more on a two-dimensional
braille display.
class AXBrailleTable
A rule for translating print text to Braille, and back-translating Braille to print text.
Assistive technologies
Features
Braille


## Page 3

class AXBrailleTranslator
Translates print text to Braille and Braille to print text according to the given Braille table.
class AXBrailleTranslationResult
The result of translation or back-translation.
class AXMathExpressionNumber
class AXMathExpressionIdentifier
class AXMathExpressionOperator
class AXMathExpressionText
class AXMathExpressionFenced
class AXMathExpressionRow
class AXMathExpressionTable
class AXMathExpressionTableCell
class AXMathExpressionTableRow
class AXMathExpressionUnderOver
class AXMathExpressionSubSuperscript
class AXMathExpressionFraction
class AXMathExpressionMultiscript
class AXMathExpressionRoot
class AXMathExpression
protocol AXMathExpressionProvider
class AXFeatureOverrideSession
A token object that represents an override session held by your app.
class AXFeatureOverrideSessionManager
A manager class to begin and end accessibility feature override sessions. Multiple override
sessions are reconciled by combining the requests, preferring feature enablement. Ending a
Math expressions
Override sessions


## Page 4

sessions restores the prior state of Accessibility feature enablement. Your app must be
entitled with com.apple.developer.accessibility.merchant-api-control.
struct Options
Options indicating which Accessibility features will be turned on or off when an override
session is held by your app.
let AXFeatureOverrideSessionErrorDomain: String
struct AXFeatureOverrideSessionError
enum Code
com.apple.developer.accessibility.merchant-api-control
func AXAnimatedImagesEnabled() -> Bool
Returns a Boolean value that indicates whether the system setting for Animated Images is on
Deprecated
func AXPrefersHeadAnchorAlternative() -> Bool
Returns a Boolean value that indicates the person’s preference for content that follows their
head position.
Deprecated
func AXPrefersHorizontalTextLayout() -> Bool
Returns a Boolean value that indicates whether the system setting for Prefer Horizontal Text 
on.
Deprecated
Deprecated


