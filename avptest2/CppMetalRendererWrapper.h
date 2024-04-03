//
//  CppMetalRendererWrapper.h
//  avptest2
//
//  Created by qinsi on 2024/3/27.
//

#ifndef CppMetalRendererWrapper_h
#define CppMetalRendererWrapper_h

#import <Metal/Metal.h>
#import <QuartzCore/QuartzCore.h>

@interface CppMetalRendererWrapper: NSObject
- (instancetype)init;
- (void)render:(id<CAMetalDrawable>)drawable;
- (id<MTLDevice>)device;
@end

#endif /* CppMetalRendererWrapper_h */
