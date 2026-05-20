# Global Proxy Configuration.pdf

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


## Page 4

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


## Page 5

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


## Page 6

Proxy Types
Constants that specify the type of proxy.
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


## Page 7

proxyAutoConfigurationScript
A CFString containing the code of the autoconfiguration script to be executed.
targetURL
The URL that your application intends to eventually download using the proxies.
cb
A callback to be called when execution of the script is finished.
clientContext
A stream context containing a client info object and optionally retain and release callbacks fo
that object.
Parameters
Discussion
CFNetwork / CFNetworkExecuteProxyAutoConfigurationScript(_:_:_:_:)
Function
CFNetworkExecuteProxyAuto
ConfigurationScript(_:_:_:_:)
Downloads a proxy autoconfiguration script and executes it.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+


## Page 8

This function returns a run loop source that the caller should schedule. Once execution of the
script has completed, the specified callback function is called.
Note
If you want to terminate the request before completion, you should invalidate the run loop
source.
func CFNetworkCopyProxiesForURL(CFURL, CFDictionary) -> Unmanaged<
CFArray>
Returns the list of proxies that should be used to download a given URL.
func CFNetworkCopyProxiesForAutoConfigurationScript(CFString, CFURL,
UnsafeMutablePointer<Unmanaged<CFError>?>?) -> Unmanaged<CFArray>?
Executes a proxy autoconfiguration script to determine the best proxy to use to retrieve a
specified URL.
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
Constants that specify the type of proxy.
Global Proxy Settings Constants
See Also
Global Proxy Configuration


## Page 9

Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


## Page 10

proxyAutoConfigURL
The URL of the autoconfiguration script.
targetURL
The URL that your application intends to eventually download using the proxies.
cb
A callback to be called when execution of the script is finished.
clientContext
A stream context containing a client info object and optionally retain and release callbacks fo
that object.
Parameters
Discussion
CFNetwork / CFNetworkExecuteProxyAutoConfigurationURL(_:_:_:_:)
Function
CFNetworkExecuteProxyAuto
ConfigurationURL(_:_:_:_:)
Downloads a proxy autoconfiguration script and executes it.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+


## Page 11

This function returns a run loop source that the caller should schedule. Once downloading and
execution of the script has completed, the specified callback function is called.
Note
If you want to terminate the request before completion, you should invalidate the run loop
source.
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
func CFNetworkCopySystemProxySettings() -> Unmanaged<CFDictionary>?
Returns a CFDictionary containing the current systemwide internet proxy settings.
typealias CFProxyAutoConfigurationResultCallback
Callback function called when a proxy autoconfiguration computation has completed.
Property Keys
Keys for calls to property get/set functions such as CFReadStreamSetProperty(_:_:_
and CFReadStreamCopyProperty(_:_:).
Proxy Types
Constants that specify the type of proxy.
Global Proxy Settings Constants
See Also
Global Proxy Configuration


## Page 12

Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


## Page 13

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


## Page 14

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


## Page 15

client
The client reference originally passed in the clientContext parameter of the CFNetwork
ExecuteProxyAutoConfigurationScript or CFNetworkExecuteProxyAuto
ConfigurationURL call that triggered this callback.
proxyList
The list of proxies returned by the autoconfiguration script. This list is in a format suitable for
passing to CFProxyCopyProxiesForURL (with the added guarantee that no entries will ev
be autoconfiguration URL entries). If an error occurs, this value will be NULL.
Note
If you want to keep this list, you must retain it when your callback receives it.
error
An error object that indicates any error that may have occurred. If no error occurred, this valu
will be NULL.
Parameters
CFNetwork / CFProxyAutoConfigurationResultCallback
Type Alias
CFProxyAutoConfigurationResultCallback
Callback function called when a proxy autoconfiguration computation has
completed.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 16

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
Property Keys
Keys for calls to property get/set functions such as CFReadStreamSetProperty(_:_:_
and CFReadStreamCopyProperty(_:_:).
Proxy Types
Constants that specify the type of proxy.
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().
See Also
Global Proxy Configuration


## Page 17

let kCFProxyAutoConfigurationHTTPResponseKey: CFString
let kCFProxyAutoConfigurationJavaScriptKey: CFString
let kCFProxyAutoConfigurationURLKey: CFString
let kCFProxyHostNameKey: CFString
let kCFProxyPasswordKey: CFString
let kCFProxyPortNumberKey: CFString
let kCFProxyTypeKey: CFString
let kCFProxyUsernameKey: CFString
func CFNetworkCopyProxiesForURL(CFURL, CFDictionary) -> Unmanaged<
CFArray>
Returns the list of proxies that should be used to download a given URL.
Topics
Constants
See Also
Global Proxy Configuration
CFNetwork / Property Keys
API Collection
Property Keys
Keys for calls to property get/set functions such as CFReadStreamSet
Property(_:_:_:) and CFReadStreamCopyProperty(_:_:).


## Page 18

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
Proxy Types
Constants that specify the type of proxy.
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetworkCopy
SystemProxySettings().


## Page 19

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


## Page 20

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


## Page 21

let kCFNetworkProxiesExceptionsList: CFString
Value is a CFArray of CFString objects indicating host name patterns that should bypass
the proxy.
let kCFNetworkProxiesExcludeSimpleHostnames: CFString
Value is a CFNumber object indicating whether simple host names are excluded. Simple hos
names are excluded if the key is present and the associated value is nonzero.
let kCFNetworkProxiesFTPEnable: CFString
Value is a CFNumber object indicating whether an FTP proxy is enabled. The proxy is enable
if the key is present and the associated value is nonzero.
let kCFNetworkProxiesFTPPassive: CFString
Value is a CFNumber object indicating whether an FTP proxy’s passive mode is enabled. The
passive mode is enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesFTPPort: CFString
Value is a CFNumber object indicating the port number of an FTP proxy.
let kCFNetworkProxiesFTPProxy: CFString
Value is a CFString object indicating the host name or IP number of an FTP proxy.
let kCFNetworkProxiesGopherEnable: CFString
Topics
Constants
CFNetwork / Global Proxy Settings Constants
API Collection
Global Proxy Settings Constants
Constants for keys in the global proxy settings dictionary returned by CFNetwor
CopySystemProxySettings().


## Page 22

Value is a CFNumber object indicating whether a gopher proxy is enabled. The proxy is
enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesGopherPort: CFString
Value is a CFNumber indicating the port number of a gopher proxy.
let kCFNetworkProxiesGopherProxy: CFString
Value is a CFString object indicating the host name or IP number of a gopher proxy.
let kCFNetworkProxiesHTTPEnable: CFString
Value is a CFNumber object indicating whether an HTTP proxy is enabled. The proxy is
enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesHTTPPort: CFString
Value is a CFNumber object containing the port number associated with the HTTP proxy.
let kCFNetworkProxiesHTTPProxy: CFString
Value is a CFString object containing the HTTP proxy host name or IP number.
let kCFNetworkProxiesHTTPSEnable: CFString
Value is a CFNumber object indicating whether an HTTPS proxy is enabled. The proxy is
enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesHTTPSPort: CFString
Value is a CFNumber object containing the port number associated with the HTTPS proxy.
let kCFNetworkProxiesHTTPSProxy: CFString
Value is a CFString object containing the HTTPS proxy host name or IP number.
let kCFNetworkProxiesRTSPEnable: CFString
Value is a CFNumber object indicating whether an RTSP proxy is enabled. The proxy is
enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesRTSPPort: CFString
Value is a CFNumber object containing the port number associated with the RTSP proxy.
let kCFNetworkProxiesRTSPProxy: CFString
Value is a CFString object containing the RTSP proxy host name or IP number.
let kCFNetworkProxiesSOCKSEnable: CFString
Value is a CFNumber object indicating whether a SOCKS proxy is enabled. The proxy is
enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesSOCKSPort: CFString


## Page 23

Value is a CFNumber object containing the port number associated with the SOCKS proxy.
let kCFNetworkProxiesSOCKSProxy: CFString
Value is a CFString object containing the SOCKS proxy host name or IP number.
let kCFNetworkProxiesProxyAutoConfigEnable: CFString
Value is a CFNumber object indicating whether proxy autoconfiguration is enabled. Proxy
autoconfiguration is enabled if the key is present and the associated value is nonzero.
let kCFNetworkProxiesProxyAutoConfigJavaScript: CFString
Value is a CFString object that contains the full JavaScript source of the ProxyAutoConfig
(PAC) file.
let kCFNetworkProxiesProxyAutoConfigURLString: CFString
Value is a CFString object that contains the URL of the proxy autoconfiguration (PAC) file.
let kCFNetworkProxiesProxyAutoDiscoveryEnable: CFString
Value is a CFNumber object indicating whether proxy autodiscovery is enabled. Proxy
autodiscovery is enabled if the key is present and the associated value is nonzero.
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
See Also
Global Proxy Configuration


## Page 24

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
Constants that specify the type of proxy.


