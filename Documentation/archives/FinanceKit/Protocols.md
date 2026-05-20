# Protocols.pdf

## Page 1

Use enableBackgroundDelivery(for:frequency:) to enable updates for an extension an
see BackgroundDeliveryExtensionProviding to implement functions for an extension.
AppExtension, BackgroundDeliveryExtensionProviding
Overview
Relationships
Inherits From
FinanceKit / BackgroundDeliveryExtension
Protocol
BackgroundDeliveryExtension
An extension used to receive updates about changes to data within the finance
store.
iOS 26.0+
iPadOS 26.0+


## Page 2

func didReceiveData(for: [FinanceStore.BackgroundDataType]) async
Handle changes to data within the finance store.
Required
func willTerminate() async
Get alerted when a BackgroundDeliveryExtension is about to close.
Required
BackgroundDeliveryExtension
Topics
Instance Methods
Relationships
Inherited By
FinanceKit / BackgroundDeliveryExtensionProviding
Protocol
BackgroundDeliveryExtensionProviding
iOS 26.0+
iPadOS 26.0+


