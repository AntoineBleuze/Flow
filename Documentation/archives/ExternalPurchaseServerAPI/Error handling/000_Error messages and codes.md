# 000_Error messages and codes.pdf

## Page 1

object DateTooFarInPastError
An error indicating that a provided date is too far in the past.
object DuplicateTokenStatusNotAllowedError
An error indicating the duplicate token status is not allowed for the associated token type.
object DuplicateValueError
An error indicating the field’s value is already submitted and a duplicate value is not expecte
object ErroneousLineItemReferencedByValidLineItemError
An error indicating the line item has status erroneously submitted but is referenced by a non
erroneously submitted line item.
object ErroneouslySubmittedNotRestatementError
An error indicating the erroneously submitted line item was not marked as restatement.
object ExchangeRateMismatchError
An error indicating the refund’s referenced buy line item has a different exchange rate.
object FieldNotAllowedError
An error indicating the provided field is not allowed.
object FutureDateError
An error indicating the provided date field is in the future and future values are not allowed.
Topics
Error objects for reports
External Purchase Serve… / Error messages and codes
API Collection
Error messages and codes
Error messages and codes for reports and endpoints.


## Page 2

object IncorrectAmountTaxInclusiveError
An error indicating the tax exclusive amount plus the tax amount does not equal the tax
inclusive amount.
object IncorrectNetAmountError
An error indicating the net amount value does not match the expected value.
object InvalidTaxInclusiveAmountForSubscriptionPaymentError
An error indicating the tax inclusive amount must be positive for line items with a subscriptio
payment subscription event.
object LineItemCreationDateOutOfRangeError
An error indicating the line item’s creation date is outside the active range of the token.
object LineItemStatusRegressionError
An error indicating the status can’t be marked as no line item or unrecognized token after it
was previously reported as a line item.
object LineItemsNotAllowedForStatusError
An error indicating a line item was provided for an external purchase ID that has the status n
line item or unrecognized token.
object MaximumLengthExceededError
An error indicating the field’s maximum length is exceeded.
object MissingLineItemsForStatusError
An error indicating the external purchase ID has the status line item but is missing line items
object NegativeValueNotAllowedError
An error indicating the field does not allow a negative value.
object NetAmountMismatchError
An error indicating two line items involved in the same net amount calculation have different
net amount values.
object NonInitialBuyReferencedByBuyError
An error indicating the line item does not have subscription event initial buy but is referenced
by a subscription line item with event type buy.
object NotFoundError
An error indicating the referenced value was not found.
object OmittedFieldError


## Page 3

An error indicating a required field is missing.
object PositiveValueRequiredError
An error indicating the field requires a positive value.
object PricingCurrencyMismatchError
An error indicating the refund’s referenced buy line item has a different pricing currency.
object ReferenceInvalidSubscriptionEventError
An error indicating the referenced line item has no subscription event or its subscription eve
is not subscription start.
object ReferenceLineItemNotABuyError
An error indicating the referenced line item is not a buy.
object ReferencedCreationDateIncompatibleError
An error indicating the referenced line item has a creation date after the line item’s creation
date.
object RefundNotAllowedCreationDateError
An error indicating the refund isn’t allowed for the line item because its creation date is too f
in the past.
object RefundReferencedByRefundError
An error indicating the line item has the refund event type but is referenced by a different lin
item that also has that type.
object RestatementCreationDateMismatchError
An error indicating the creation date of the restatement line item doesn’t match the creation
date of the original line item.
object RestatementNotAllowedCreationDateError
An error indicating that restatement failed because the creation date is too far in the past.
object RepeatErroneousSubmissionError
An error indicating the line item has status erroneously submitted but its previous version wa
already marked erroneously submitted.
object ReportingCurrencyExchangeNotAllowedError
An error indicating that the reporting currency, which reports a currency exchange, isn’t
allowed.
object ReportingCurrencyMismatchError
An error indicating the refund’s referenced buy line item has a different reporting currency.


## Page 4

object SelfReferenceError
An error indicating the line item references itself.
object SimultaneousSubmissionError
An error indicating one or more simultaneous submissions of reports reference the same dat
object StartDateAfterEndDateError
An error indicating the subscription data submitted is invalid because the start date is after
the end date.
object SubscriptionStartNonZeroDaysPaidServiceError
An error indicating that the subscription days of paid service value is invalid because it’s non
zero for a subscription start line item.
object TaxCountryMismatchError
An error indicating the refund’s referenced buy line item has a different tax country.
object UnknownEnumError
An error indicating the submission contained an invalid enum value.
object ValidLineItemReferencesErroneousLineItemError
An error indicating the line item references an erroneously submitted line item, but the line
item itself isn’t erroneously submitted.
type errorCode
An integer value that represents an error in the External Purchase Server API.
type errorMessage
A string that describes an error.
type fieldName
A string that names a field of a line item.
Error types


