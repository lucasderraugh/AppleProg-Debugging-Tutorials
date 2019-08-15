//
//  main.swift
//  Lesson 1
//
//  Created by Lucas Derraugh on 7/25/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Foundation

class Bar: NSObject {
    
    override var description: String {
        return "Bar Description"
    }
    
    override var debugDescription: String {
        return "Bar Debug Description"
    }
}

class Foo: CustomStringConvertible, CustomDebugStringConvertible {
    let name = "Lucas"
    let age = 25
    
    var description: String {
        return "Foo Description"
    }
}

extension CustomDebugStringConvertible {
    var debugDescription: String {
        let className = type(of: self)
        let address = "\(Unmanaged.passUnretained(self as AnyObject).toOpaque())"
        var description = "<\(className): \(address), {"
        
        let mirror = Mirror(reflecting: self)
        description += mirror.children.compactMap {
            let (label, value) = $0
            guard let propertyName = label else { return nil }
            return "\(propertyName): \(value)"
        }.joined(separator: ", ")
        
        description += "}>"
        
        return description
    }
}

let bar = Bar()
let foo = Foo()

print(bar)
debugPrint(bar)

print(foo)
debugPrint(foo)
