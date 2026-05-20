# 005_CPVoiceControlTemplate.pdf

## Page 1

CarPlay navigation apps must show a voice control indicator during audio input by presenting a
voice control template. When creating the template, provide one or more CPVoiceControlStat
objects. To switch between states, call the activateVoiceControlState(with
Identifier:) method.
init(voiceControlStates: [CPVoiceControlState])
Creates a voice control template with a list of voice control states.
class CPVoiceControlState
A voice control state containing title variants and images for use by a voice control template
func activateVoiceControlState(withIdentifier: String)
Overview
Topics
Creating a Voice Control Template
Activating a State
CarPlay / CPVoiceControlTemplate
Class
CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

Changes the template’s state to the one matching the specified identifier.
var activeStateIdentifier: String?
The identifier of the template’s current voice control state.
var voiceControlStates: [CPVoiceControlState]
The array of voice control states available to the template.
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Integrating CarPlay with Your Navigation App
Configure your navigation app to work with CarPlay by displaying your custom map and
directions.
Getting Available States
Relationships
Inherits From
Conforms To
See Also
Navigation


## Page 3

class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPSearchTemplate
A template that provides the ability to search for a destination and see a list of search results


