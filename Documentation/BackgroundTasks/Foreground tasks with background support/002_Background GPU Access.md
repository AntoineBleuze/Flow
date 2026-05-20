# 002_Background GPU Access.pdf

## Page 1

Key
com.apple.developer.background-tasks.continued-processing.gpu
Type
Boolean
Default: NO
This entitlement works with BGContinuedProcessingTask, which allows your app’s critical
work to complete even when the app goes into the background before the task finishes.
To enable GPU use in the task, add this entitlement to your app by adding the Background GPU
Access capability to your target in Xcode. For more information, see Adding capabilities to your
app.
For more information about continuous background tasks, see Performing long-running tasks on
iOS and iPadOS.
Details
Attributes
Discussion
Bundle Resources / Entitlements / Background GPU Access
Property List Key
Background GPU Access
The entitlement the system requires for a continuous background task to use the
GPU.
iOS 26.0+
iPadOS 26.0+


