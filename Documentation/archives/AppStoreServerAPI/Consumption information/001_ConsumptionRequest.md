# 001_ConsumptionRequest.pdf

## Page 1

customerConsented
customerConsented
(Required) A Boolean value of true or false that indicates whether the
customer consented to provide consumption data.
consumption
Percentage
consumption
Percentage
An integer that indicates the percentage of the In-App Purchase the custome
consumed, in milliunits.
Minimum: 0
Maximum: 100000
deliveryStatus
deliveryStatus
(Required) A value that indicates whether the app successfully delivered an 
App Purchase that works properly.
refundPreference
refundPreference
A value that indicates your preference, based on your operational logic, as to
whether the App Store should grant the refund.
sampleContent
Provided
sampleContent
Provided
(Required) A Boolean value of true or false that indicates whether you
provided, prior to its purchase, a free sample or trial of the content, or
information about its functionality.
Use ConsumptionRequest to provide information about the customer’s In-App Purchase when
you call the Send Consumption Information endpoint.
Properties
Discussion
App Store Server API / ConsumptionRequest
Object
ConsumptionRequest
The request body that contains consumption information for an In-App Purchase
App Store Server API 1.19+


## Page 2

Note
The App Store server rejects requests that have a customerConsented value other than
true by returning an HTTP 400 error with an InvalidCustomerConsentedError.
You can provide consumption information for any type of product: consumable, non-consumable,
non-renewing subscription, and auto-renewable subscription.
Consider the following constraints when providing an optional refundPreference:
The system supports the GRANT_FULL and DECLINE values for all product types.
If you choose GRANT_PRORATED for an auto-renewable subscription, don’t include a
consumptionPercentage. The system automatically calculates the percentage.
If the deliveryStatus isn’t DELIVERED, set the consumptionPercentage to 0; otherwise
the request fails with an error.
type customerConsented
A Boolean value that indicates whether the customer consented to provide consumption dat
to the App Store.
type consumptionPercentage
An integer that indicates the percentage, in milliunits, of the In-App Purchase the customer
consumed.
type deliveryStatus
A value that indicates whether the app successfully delivered an In-App Purchase that works
properly.
type refundPreference
A value that indicates your preferred outcome for the refund request.
type sampleContentProvided
A Boolean value that indicates whether you provided, prior to its purchase, a free sample or
trial of the content, or information about its functionality.
Topics
Consumption data types


## Page 3

Send Consumption Information
Send consumption information about an In-App Purchase to the App Store after your server
receives a consumption request notification.
See Also
Consumption information


