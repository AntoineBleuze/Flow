# 000_IOUserClient.pdf

## Page 1

An application may open an IOUserClient by calling IOServiceOpen(). This results in a call to the
IOService::NewUserClient API to create an instance representing the connection. and to receive
untyped data via IOConnectMethod/IOConnectAsyncMethod. As an IOService subclass,
IOUserClient receives the normal Start()/Stop() lifecyle calls.
init
free
AsyncCompletion
Send asynchronous arguments to a completion supplied by ExternalMethod().
KernelCompletion
IOUserClientAsyncArgumentsArray
Overview
Topics
Configuring a User Client
Communicating with the Client
DriverKit / IOUserClient
Class
IOUserClient
A connection to another service that the system manages.
DriverKit
iOS
iPadOS
macOS


## Page 2

Arguments Array Maximum
IOUserClientAsyncReferenceArray
Reference Array Maximum
ExternalMethod
Receive arguments from IOKit.framework IOConnectMethod calls.
IOUserClientMethodArguments
Arguments to pass to IOConnectMethod calls.
IOUserClientMethodDispatch
A structure that specifies how to validate the arguments passed to a client method function.
IOUserClientMethodFunction
CopyClientMemoryForType
Return an IOMemoryDescriptor to be mapped into the client task.
Copy Client Memory Options
CopyClientEntitlements
CreateMemoryDescriptorFromClient
IOService
Responding to Messages
Mapping to the Client’s Memory Space
Instance Methods
Relationships
Inherits From


## Page 3

IOUserServer
A system-managed service.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
Communicating between a DriverKit extension and a client app
Send and receive different kinds of data securely by validating inputs and asynchronously by
storing and using a callback.
See Also
External drivers


