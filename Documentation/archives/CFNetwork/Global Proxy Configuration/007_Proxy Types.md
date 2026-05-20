# 007_Proxy Types.pdf

## Page 1

let kCFProxyTypeNone: CFString
Specifies that no proxy should be used.
let kCFProxyTypeAutoConfigurationURL: CFString
Specifies that the proxy is determined by an autoconfiguration file at a given URL.
let kCFProxyTypeAutoConfigurationJavaScript: CFString
Specifies that the proxy is determined by a provided autoconfiguration script.
let kCFProxyTypeFTP: CFString
Specifies an FTP proxy.
let kCFProxyTypeHTTP: CFString
Specifies an HTTP proxy.
let kCFProxyTypeHTTPS: CFString
Specifies an HTTPS proxy.
let kCFProxyTypeSOCKS: CFString
Specifies a SOCKS proxy.
Topics
Constants
See Also
CFNetwork / Proxy Types
API Collection
Proxy Types
Constants that specify the type of proxy.


## Page 2

func CFNetworkCopyProxiesForURL(CFURL, CFDictionary) -> Unmanaged<
CFArray>
Returns the list of proxies that should be used to download a given URL.
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
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().
Global Proxy Configuration


