# 007_Adjusting anchor loudness.pdf

## Page 1

Apply the adjustment method below to improve the consistency of your anchor loudness, or
standard, value for low speech activity. The method’s basis is a statistical model of anchor
loudness for a large variety of long-form content that takes advantage of the correlation with othe
loudness-based measurements. The method uses the following measurements:
Speech-gated loudness
Speech activity that derives from a speech detector
Program loudness (ITU-R BS.1770-4)
Top value of LRA (loudness range) (EBU Tech 3342)
For low speech activity, the model ignores the speech-gated loudness value and computes ancho
loudness from the other three measurements. A gradual transition from the model to the measure
speech-gated loudness occurs as the speech activity increases.
The following examples and source code show how to calculate anchor loudness using program
loudness and speech-gated loudness.
The following figure shows a visual representation of anchor loudness for an example with a
speech-gated loudness of -27 LKFS (loudness, K-weighted, relative to full scale) and different
program loudness values.
Overview
Determine anchor loudness using different program
loudness values
HTTP Live Streaming / Adjusting anchor loudness
Article
Adjusting anchor loudness
Adjust anchor loudness when measurements of speech-gated loudness for a full
mix may be inaccurate, such as when speech activity is low.


## Page 2

The lines on the left correspond to the calculated anchor loudness as a result of the adjustment
method. The labels for each line indicate the program loudness values. For low speech activity,
anchor loudness increases with program loudness. For increasing speech activity, there’s a
transition to the speech-gated loudness measurement.
The next figure displays anchor loudness for an example with speech-gated loudness of -27 LKFS
and program loudness of -24 LKFS. The difference between top value of LRA and program
loudness characterizes how dynamic the content is. The lines on the left correspond to the
calculated anchor loudness as a result of the adjustment method. The labels for each line indicate
the value of the loudness difference in loudness units (LU). The loudness difference correlates wi
anchor loudness, and the modeling results in lower anchor loudness for more dynamic content at
low speech activity. As the speech activity increases, anchor loudness transitions to the measure
speech-gated loudness.


## Page 3

The following source code includes a function to compute the adjusted anchor loudness value fro
the parameters in the preceding examples, which is applicable to long-form content.


## Page 4



## Page 5

HTTP Live Streaming (HLS) authoring specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery using HLS.
Using content protection systems with HLS
Adding encryption keys to media playlists
About the Common Media Application Format with HTTP Live Streaming (HLS)
Learn the Common Media Application Format as it applies to HLS.
Enabling Low-Latency HTTP Live Streaming (HLS)
Add Low-Latency HLS to your content streams to maintain scalability.
Links to additional specifications and videos
Review additional specifications and documents.
Videos about HLS
Review informational videos about HTTP Live Streaming.
Providing metadata for xHE-AAC video soundtracks
See Also
Specifications and other documents


## Page 6

Ensure volume normalization by including metadata for loudness and dynamic range control
Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.


