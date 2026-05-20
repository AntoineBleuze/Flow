# Errors.pdf

## Page 1

case layoutNotSupported
An error that indicates the configuration’s current layout value is invalid.
case missingConfiguration
An error that indicates the system didn’t find a default layer configuration.
case notEnoughFramesRequested
An error that indicates not enough frames are available for rendering.
case temporalAntiAliasingNotSupported
An error that occurs when you try to enable temporal anti-aliasing but the current
configuration parameters don’t support it.
case tooManyFramesRequested
An error that indicates your app requested too many frames for rendering.
case unsupportedForwardDepthRange
An error that indicates the depth range values aren’t in reverse-z order.
case unsupportedNearPlaneDistance
Topics
Getting the configuration errors
Compositor Services / LayerRendererConfigurationError
Enumeration
LayerRendererConfigurationError
Errors that can occur when configuring layers.
macOS 26.0+
visionOS 1.0+


## Page 2

An error that indicates the near plane of the client is closer than the minimum supported
distance.
case variableRasterizationRateIsNotSupported
An error that indicates foveation is enabled but not supported.
case unsupportedColorFormat
An error that indicates the system doesn’t support the specified color format choice.
case unsupportedColorUsage
An error that indicates the system doesn’t support the specified color usage option.
case unsupportedDepthFormat
An error that indicates the system doesn’t support the specified depth format choice.
case unsupportedDepthUsage
An error that indicates the system doesn’t support the specified depth usage choice.
case unsupportedDrawableRenderContextStencilFormat
An error that indicates the layer doesn’t support the current pixel format for the stencil
texture.
case unsupportedRenderQuality
An error that indicates the configuration’s render quality is unsupported. This could be
because foveation is disabled or the quality is outside of the valid range of [0, 1], the error
userInfo will contain additional information.
var description: String
case unsupportedTrackingAreasFormat
An error that indicates the layer doesn’t support the current pixel format for tracking areas
textures.
case unsupportedTrackingAreasUsage
An error that indicates the layer doesn’t support the current texture usage for tracking areas
textures.
Getting the error details
Enumeration Cases


## Page 3

Copyable
Equatable
Error
Hashable
LocalizedError
RawRepresentable
Sendable
SendableMetatype
Relationships
Conforms To


