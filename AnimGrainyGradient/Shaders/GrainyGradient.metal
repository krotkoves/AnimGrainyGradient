#include <metal_stdlib>
using namespace metal;

struct GradientUniforms {
    float time;
    float2 resolution;
    float4 backgroundColor;
    float grainIntensity;
    float grainScale;
    float blurRadius;
    float saturation;
    float brightness;
    int noiseOctaves;
    float flowDistortion;
    float liquidEffect;
    int blobCount;
    int enableGrain;
    float transitionSpeed;
    float padding;
};

struct BlobData {
    float4 color;
    float2 position;
    float2 targetPosition;
    float radius;
    float speed;
    float phase;
    float orbitRadiusX;
    float orbitRadiusY;
    int transitionMode;
    float padding;
};

struct VertexOut {
    float4 position [[position]];
    float2 texCoord;
};

inline float fastHash(float2 p) {
    return fract(sin(dot(p, float2(12.9898, 78.233))) * 43758.5453);
}

inline float3 adjustSaturation(float3 color, float saturation) {
    float luminance = dot(color, float3(0.2126, 0.7152, 0.0722));
    return mix(float3(luminance), color, saturation);
}

inline float2 getBlobPos(BlobData blob, float time, float transitionSpeed) {
    float2 pos = blob.position;
    float t = (sin(time * transitionSpeed * 0.5 + blob.phase) * 0.5 + 0.5);
    
    int mode = blob.transitionMode;
    
    if (mode == 0) {
        float animTime = time * blob.speed;
        pos.x += sin(animTime + blob.phase) * blob.orbitRadiusX;
        pos.y += cos(animTime * 0.7 + blob.phase + 1.0) * blob.orbitRadiusY;
    }
    else if (mode == 1) {
        pos = mix(pos, blob.targetPosition, t);
        float animTime = time * blob.speed;
        pos.x += sin(animTime + blob.phase) * blob.orbitRadiusX * 0.3;
        pos.y += cos(animTime * 0.7 + blob.phase + 1.0) * blob.orbitRadiusY * 0.3;
    }
    else if (mode == 2) {
        float2 center = (pos + blob.targetPosition) * 0.5;
        float wave = sin(time * transitionSpeed * 2.0 + blob.phase) * 0.5 + 0.5;
        pos = mix(center, pos, wave);
        pos = mix(pos, blob.targetPosition, wave * wave);
    }
    else if (mode == 3) {
        float breathe = sin(time * transitionSpeed * blob.speed + blob.phase) * 0.5 + 0.5;
        pos = mix(pos, blob.targetPosition, breathe * 0.3);
    }
    else if (mode == 4) {
        float wave = sin(time * transitionSpeed + blob.phase * 6.28318) * 0.5 + 0.5;
        pos.x += (wave - 0.5) * blob.orbitRadiusX * 2.0;
        pos.y += cos(time * transitionSpeed * 0.7 + blob.phase * 6.28318) * blob.orbitRadiusY;
        pos = mix(pos, blob.targetPosition, 0.2);
    }
    
    return pos;
}

vertex VertexOut gradientVertex(uint vertexID [[vertex_id]]) {
    float2 positions[4] = {
        float2(-1.0, -1.0),
        float2( 1.0, -1.0),
        float2(-1.0,  1.0),
        float2( 1.0,  1.0)
    };
    
    float2 texCoords[4] = {
        float2(0.0, 1.0),
        float2(1.0, 1.0),
        float2(0.0, 0.0),
        float2(1.0, 0.0)
    };
    
    VertexOut out;
    out.position = float4(positions[vertexID], 0.0, 1.0);
    out.texCoord = texCoords[vertexID];
    return out;
}

fragment float4 gradientFragment(
    VertexOut in [[stage_in]],
    constant GradientUniforms &uniforms [[buffer(0)]],
    constant BlobData *blobs [[buffer(1)]]
) {
    float2 uv = in.texCoord;
    float time = uniforms.time;
    
    float3 color = uniforms.backgroundColor.rgb;
    
    int blobCount = min(uniforms.blobCount, 12);
    
    for (int i = 0; i < blobCount; i++) {
        BlobData blob = blobs[i];
        
        float2 blobCenter = getBlobPos(blob, time, uniforms.transitionSpeed);
        
        float dist = distance(uv, blobCenter);
        
        float animatedRadius = blob.radius;
        
        if (blob.transitionMode == 3) {
            float breathe = sin(time * uniforms.transitionSpeed * blob.speed + blob.phase) * 0.15 + 1.0;
            animatedRadius *= breathe;
        }
        
        float weight = 1.0 - smoothstep(0.0, animatedRadius, dist);
        
        color = mix(color, blob.color.rgb, weight * blob.color.a);
    }
    
    color = adjustSaturation(color, uniforms.saturation);
    color *= uniforms.brightness;
    
    if (uniforms.grainIntensity > 0.001) {
        float grainTime = uniforms.enableGrain == 1 ? time : 0.0;
        
        float2 grainUV = uv * 200.0;
        float grain = fastHash(grainUV + float2(grainTime * 100.0, grainTime * 50.0));
        
        color += (grain - 0.5) * uniforms.grainIntensity;
    }
    
    return float4(clamp(color, 0.0, 1.0), 1.0);
}
