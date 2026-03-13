import MetalKit
import SwiftUI
import Combine

final class GradientRenderer: NSObject, MTKViewDelegate {
    
    private var device: MTLDevice
    private var commandQueue: MTLCommandQueue
    private var pipelineState: MTLRenderPipelineState
    
    var configuration: GradientConfiguration
    private var startTime: CFAbsoluteTime
    private var isPaused: Bool = false
    private var pauseTime: Float = 0
    
    private let configurationSubject = CurrentValueSubject<GradientConfiguration, Never>(GradientPreset.serendipity.configuration)
    
    var configurationPublisher: AnyPublisher<GradientConfiguration, Never> {
        configurationSubject.eraseToAnyPublisher()
    }
    
    init(configuration: GradientConfiguration = GradientPreset.serendipity.configuration) {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Metal is not supported on this device")
        }
        
        self.device = device
        
        guard let commandQueue = device.makeCommandQueue() else {
            fatalError("Failed to create command queue")
        }
        self.commandQueue = commandQueue
        self.configuration = configuration
        self.startTime = CFAbsoluteTimeGetCurrent()
        
        guard let library = device.makeDefaultLibrary() else {
            fatalError("Failed to create Metal library")
        }
        
        guard let vertexFunction = library.makeFunction(name: "gradientVertex"),
              let fragmentFunction = library.makeFunction(name: "gradientFragment") else {
            fatalError("Failed to find shader functions")
        }
        
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        pipelineDescriptor.colorAttachments[0].isBlendingEnabled = true
        pipelineDescriptor.colorAttachments[0].rgbBlendOperation = .add
        pipelineDescriptor.colorAttachments[0].alphaBlendOperation = .add
        pipelineDescriptor.colorAttachments[0].sourceRGBBlendFactor = .sourceAlpha
        pipelineDescriptor.colorAttachments[0].destinationRGBBlendFactor = .oneMinusSourceAlpha
        pipelineDescriptor.colorAttachments[0].sourceAlphaBlendFactor = .one
        pipelineDescriptor.colorAttachments[0].destinationAlphaBlendFactor = .oneMinusSourceAlpha
        
        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch {
            fatalError("Failed to create pipeline state: \(error)")
        }
        
        super.init()
    }
    
    func pause() {
        isPaused = true
        pauseTime = currentTime()
    }
    
    func resume() {
        isPaused = false
        let elapsed = currentTime() - pauseTime
        startTime += CFAbsoluteTime(elapsed)
    }
    
    func reset() {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func updateConfiguration(_ config: GradientConfiguration) {
        self.configuration = config
        configurationSubject.send(config)
    }
    
    private func currentTime() -> Float {
        if isPaused {
            return pauseTime
        }
        return Float(CFAbsoluteTimeGetCurrent() - startTime) * configuration.animationSpeed
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor,
              let commandBuffer = commandQueue.makeCommandBuffer(),
              let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
            return
        }
        
        let time = currentTime()
        let resolution = SIMD2<Float>(
            Float(view.drawableSize.width),
            Float(view.drawableSize.height)
        )
        
        var uniforms = GradientUniforms(
            time: time,
            resolution: resolution,
            backgroundColor: configuration.backgroundColor,
            grainIntensity: configuration.grainIntensity,
            grainScale: configuration.grainScale,
            blurRadius: configuration.blurRadius,
            saturation: configuration.saturation,
            brightness: configuration.brightness,
            noiseOctaves: Int32(configuration.noiseOctaves),
            flowDistortion: configuration.flowDistortion,
            liquidEffect: configuration.liquidEffect,
            blobCount: Int32(min(configuration.blobs.count, 12)),
            enableStatic: configuration.enableStatic ? 1 : 0,
            transitionSpeed: configuration.transitionSpeed
        )
        
        var blobDataArray: [BlobData] = configuration.blobs.prefix(16).map { blob in
            BlobData(
                color: blob.color,
                position: blob.position,
                targetPosition: blob.targetPosition,
                radius: blob.radius,
                speed: blob.speed,
                phase: blob.phase,
                orbitRadiusX: blob.orbitRadius.x,
                orbitRadiusY: blob.orbitRadius.y,
                transitionMode: blob.transitionMode
            )
        }
        
        if blobDataArray.isEmpty {
            blobDataArray.append(BlobData(
                color: SIMD4<Float>(0, 0, 0, 0),
                position: SIMD2<Float>(0.5, 0.5),
                targetPosition: SIMD2<Float>(0.5, 0.5),
                radius: 0,
                speed: 0,
                phase: 0,
                orbitRadiusX: 0,
                orbitRadiusY: 0,
                transitionMode: 0
            ))
        }
        
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setFragmentBytes(&uniforms, length: MemoryLayout<GradientUniforms>.stride, index: 0)
        renderEncoder.setFragmentBytes(&blobDataArray, length: MemoryLayout<BlobData>.stride * blobDataArray.count, index: 1)
        
        renderEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: 4)
        
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
