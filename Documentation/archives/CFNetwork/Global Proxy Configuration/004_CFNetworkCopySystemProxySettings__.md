# 004_CFNetworkCopySystemProxySettings__.pdf

## Page 1

The dictionary returned contains key-value pairs that represent the current internet proxy setting
The keys in this dictionary are defined in Global Proxy Settings Constants.
The caller is responsible for releasing the returned dictionary.
func CFNetworkCopyProxiesForURL(CFURL, CFDictionary) -> Unmanaged<
CFArray>
Returns the list of proxies that should be used to download a given URL.
func CFNetworkCopyProxiesForAutoConfigurationScript(CFString, CFURL,
UnsafeMutablePointer<Unmanaged<CFError>?>?) -> Unmanaged<CFArray>?
Executes a proxy autoconfiguration script to determine the best proxy to use to retrieve a
specified URL.
Discussion
See Also
Global Proxy Configuration
CFNetwork / CFNetworkCopySystemProxySettings()
Function
CFNetworkCopySystemProxySettings()
Returns a CFDictionary containing the current systemwide internet proxy settings
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+


## Page 2

func CFNetworkExecuteProxyAutoConfigurationScript(CFString, CFURL,
CFProxyAutoConfigurationResultCallback, UnsafeMutablePointer<CFStream
ClientContext>) -> CFRunLoopSource
Downloads a proxy autoconfiguration script and executes it.
func CFNetworkExecuteProxyAutoConfigurationURL(CFURL, CFURL, CFProxyAut
ConfigurationResultCallback, UnsafeMutablePointer<CFStreamClientContext
>) -> CFRunLoopSource
Downloads a proxy autoconfiguration script and executes it.
typealias CFProxyAutoConfigurationResultCallback
Callback function called when a proxy autoconfiguration computation has completed.
Property Keys
Keys for calls to property get/set functions such as CFReadStreamSetProperty(_:_:_
and CFReadStreamCopyProperty(_:_:).
Proxy Types
Constants that specify the type of proxy.
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


