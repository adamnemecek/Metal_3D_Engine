//
//  AmbientShader.swift
//  Metal_3D_Engine
//
//  Created by Adrian Krupa on 19.12.2015.
//  Copyright © 2015 Adrian Krupa. All rights reserved.
//

import Foundation

class AmbientShader: Shader {
    
    override func getBuiltInUniformsBufferMetaData() -> BuiltInBuffer.Type {
        return MVP_Simple_Buffer.self
    }
    override func vertexShaderName() -> String {
        return "ambientVertexShader"
    }
    
    override func fragmentShaderName() -> String {
        return "ambientFragmentShader"
    }
        
}