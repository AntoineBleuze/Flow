# 004_Workgroup Management.pdf

## Page 1

Real-time audio rendering often requires coordination between the threads of an app, the system
and the threads of any active Audio Unit plug-ins. Workgroups provide the mechanism to
coordinate the efforts of these different processes, and ensure that they execute on the same
schedule. In an Audio Unit, use a render context observer to retrieve the workgroup that the host
app uses for real-time audio rendering. In an app, fetch the workgroup for a Core Audio device
directly from the device or from your AUAudioUnit object.
If your app has real-time rendering threads that operate on their own deadlines, create your own
workgroup using the AudioWorkIntervalCreate function. Use your custom workgroup to set
and update the rendering schedule for your threads.
Understanding Audio Workgroups
Learn how to optimize real-time rendering performance with the Audio Workgroups API.
Adding Parallel Real-Time Threads to Audio Workgroups
Optimize the performance of real-time audio threads that run in sync with the I/O thread by
adding them to the audio device workgroup.
Adding Asynchronous Real-Time Threads to Audio Workgroups
Overview
Topics
Essentials
Audio Toolbox / Workgroup Management
API Collection
Workgroup Management
Coordinate the activity of custom real-time audio threads with those of the system
and other processes.


## Page 2

Optimize system performance by adding real-time audio threads that run asynchronously to
the I/O thread to custom audio workgroups.
Adding Audio Unit Auxiliary Real-Time Threads to Audio Workgroups
If your Audio Unit plug-in creates auxiliary real-time rendering threads, add them to the host
app’s audio workgroup so the system can schedule them appropriately.
var kAudioDevicePropertyIOThreadOSWorkgroup: AudioObjectPropertySelecto
The device’s workgroup object, which you use to coordinate your threads with the threads o
the device.
Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
Convert between linear PCM audio formats, and between linear PCM and compressed
formats.
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.
Audio Toolbox Debugging
Obtain the internal state of Core Audio objects during the development and debugging of yo
code.
Audio Codec
Translate audio data from one format to another.
Clock Utilities
Manage time-related information associated with audio playback.
Device Workgroup
See Also
Utilities


