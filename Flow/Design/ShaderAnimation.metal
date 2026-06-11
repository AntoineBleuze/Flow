#include <metal_stdlib>
using namespace metal;

// Helper mod function that mimics GLSL's floor-based mod behavior
float glsl_mod(float x, float y) {
    return x - y * floor(x / y);
}

// Polynomial smooth minimum function (smin) for metaballs-style blending
float smin(float a, float b, float k) {
    float h = clamp(0.5 + 0.5 * (b - a) / k, 0.0, 1.0);
    return mix(b, a, h) - k * h * (1.0 - h);
}

// Pseudo-random number generator matching GLSL fract(sin(x)*1e4)
float msl_random(float x) {
    float s = sin(x) * 10000.0;
    return s - floor(s);
}

// 1. LOADING SHADER: Falling rain drops effect with transparent background (no circle)
[[ stitchable ]] half4 shaderLoading(float2 position, half4 sourceColor, float time, float2 resolution) {
    float2 fragCoord = float2(position.x, resolution.y - position.y);
    float2 uv = (fragCoord * 2.0 - resolution) / min(resolution.x, resolution.y);
    
    // Pixelate coordinates (Mosaic effect from the React component)
    float2 fMosaicScal = float2(4.0, 2.0);
    float2 vScreenSize = float2(256.0, 256.0);
    uv.x = floor(uv.x * vScreenSize.x / fMosaicScal.x) / (vScreenSize.x / fMosaicScal.x);
    uv.y = floor(uv.y * vScreenSize.y / fMosaicScal.y) / (vScreenSize.y / fMosaicScal.y);
    
    // Rain falling effect: gentler speed (0.015) and randomized offsets
    float t = time * 0.015 + msl_random(uv.x) * 1.5;
    float lineWidth = 0.0008;
    float3 color = float3(0.0);
    
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 5; i++) {
            float val = t - 0.01 * float(j) + float(i) * 0.01;
            float pulse = val - floor(val); // fract function
            
            // Vertical falling rain drops formula (moving from 2.2 top to -2.2 bottom)
            float distVal = (2.2 - pulse * 4.4) - uv.y;
            
            color[j] += (lineWidth * float(i * i)) / (abs(distVal) + 0.0001);
        }
    }
    
    // Swizzle color channels to match React shader-lines: vec4(color[2],color[1],color[0],1.0);
    float3 finalColor = float3(color.z, color.y, color.x);
    
    float brightness = max(finalColor.x, max(finalColor.y, finalColor.z));
    float alpha = clamp(brightness * 5.0, 0.0, 0.8);
    
    return half4(
        clamp(finalColor.x, 0.0, 1.0),
        clamp(finalColor.y, 0.0, 1.0),
        clamp(finalColor.z, 0.0, 1.0),
        alpha
    );
}

// 2. ACTIVE SHADER: Pixelated rain drops falling vertically shown during active display
[[ stitchable ]] half4 shaderActive(float2 position, half4 sourceColor, float time, float2 resolution, float waveProgress) {
    float2 fragCoord = float2(position.x, resolution.y - position.y);
    float2 uv = (fragCoord * 2.0 - resolution) / min(resolution.x, resolution.y);
    
    // Pixelate coordinates (Mosaic effect from the React component)
    float2 fMosaicScal = float2(4.0, 2.0);
    float2 vScreenSize = float2(256.0, 256.0);
    uv.x = floor(uv.x * vScreenSize.x / fMosaicScal.x) / (vScreenSize.x / fMosaicScal.x);
    uv.y = floor(uv.y * vScreenSize.y / fMosaicScal.y) / (vScreenSize.y / fMosaicScal.y);
    
    float totalRipple = 0.0;
    float totalGlow = 0.0;
    
    if (waveProgress > 0.0) {
        // Add a gentle drifting offset to the center so that the transition waves move organically over time
        float2 centerOffset = float2(
            sin(time * 0.15 + 2.0) * 0.15,
            cos(time * 0.12 + 1.0) * 0.15
        );
        
        // Define 3 wave sources with different centers to simulate collision and interference
        float2 centers[3] = {
            centerOffset + float2(-0.4, 0.2),
            centerOffset + float2(0.5, -0.3),
            centerOffset + float2(-0.1, -0.5)
        };
        
        float radiusOffsets[3] = { 0.0, -0.15, 0.1 };
        
        float d = 9999.0;
        bool hasActiveWave = false;
        
        for (int i = 0; i < 3; i++) {
            float r_i = length(uv - centers[i]);
            float waveRadius_i = waveProgress * 2.5 + radiusOffsets[i];
            
            if (waveRadius_i > 0.0) {
                float d_i = abs(r_i - waveRadius_i);
                if (!hasActiveWave) {
                    d = d_i;
                    hasActiveWave = true;
                } else {
                    d = smin(d, d_i, 0.15); // smooth union with k = 0.15
                }
            }
        }
        
        if (hasActiveWave) {
            // Physical water wave refraction ripple (sine wave) based on the combined smooth distance contour
            totalRipple = sin(d * 22.0 - 1.570796) * 0.1 * exp(-abs(d) * 6.0);
            // Wavefront highlight glow based on the combined smooth distance contour
            // Fade out the glow completely as waveProgress reaches 1.0 to avoid frozen blue lines at the screen edges
            float waveFade = 1.0 - smoothstep(0.0, 1.0, clamp(waveProgress, 0.0, 1.0));
            totalGlow = exp(-abs(d) * 14.0) * 1.5 * waveFade;
        }
    }
    
    // Distort uv coordinates in a radial direction to simulate fluid ripple refraction during transition
    float2 distortedUV = uv * (1.0 + totalRipple);
    
    // Rain falling effect: gentler speed (0.015) and randomized offsets
    float t = time * 0.015 + msl_random(uv.x) * 1.5;
    float lineWidth = 0.0008;
    float3 color = float3(0.0);
    
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 5; i++) {
            float shift = -0.01 * float(j) + float(i) * 0.01;
            float val = t - 0.01 * float(j) + float(i) * 0.01;
            float pulse = val - floor(val); // fract function
            
            // Vertical falling rain drops formula (moving from 2.2 top to -2.2 bottom)
            float distVal = (2.2 - pulse * 4.4) - distortedUV.y;
            
            color[j] += (lineWidth * float(i * i)) / (abs(distVal) + 0.0001);
        }
    }
    
    // Swizzle color channels to match React shader-lines: vec4(color[2],color[1],color[0],1.0);
    // And add the transition highlight glow (always blue)
    float3 finalColor = float3(color.z, color.y, color.x) + float3(0.1, 0.5, 1.0) * totalGlow;
    
    float brightness = max(finalColor.x, max(finalColor.y, finalColor.z));
    float alpha = clamp(brightness * 5.0, 0.0, 0.8);
    
    return half4(
        clamp(finalColor.x, 0.0, 1.0),
        clamp(finalColor.y, 0.0, 1.0),
        clamp(finalColor.z, 0.0, 1.0),
        alpha
    );
}
