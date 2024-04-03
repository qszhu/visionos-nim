import lib/metalcpp



type
  NimMetalRendererObj {.exportc: "NimMetalRenderer".} = object
    device*: MTLDevice
    commandQueue: MTLCommandQueue
    pipelineState: MTLRenderPipelineState
  NimMetalRenderer = ref NimMetalRendererObj

proc setupMetal(self: NimMetalRenderer) =
  var pool = initNSAutoreleasePool()

  self.device = MTLCreateSystemDefaultDevice()
  self.commandQueue = self.device.newCommandQueue()

  pool.release()

proc setupRenderPipeline(self: NimMetalRenderer) =
  var pool = initNSAutoreleasePool()

  var err: NSError = nil
  let defaultLibrary = self.device.newDefaultLibrary()
  let vertexFunction = defaultLibrary.newFunction(NSStringAscii("vertexShader"))
  let fragmentFunction = defaultLibrary.newFunction(NSStringAscii("fragmentShader"))
  let pipelineDescriptor = initMTLRenderPipelineDescriptor()
  pipelineDescriptor.setVertexFunction(vertexFunction)
  pipelineDescriptor.setFragmentFunction(fragmentFunction)
  pipelineDescriptor.colorAttachments().objectAt(0).setPixelFormat(MTLPixelFormatBGRA8Unorm)
  self.pipelineState = self.device.newRenderPipelineState(pipelineDescriptor, addr(err))

  pool.release()

proc newNimMetalRenderer*(): NimMetalRenderer {.exportc.} =
  result.new
  result.setupMetal
  result.setupRenderPipeline

proc render*(self: NimMetalRenderer, drawable: CAMetalDrawable) {.exportc.} =
  var pool = initNSAutoreleasePool()

  let renderPassDescriptor = initMTLRenderPassDescriptor()
  renderPassDescriptor.colorAttachments().objectAt(0).setTexture(drawable.texture())
  renderPassDescriptor.colorAttachments().objectAt(0).setClearColor(MTLClearColorMake(0.5, 0.5, 0.5, 1.0))
  renderPassDescriptor.colorAttachments().objectAt(0).setLoadAction(MTLLoadActionClear)
  renderPassDescriptor.colorAttachments().objectAt(0).setStoreAction(MTLStoreActionStore)

  let commandBuffer = self.commandQueue.makeCommandBuffer()
  let renderEncoder = commandBuffer.makeRenderCommandEncoder(renderPassDescriptor)
  renderEncoder.setRenderPipelineState(self.pipelineState)
  renderEncoder.drawPrimitives(MTLPrimitiveTypeTriangle, 0, 3)
  renderEncoder.endEncoding()

  commandBuffer.presentDrawable(cast[MTLDrawable](drawable))
  commandBuffer.commit()

  renderPassDescriptor.release

  pool.release
