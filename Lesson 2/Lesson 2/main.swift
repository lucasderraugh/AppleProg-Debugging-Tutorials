//
//  main.swift
//  Lesson 2
//
//  Created by Lucas Derraugh on 7/29/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    var name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "\(name): \(age)"
    }
}

let person1 = Person(name: "Lucas", age: 25)
let person2 = Person(name: "Laura", age: 28)
let person3 = Person(name: "Lee", age: 30)

let people = [person1, person2, person3]

for p in people {
    print(p)
}

let age = 60

func name() {
    let myAge = 20
    print(myAge)
}

name()
print(age)

var i = 0
while i < 4 {
    i += 1
    print(i)
}
