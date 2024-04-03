//
//  ExampleShader.metal
//  avptest2
//
//  Created by qinsi on 2024/3/22.
//

#include <metal_stdlib>
using namespace metal;


struct VertexOut {
    float4 position [[position]];
};

vertex VertexOut vertexShader(uint vertexID [[vertex_id]]) {
    float2 positions[3] = {float2(0.0, 1.0), float2(-1.0, -1.0), float2(1.0, -1.0)};
    VertexOut out;
    out.position = float4(positions[vertexID], 0.0, 1.0);
    return out;
}

fragment float4 fragmentShader() {
    return float4(1.0, 0.0, 0.0, 1.0); // Red color
}
