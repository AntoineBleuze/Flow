#include <metal_stdlib>
using namespace metal;

// Helper mod function that mimics GLSL's floor-based mod behavior
float glsl_mod(float x, float y) {
    return x - y * floor(x / y);
}

[[ stitchable ]] half4 shaderAnimation(float2 position, half4 sourceColor, float time, float2 resolution, float waveProgress) {
    // Normalise coordinate so origin (0, 0) is at the center of the viewport
    // In Metal, position.y is 0 at top and resolution.y at bottom, so we adjust to match standard screen shader coordinate systems
    float2 fragCoord = float2(position.x, resolution.y - position.y);
    float2 uv = (fragCoord * 2.0 - resolution) / min(resolution.x, resolution.y);
    
    float r = length(uv);
    float waveRadius = waveProgress * 2.5; // Radius starts at 0.0 and expands outward to 2.5
    
    float ripple = 0.0;
    float waveGlow = 0.0;
    
    if (waveProgress > 0.0) {
        float dist = r - waveRadius;
        // Ripple physical wave refraction
        ripple = sin(dist * 20.0 - 1.570796) * 0.12 * exp(-abs(dist) * 8.0);
        // Bright cyan/blue light halo along the wave front
        waveGlow = exp(-abs(dist) * 15.0) * 1.5;
    }
    
    // Distort uv coordinates in a radial direction to simulate fluid ripple refraction
    float2 distortedUV = uv * (1.0 + ripple);
    
    float t = time * 0.05;
    float lineWidth = 0.002;
    float3 color = float3(0.0);
    
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 5; i++) {
            float shift = -0.01 * float(j) + float(i) * 0.01;
            // fract is built into Metal shading language
            float pulse = fract(t + shift) * 5.0;
            float pattern = glsl_mod(distortedUV.x + distortedUV.y, 0.2);
            float distVal = pulse - length(distortedUV) + pattern;
            
            color[j] += (lineWidth * float(i * i)) / (abs(distVal) + 0.001);
        }
    }
    
    // Add wavefront highlight glow
    color += float3(0.1, 0.5, 1.0) * waveGlow;
    
    return half4(
        clamp(color.x, 0.0, 1.0),
        clamp(color.y, 0.0, 1.0),
        clamp(color.z, 0.0, 1.0),
        1.0
    );
}
