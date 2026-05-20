# 000_CFNetworkCopyProxiesForURL______.pdf

## Page 1

url
The URL your application intends to access.
proxySettings
A dictionary describing the available proxy settings. The dictionary should be in the format
returned by SystemConfiguration.framework. (See kCFStreamErrorDomainSyste
Configuration for more information.)
Returns an array of dictionaries. Each dictionary describes a single proxy. The array is ordered
optimally for requesting the URL specified.
In general, you should try to download a URL using the first proxy in the array, try the second prox
if the first one fails, and so on.
Parameters
Return Value
Discussion
CFNetwork / CFNetworkCopyProxiesForURL(_:_:)
Function
CFNetworkCopyProxiesForURL(_:_:)
Returns the list of proxies that should be used to download a given URL.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+


## Page 2

Every proxy dictionary has an entry for kCFProxyTypeKey. If the type is anything except k
CFProxyTypeAutoConfigurationURL, the dictionary also has entries for the proxy’s host and
port (under kCFProxyHostNameKey and kCFProxyPortNumberKey respectively). If the type 
kCFProxyTypeAutoConfigurationURL, it has an entry for kCFProxyAutoConfiguration
URLKey.
The keys for username and password are optional and are present only if the username or
password could be extracted from the information passed in (either from the URL itself or from th
proxy dictionary supplied). These APIs do not consult any external credential stores such as the
Keychain.
For more information, see CFNetwork Programming Guide.
func CFNetworkCopyProxiesForAutoConfigurationScript(CFString, CFURL,
UnsafeMutablePointer<Unmanaged<CFError>?>?) -> Unmanaged<CFArray>?
Executes a proxy autoconfiguration script to determine the best proxy to use to retrieve a
specified URL.
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
Proxy Types
See Also
Global Proxy Configuration


## Page 3

Constants that specify the type of proxy.
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


