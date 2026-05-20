# Essentials.pdf

## Page 1

Note
This sample code project is associated with WWDC25 session 403: Learn about Apple
Immersive Video technologies.
Running this sample requires downloading a zip file that contains an example QuickTime movie an
supporting content. When the download completes, expand the zip file.
To run the app in Xcode, choose Product > Scheme > Edit Scheme, and update the command-line
argument paths to reference the downloaded files:
--input
An Apple Immersive Video MV-HEVC video file without any necessary metadata.
--aime
An AIME file with the correct camera calibrations for the provided input file.
--usdz
An optional USDZ file to use for camera calibration instead of an AIME file. This argument als
requires the --mask option.
--mask
Overview
Configure the sample code project
Immersive Media Support / Authoring Apple Immersive Video
Sample Code
Authoring Apple Immersive Video
Prepare and package immersive video content for delivery.
Download
macOS 26.0+
Xcode 26.0+


## Page 2

An optional dynamic mask JSON data file to use for camera calibration instead of an AIME file
This argument also requires the --usdz option.
--output
The AIVU file to write that contains Immersive Media Support metadata.


