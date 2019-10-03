//
//  main.swift
//  Lesson 7
//
//  Created by Lucas Derraugh on 10/2/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Foundation

// Heap Buffer Overflow
let count = 4
let stride = MemoryLayout<CChar>.stride
let alignment = MemoryLayout<CChar>.alignment
let byteCount = stride * count
let mutableRawPtr = UnsafeMutableRawPointer.allocate(byteCount: count, alignment: alignment)

mutableRawPtr.storeBytes(of: 76, as: CChar.self)                          // L
mutableRawPtr.advanced(by: stride).storeBytes(of: 117, as: CChar.self)    // u
mutableRawPtr.advanced(by: stride * 2).storeBytes(of: 99, as: CChar.self) // c
mutableRawPtr.advanced(by: stride * 3).storeBytes(of: 0, as: CChar.self)  // \0

print(String(cString: mutableRawPtr.bindMemory(to: CChar.self, capacity: count)))


// Use after return
//let gameBoard = GameBoardCreate(5, 12)
//print("\(gameBoard.pointee.p1Score) vs \(gameBoard.pointee.p2Score)")


// Use after free
func createRandomNumberBuffer(count: Int, upperBound: UInt32) -> UnsafeMutableBufferPointer<Int> {
    let buffer = UnsafeMutableBufferPointer<Int>.allocate(capacity: count)
    buffer.deallocate()
    for slot in 0..<count {
        buffer[slot] = Int(arc4random_uniform(upperBound))
    }
    return buffer
}

let buffer = createRandomNumberBuffer(count: 5, upperBound: 100)
for (index, element) in buffer.enumerated() {
    print("\(index): \(element)")
}
