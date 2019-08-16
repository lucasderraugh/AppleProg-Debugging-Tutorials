//
//  AppDelegate.swift
//  Lesson 4
//
//  Created by Lucas Derraugh on 8/14/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = TableViewController()
    }
}

