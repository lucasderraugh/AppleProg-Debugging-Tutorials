//
//  AppDelegate.swift
//  Lesson 8
//
//  Created by Lucas Derraugh on 1/9/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        let original = Selector("updateLayer")
        let swizzle = Selector("xxx_updateLayer")
        if let widgetClass = NSClassFromString("NSWidgetView"),
            let originalMethod = class_getInstanceMethod(widgetClass, original),
            let swizzleMethod = class_getInstanceMethod(NSView.self, swizzle) {
            method_exchangeImplementations(originalMethod, swizzleMethod)
        }
    }

}

extension NSView {
    @objc func xxx_updateLayer() {
        
        // Calls the original updateLayer
        self.xxx_updateLayer()
        
        guard let dictionary = self.value(forKey: "widgetDefinition") as? [String: Any],
            let widget = dictionary["widget"] as? String,
            let value = (dictionary["value"] as? NSNumber)?.intValue else {
                return
        }
        
        if widget == "kCUIWidgetSwitchFill" {
            layer?.contents = nil
            if value == 0 {
                layer?.backgroundColor = NSColor.red.cgColor
            } else {
                layer?.backgroundColor = NSColor.green.cgColor
            }
        }
    }
}
