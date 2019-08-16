//
//  TableViewController.swift
//  Lesson 4
//
//  Created by Lucas Derraugh on 8/14/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class TableViewController: NSViewController {}

extension TableViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return SystemIcons.names.count
    }
}

extension TableViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "IconTableCell"), owner: self) as? NSTableCellView else {
            return nil
        }
        let iconName = SystemIcons.names[row]
        cell.imageView?.image = NSImage(named: iconName)
        cell.textField?.stringValue = iconName
        
        return cell
    }
}
