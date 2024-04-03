const METAL = "Metal/Metal.hpp"
const QUARTZ_CORE = "QuartzCore/QuartzCore.hpp"

{.passC: "-I../../metal-cpp".}

type
  NSErrorObj {.importcpp: "NS::Error".} = object
  NSError* = ptr NSErrorObj

  NSStringObj {.importcpp: "NS::String".} = object
  NSString* = ptr NSStringObj

proc NSStringAscii*(str: cstring): NSString
  {.importcpp: "NS::String::string(#, NS::ASCIIStringEncoding)".}

{.push header: METAL.}
type
  MTLDeviceObj {.importcpp: "MTL::Device".} = object
  MTLDevice* = ptr MTLDeviceObj

  MTLCommandQueueObj {.importcpp: "MTL::CommandQueue".} = object
  MTLCommandQueue* = ptr MTLCommandQueueObj

  MTLRenderPipelineStateObj {.importcpp: "MTL::RenderPipelineState".} = object
  MTLRenderPipelineState* = ptr MTLRenderPipelineStateObj

  MTLLibraryObj {.importcpp: "MTL::Library".} = object
  MTLLibrary* = ptr MTLLibraryObj

  MTLFunctionObj {.importcpp: "MTL::Function".} = object
  MTLFunction* = ptr MTLFunctionObj

  MTLRenderPipelineDescriptorObj {.importcpp: "MTL::RenderPipelineDescriptor".} = object
  MTLRenderPipelineDescriptor* = ptr MTLRenderPipelineDescriptorObj

  MTLRenderPipelineColorAttachmentDescriptorArrayObj {.importcpp: "MTL::RenderPipelineColorAttachmentDescriptorArray".} = object
  MTLRenderPipelineColorAttachmentDescriptorArray* = ptr MTLRenderPipelineColorAttachmentDescriptorArrayObj

  MTLRenderPipelineColorAttachmentDescriptorObj {.importcpp: "MTL::RenderPipelineColorAttachmentDescriptor".} = object
  MTLRenderPipelineColorAttachmentDescriptor* = ptr MTLRenderPipelineColorAttachmentDescriptorObj

  MTLPixelFormat {.importcpp: "MTL::PixelFormat".} = cuint

  MTLRenderPassDescriptorObj {.importcpp: "MTL::RenderPassDescriptor".} = object
  MTLRenderPassDescriptor* = ptr MTLRenderPassDescriptorObj

  MTLRenderPassColorAttachmentDescriptorArrayObj {.importcpp: "MTL::RenderPassColorAttachmentDescriptorArray".} = object
  MTLRenderPassColorAttachmentDescriptorArray* = ptr MTLRenderPassColorAttachmentDescriptorArrayObj

  MTLRenderPassColorAttachmentDescriptorObj {.importcpp: "MTL::RenderPassColorAttachmentDescriptor".} = object
  MTLRenderPassColorAttachmentDescriptor* = ptr MTLRenderPassColorAttachmentDescriptorObj

  MTLTexture {.importcpp: "MTL::Texture".} = object

  MTLClearColor {.importcpp: "MTL::ClearColor".} = object

  MTLLoadAction {.importcpp: "MTL::LoadAction".} = cuint
  MTLStoreAction {.importcpp: "MTL::StoreAction".} = cuint

  MTLCommandBufferObj {.importcpp: "MTL::CommandBuffer".} = object
  MTLCommandBuffer* = ptr MTLCommandBufferObj

  MTLRenderCommandEncoderObj {.importcpp: "MTL::RenderCommandEncoder".} = object
  MTLRenderCommandEncoder* = ptr MTLRenderCommandEncoderObj

  MTLPrimitiveType {.importcpp: "MTL::PrimitiveType".} = cuint

  MTLDrawableObj {.importcpp: "MTL::Drawable".} = object
  MTLDrawable* = ptr MTLDrawableObj

let MTLPixelFormatBGRA8Unorm* {.importcpp: "MTL::PixelFormat::PixelFormatBGRA8Unorm".}: cuint

let MTLLoadActionClear* {.importcpp: "MTL::LoadActionClear".}: cuint

let MTLStoreActionStore* {.importcpp: "MTL::StoreActionStore".}: cuint

let MTLPrimitiveTypeTriangle* {.importcpp: "MTL::PrimitiveTypeTriangle".}: cuint

proc MTLClearColorMake*(r, g, b, a: cdouble): MTLClearColor
  {.importcpp: "MTL::ClearColor(@)".}

proc MTLCreateSystemDefaultDevice*(): MTLDevice
  {.importcpp: "MTL::CreateSystemDefaultDevice()".}
proc newCommandQueue*(self: MTLDevice): MTLCommandQueue
  {.importcpp: "#->newCommandQueue()".}
proc newDefaultLibrary*(self: MTLDevice): MTLLibrary
  {.importcpp: "#->newDefaultLibrary()".}
proc newRenderPipelineState*(self: MTLDevice, desc: MTLRenderPipelineDescriptor, err: ptr NSError): MTLRenderPipelineState
  {.importcpp: "#->newRenderPipelineState(#,#)".}

proc newFunction*(self: MTLLibrary, name: NSString): MTLFunction
  {.importcpp: "#->newFunction(#)".}

proc initMTLRenderPipelineDescriptor*(): MTLRenderPipelineDescriptor
  {.importcpp: "MTL::RenderPipelineDescriptor::alloc()->init()".}
proc setVertexFunction*(self: MTLRenderPipelineDescriptor, f: MTLFunction)
  {.importcpp: "#->setVertexFunction(#)".}
proc setFragmentFunction*(self: MTLRenderPipelineDescriptor, f: MTLFunction)
  {.importcpp: "#->setFragmentFunction(#)".}
proc colorAttachments*(self: MTLRenderPipelineDescriptor): MTLRenderPipelineColorAttachmentDescriptorArray
  {.importcpp: "#->colorAttachments()".}

proc objectAt*(self: MTLRenderPipelineColorAttachmentDescriptorArray, i: int): MTLRenderPipelineColorAttachmentDescriptor
  {.importcpp: "#->object(#)".}

proc setPixelFormat*(self: MTLRenderPipelineColorAttachmentDescriptor, pf: MTLPixelFormat)
  {.importcpp: "#->setPixelFormat(#)".}

proc initMTLRenderPassDescriptor*(): MTLRenderPassDescriptor
  {.importcpp: "MTL::RenderPassDescriptor::alloc()->init()".}

proc colorAttachments*(self: MTLRenderPassDescriptor): MTLRenderPassColorAttachmentDescriptorArray
  {.importcpp: "#->colorAttachments()".}

proc objectAt*(self: MTLRenderPassColorAttachmentDescriptorArray, i: int): MTLRenderPassColorAttachmentDescriptor
  {.importcpp: "#->object(#)".}

proc setTexture*(self: MTLRenderPassColorAttachmentDescriptor, texture: MTLTexture)
  {.importcpp: "#->setTexture(#)".}
proc setClearColor*(self: MTLRenderPassColorAttachmentDescriptor, color: MTLClearColor)
  {.importcpp: "#->setClearColor(#)".}
proc setLoadAction*(self: MTLRenderPassColorAttachmentDescriptor, action: MTLLoadAction)
  {.importcpp: "#->setLoadAction(#)".}
proc setStoreAction*(self: MTLRenderPassColorAttachmentDescriptor, action: MTLStoreAction)
  {.importcpp: "#->setStoreAction(#)".}

proc makeCommandBuffer*(self: MTLCommandQueue): MTLCommandBuffer
  {.importcpp: "#->commandBuffer()".}

proc makeRenderCommandEncoder*(self: MTLCommandBuffer, rpd: MTLRenderPassDescriptor): MTLRenderCommandEncoder
  {.importcpp: "#->renderCommandEncoder(#)".}
proc presentDrawable*(self: MTLCommandBuffer, drawable: MTLDrawable)
  {.importcpp: "#->presentDrawable(#)".}
proc commit*(self: MTLCommandBuffer)
  {.importcpp: "#->commit()".}

proc setRenderPipelineState*(self: MTLRenderCommandEncoder, ps: MTLRenderPipelineState)
  {.importcpp: "#->setRenderPipelineState(#)".}
proc drawPrimitives*(self: MTLRenderCommandEncoder, pt: MTLPrimitiveType, a, b: cuint)
  {.importcpp: "#->drawPrimitives(#, NS::UInteger(#), NS::UInteger(#))".}
proc endEncoding*(self: MTLRenderCommandEncoder)
  {.importcpp: "#->endEncoding()".}
{.pop.}

{.push header: QUARTZ_CORE.}
type
  CAMetalDrawableObj {.importcpp: "CA::MetalDrawable".} = object
  CAMetalDrawable* = ptr CAMetalDrawableObj

proc texture*(self: CAMetalDrawable): MTLTexture
  {.importcpp: "#->texture()".}
{.pop.}
