# 001_CFNetworkCopyProxiesForAutoConfigurationScript________.pdf

## Page 1

proxyAutoConfigurationScript
A CFString containing the code of the autoconfiguration script to execute.
targetURL
The URL your application intends to access.
error
The address of an error object reference that is overwritten on return if an error occurs.
Returns an array of dictionaries. Each dictionary describes a single proxy. The array is ordered
optimally for requesting the URL specified.
Parameters
Return Value
CFNetwork / CFNetworkCopyProxiesForAutoConfigurationScript(_:_:_:)
Function
CFNetworkCopyProxiesForAuto
ConfigurationScript(_:_:_:)
Executes a proxy autoconfiguration script to determine the best proxy to use to
retrieve a specified URL.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+


## Page 2

In general, you should try to download a URL using the first proxy in the array, try the second prox
if the first one fails, and so on.
Every proxy dictionary has an entry for kCFProxyTypeKey. If the type is anything except k
CFProxyTypeAutoConfigurationURL, the dictionary also has entries for the proxy’s host and
port (under kCFProxyHostNameKey and kCFProxyPortNumberKey respectively). If the type 
kCFProxyTypeAutoConfigurationURL, it has an entry for kCFProxyAutoConfiguration
URLKey.
The keys for username and password are optional and are present only if the username or
password could be extracted from the information passed in (either from the URL itself or from th
proxy dictionary supplied). These APIs do not consult any external credential stores such as the
Keychain.
func CFNetworkCopyProxiesForURL(CFURL, CFDictionary) -> Unmanaged<
CFArray>
Returns the list of proxies that should be used to download a given URL.
func CFNetworkExecuteProxyAutoConfigurationScript(CFString, CFURL,
CFProxyAutoConfigurationResultCallback, UnsafeMutablePointer<CFStream
ClientContext>) -> CFRunLoopSource
Downloads a proxy autoconfiguration script and executes it.
func CFNetworkExecuteProxyAutoConfigurationURL(CFURL, CFURL, CFProxyAut
ConfigurationResultCallback, UnsafeMutablePointer<CFStreamClientContext
>) -> CFRunLoopSource
Downloads a proxy autoconfiguration script and executes it.
func CFNetworkCopySystemProxySettings() -> Unmanaged<CFDictionary>?
Returns a CFDictionary containing the current systemwide internet proxy settings.
typealias CFProxyAutoConfigurationResultCallback
Callback function called when a proxy autoconfiguration computation has completed.
Property Keys
Keys for calls to property get/set functions such as CFReadStreamSetProperty(_:_:_
and CFReadStreamCopyProperty(_:_:).
Discussion
See Also
Global Proxy Configuration


## Page 3

Proxy Types
Constants that specify the type of proxy.
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


