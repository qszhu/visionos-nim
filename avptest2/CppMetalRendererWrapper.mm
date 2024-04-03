//
//  CppMetalRendererWrapper.m
//  avptest2
//
//  Created by qinsi on 2024/3/27.
//

#import <QuartzCore/QuartzCore.hpp>
#import "CppMetalRendererWrapper.h"
#import "NimMetalRenderer.h"

@implementation CppMetalRendererWrapper {
    NimMetalRenderer* renderer;
}

- (instancetype)init{
    if (self = [super init]) {
        renderer = newNimMetalRenderer();
    }
    return self;
}

- (void)render:(id<CAMetalDrawable>)drawable {
    render(renderer, (__bridge CA::MetalDrawable*)drawable);
}

- (id<MTLDevice>)device{
    return (__bridge id<MTLDevice>)renderer->device;
}

@end
