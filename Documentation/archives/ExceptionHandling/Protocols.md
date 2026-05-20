# Protocols.pdf

## Page 1

func exceptionHandler(NSExceptionHandler!, shouldHandle: NSException!,
mask: Int) -> Bool
Implemented by the delegate to evaluate whether the delegating exception handler should
handle a given exception.
func exceptionHandler(NSExceptionHandler!, shouldLogException:
NSException!, mask: Int) -> Bool
Implemented by the delegate to evaluate whether the delegating exception hangler should lo
a given exception.
Topics
Logging and handling exceptions
Exception Handling / NSExceptionHandlerDelegate
NSExceptionHandlerDelegate
The NSExceptionHandlerDelegate informal protocol describes methods
that NSExceptionHandler objects call on their delegates when exceptions
occur. An NSExceptionHandler object does not need to have a delegate. Whe
one does, these delegate methods are asked to approve exception handling and
logging for each monitored NSExceptionHandler object.


