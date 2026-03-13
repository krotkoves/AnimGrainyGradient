import SwiftUI
import MetalKit

struct MetalGradientView: UIViewRepresentable {
    var renderer: GradientRenderer
    var preferredFPS: Int = 60
    
    func makeUIView(context: Context) -> MTKView {
        let mtkView = MTKView()
        
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Metal not supported")
        }
        
        mtkView.device = device
        mtkView.delegate = renderer
        mtkView.preferredFramesPerSecond = preferredFPS
        mtkView.colorPixelFormat = .bgra8Unorm
        mtkView.clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1)
        mtkView.enableSetNeedsDisplay = false
        mtkView.isPaused = false
        mtkView.framebufferOnly = true
        
        return mtkView
    }
    
    func updateUIView(_ uiView: MTKView, context: Context) {
        uiView.preferredFramesPerSecond = preferredFPS
    }
}
