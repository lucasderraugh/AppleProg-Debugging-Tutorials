//
//  AppDelegate.swift
//  Lesson 6
//
//  Created by Lucas Derraugh on 9/26/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    let queue1 = DispatchQueue(label: "com.lucas.lesson6.queue1")

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var count = 0
        queue1.async {
            for _ in 0..<1000 {
                count += 1
            }
        }

        for _ in 0..<1000 {
            count += 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("Count: ", count)
        }
    }
}

