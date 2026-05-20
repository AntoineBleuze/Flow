# 000_Resampling in vImage.pdf

## Page 1

Most vImage geometric functions use resampling kernels, which combine data from a target pixe
and other nearby pixels to calculate a value for the destination pixel. Resampling image data
reduces unwanted artifacts, like interference patterns, in the destination image.
This procedure is somewhat similar to that used for convolution. However—in contrast to
convolution—for geometric operations, the resampling kernel itself is resampled during the proce
of pairing kernel values against the sampled pixel data. The kernel is evaluated at both fractional
and integral pixel locations. This has implications for the nature of the kernel—which must be
supplied as a function rather than as a matrix. A resampling kernel function is also called a
resampling filter, or simply a filter.
For almost all geometric operations, vImage supplies a default resampling filter unless you set the
flag kvImageHighQualityResampling, in which case vImage uses a higher-quality filter.
However, the performance of that filter may be slower.
The reflection and high-level rotation functions don’t resample. The shear functions can either us
a default resampling filter or, if you require more control, a custom filter that you provide.
Image shearing
Shear images horizontally and vertically.
Overview
See Also
Related Documentation
Accelerate / Resampling in vImage
Article
Resampling in vImage
Learn how vImage resamples image data during geometric operations.


## Page 2

Reducing artifacts with custom resampling filters
Implement custom linear interpolation to prevent the ringing effects associated with scaling 
image with the default Lanczos algorithm.
Image shearing
Shear images horizontally and vertically.
Image Resampling


