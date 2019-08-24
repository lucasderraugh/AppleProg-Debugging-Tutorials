//
//  Toggle.swift
//  Lesson 5
//
//  Created by Lucas Derraugh on 8/22/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class Toggle: NSButton {
    
    var buttonPressed: ((NSControl.StateValue) -> Void)?
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.target = self
        self.action = #selector(buttonPressed(_:))
    }
    
    @objc private func buttonPressed(_ sender: NSButton) {
        buttonPressed?(sender.state)
    }
}
