# 000_CWEventDelegate.pdf

## Page 1

An object that adopts the CWEventDelegate protocol and that is assigned as the delegate of a
CWWiFiClient object receives notifications of changes on a Wi-Fi interface. Use the start
MonitoringEvent(with:) method to indicate to the client the event types for which you wan
to receive notifications. Use the stopMonitoringEvent(with:) method to stop receiving a
particular notification type, or the stopMonitoringAllEvents() method to stop receiving all
notifications.
func bssidDidChangeForWiFiInterface(withName: String)
Tells the delegate that the current BSSID has changed.
func clientConnectionInterrupted()
Tells the delegate that the connection to the Wi-Fi subsystem is temporarily interrupted.
func clientConnectionInvalidated()
Tells the delegate that the connection to the Wi-Fi subsystem is permanently invalidated.
Overview
Topics
Instance Methods
Core WLAN / CWEventDelegate
Protocol
CWEventDelegate
The interface a Wi-Fi client object uses to notify its delegate about Wi-Fi events.
Mac Catalyst 13.0+
macOS 10.6+


## Page 2

func countryCodeDidChangeForWiFiInterface(withName: String)
Tells the delegate that the currently adopted country code has changed.
func linkDidChangeForWiFiInterface(withName: String)
Tells the delegate that the Wi-Fi link state changed.
func linkQualityDidChangeForWiFiInterface(withName: String, rssi: Int,
transmitRate: Double)
Tells the delegate that the link quality has changed.
func modeDidChangeForWiFiInterface(withName: String)
Tells the delegate that the operating mode has changed.
func powerStateDidChangeForWiFiInterface(withName: String)
Tells the delegate that the Wi-Fi power state changed.
func scanCacheUpdatedForWiFiInterface(withName: String)
Tells the delegate that the Wi-Fi interface’s scan cache has been updated with new results.
func ssidDidChangeForWiFiInterface(withName: String)
Tells the delegate that the current SSID has changed.


