//
//  Material.swift
//  Metal_3D_Engine
//
//  Created by Adrian Krupa on 08.12.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

import Foundation
import MetalKit

class Material {
    
    var pipelineStateDescriptor: MTLRenderPipelineDescriptor! = nil
    var pipelineState: MTLRenderPipelineState! = nil
    
    var uniformBuffer: MTLBuffer! = nil
    
    init(vertexProgram: String, fragmentProgram: String) {
        
        let defaultLibrary = ViewController.device.newDefaultLibrary()!
        
        let fragmentProgram = defaultLibrary.newFunctionWithName(fragmentProgram)!
        let vertexProgram = defaultLibrary.newFunctionWithName(vertexProgram)!
        
        pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = MTLPixelFormat.BGRA8Unorm
        pipelineStateDescriptor.sampleCount = 1
        pipelineStateDescriptor.vertexDescriptor = Vertex.vertexDescriptor
        initialize()
    }
    
    init(pipelineStateDescriptor: MTLRenderPipelineDescriptor) {
        self.pipelineStateDescriptor = pipelineStateDescriptor
        initialize()
    }
    
    private func initialize() {
        do {
            try pipelineState = ViewController.device.newRenderPipelineStateWithDescriptor(pipelineStateDescriptor)
        } catch let error {
            print("Failed to create pipeline state, error \(error)")
        }
    }
    
}