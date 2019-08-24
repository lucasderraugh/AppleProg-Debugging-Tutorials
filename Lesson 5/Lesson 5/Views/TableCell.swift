//
//  TableCell.swift
//  Lesson 5
//
//  Created by Lucas Derraugh on 8/22/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class TableCell: NSTableCellView {
    static let identifier = NSUserInterfaceItemIdentifier(rawValue: "TableCellIdentifier")
    
    @IBOutlet private weak var nameLabel: NSTextField!
    @IBOutlet private weak var messageLabel: NSTextField!
    @IBOutlet private weak var toggle: Toggle!
    
    override func prepareForReuse() {
        print("Preparing for reuse with current values: \(nameLabel.stringValue): \(messageLabel.stringValue)")
    }
    
    func configure(name: String, message: String, isFavorite: Bool, buttonPressed: @escaping (NSControl.StateValue) -> Void) {
        nameLabel.stringValue = name
        messageLabel.stringValue = message
        toggle.state = isFavorite ? .on : .off
        toggle.buttonPressed = buttonPressed
    }
}
