//
//  ContentView.swift
//  avptest2
//
//  Created by qinsi on 2024/3/22.
//

import SwiftUI
import Metal

struct MetalLayerView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        print("makeUIView")
        let metalView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        metalView.backgroundColor = .clear
        context.coordinator.setupMetalLayer(for: metalView)
        return metalView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        print("updateUIView")
        context.coordinator.render() // Trigger initial rendering
    }

    func makeCoordinator() -> Coordinator {
        print("makeCoordinator")
        let coordinator = Coordinator()
        coordinator.startDisplayLink()
        return coordinator
    }

    class Coordinator: NSObject {
        var metalLayer: CAMetalLayer?
        var metalRenderer: CppMetalRendererWrapper
        var displayLink: CADisplayLink?

        override init() {
            self.metalRenderer = CppMetalRendererWrapper()
            let layer = CAMetalLayer()
            layer.device = self.metalRenderer.device()
            layer.pixelFormat = .bgra8Unorm
            layer.framebufferOnly = true
            metalLayer = layer
        }

        func setupMetalLayer(for view: UIView) {
            print("setupMetalLayer forview")
            self.metalLayer!.frame = view.bounds
            view.layer.addSublayer(metalLayer!)
            view.layer.masksToBounds = true
        }

        func render() {
            guard let drawable = metalLayer?.nextDrawable() else { return }
            self.metalRenderer.render(drawable)
        }

        func startDisplayLink() {
            self.displayLink = CADisplayLink(target: self, selector: #selector(step))
            self.displayLink?.add(to: .current, forMode: .default)
        }

        @objc func step(displaylink: CADisplayLink) {
            render()
        }

        func stopDisplayLink() {
            self.displayLink?.invalidate()
            self.displayLink = nil
        }
    }
}

struct ContentView: View {
    var body: some View {
        MetalLayerView()
            .frame(width: 300, height: 300)
            .onAppear {
            }
    }
}

//#Preview(windowStyle: .automatic) {
//    ContentView()
//}
