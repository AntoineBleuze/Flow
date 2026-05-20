# 077_kCFStreamSocketSecurityLevelSSLv3.pdf

## Page 1

If SSL version 3 is not available, specifies that SSL version 2 be set as the security protocol for a
socket stream.
let kCFStreamSocketSecurityLevelNone: CFString
Specifies that no security level be set.
let kCFStreamSocketSecurityLevelSSLv2: CFString
Specifies that SSL version 2 be set as the security protocol for a socket stream.
Deprecated
let kCFStreamSocketSecurityLevelTLSv1: CFString
Discussion
See Also
Constants
Core Foundation / kCFStreamSocketSecurityLevelSSLv3 Deprecated
Global Variable
kCFStreamSocketSecurityLevel
SSLv3 Deprecated
Specifies that SSL version 3 be set as the security protocol for a socket stream
pair.
iOS 2.0–10.0 Deprecated
iPadOS 2.0–10.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.12 Deprecated
tvOS Deprecated
visionOS 1.0–1.0 Deprecated
watchOS 2.0–3.0 Deprecated


## Page 2

Specifies that TLS version 1 be set as the security protocol for a socket stream.
let kCFStreamSocketSecurityLevelNegotiatedSSL: CFString
Specifies that the highest level security protocol that can be negotiated be set as the securit
protocol for a socket stream.


