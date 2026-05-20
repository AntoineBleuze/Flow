# 000_Integrating CarPlay with Your Navigation App.pdf

## Page 1

Coastal Roads is a sample navigation app that demonstrates how to display a custom map and
navigation instructions in a CarPlay–enabled vehicle. Coastal Roads integrates with the CarPlay
framework by implementing the map and additional CPTemplate subclasses, such as CPGrid
Template and CPListTemplate. This sample’s iOS app component provides a logging interfac
to help you understand the life cycle of a CarPlay app.
After the app connects to CarPlay, it immediately sets a root template to display content onscreen
The sample sets the root template on the CPInterfaceController when the app connects to
CarPlay. In all navigation apps, the root template must be an instance of CPMapTemplate and
contain no additional graphics or UI elements.
The following code shows an example implementation of setting a root template:
Overview
Handle Communication with CarPlay
CarPlay / Integrating CarPlay with Your Navigation App
Sample Code
Integrating CarPlay with Your Navigation
App
Configure your navigation app to work with CarPlay by displaying your custom
map and directions.
Download
iOS 15.4+
Xcode 15.0+


## Page 2

Coastal Roads demonstrates various templates in CarPlay. The sample includes an image to serve
as the map. All overlays must be a type of template that CarPlay provides. The map must cover th
entire screen, which the sample accomplishes using constraints. The CPMapTemplate also
provides native support for zooming and panning. Additional functionality, such as customizing
default button behavior, is available.
The following code shows an example implementation of customizing the default behavior of the
panning, preview, and trip start actions on CPMapTemplate:
Render a Map as the Base Template


## Page 3

See CPMapTemplateDelegate for more information.
class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPSearchTemplate
A template that provides the ability to search for a destination and see a list of search results
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.
See Also
Navigation


