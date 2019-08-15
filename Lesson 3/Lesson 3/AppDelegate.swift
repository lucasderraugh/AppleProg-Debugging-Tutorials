//
//  AppDelegate.swift
//  Lesson 3
//
//  Created by Lucas Derraugh on 8/6/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var label: NSTextField!
    var clickCounter = 0
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("applicationDidFinishLaunching")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        print("applicationWillTerminate")
    }
    
    @IBAction func buttonPressed(_ sender: NSButton) {
        label.stringValue = labelText()
    }
    
    func labelText() -> String {
        clickCounter += 1
        return "Number of Clicks: \(clickCounter)"
    }
}

