# 003_SendReportErrorResponse.pdf

## Page 1

errors
[*]
(Required)
Possible types: DuplicateValueError, ReportingCurrencyMismat
Error, NotFoundError, OmittedFieldError, FieldNotAllowed
Error, FutureDateError, UnknownEnumError, LineItemStatus
RegressionError, MissingLineItemsForStatusError, Line
ItemsNotAllowedForStatusError, IncorrectAmountTax
InclusiveError, IncorrectNetAmountError, SelfReference
Error, ReferenceInvalidSubscriptionEventError, Negative
ValueNotAllowedError, PositiveValueRequiredError, Start
DateAfterEndDateError, ReportingCurrencyExchangeNot
AllowedError, MaximumLengthExceededError, Erroneously
SubmittedNotRestatementError, ReferenceLineItemNotABuy
Error, ErroneousLineItemReferencedByValidLineItemError,
TaxCountryMismatchError, NetAmountMismatchError, Valid
LineItemReferencesErroneousLineItemError, Simultaneous
SubmissionError, DateTooFarInPastError, RefundReferenced
ByRefundError, NonInitialBuyReferencedByBuyError, Repeat
ErroneousSubmissionError, ReferencedCreationDate
IncompatibleError, PricingCurrencyMismatchError, Exchang
RateMismatchError, SubscriptionStartNonZeroDaysPaid
ServiceError, InvalidTaxInclusiveAmountForSubscription
PaymentError, LineItemCreationDateOutOfRangeError,
DuplicateTokenStatusNotAllowedError, RestatementCreation
DateMismatchError, RestatementNotAllowedCreationDate
Error, RefundNotAllowedCreationDateError
Properties
External Purchase Serve… / SendReportErrorResponse
Object
SendReportErrorResponse
An error response that indicates your external purchase report didn’t succeed,
including error details for the line items in your report.
External Purchase Server API 1.0.0+


## Page 2

Send External Purchase Report
Report required information about external purchase tokens and associated transactions.
object ExternalPurchaseReport
The contents of an external purchase report for a single token.
object SendReportSuccessResponse
A response that contains the request identifier and indicates the server successfully receive
your external purchase report.
See Also
External purchase reporting


