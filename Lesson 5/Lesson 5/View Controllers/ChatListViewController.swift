//
//  ChatListViewController.swift
//  Lesson 5
//
//  Created by Lucas Derraugh on 8/22/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ChatListViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    var chats = Chat.generateChats()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.doubleAction = #selector(doubleClicked(_:))
    }
    
    @objc func doubleClicked(_ sender: Any) {
        let row = tableView.clickedRow
        guard row >= 0 && row < chats.count else { return }
        
        let chat = chats[row]
        let chatDetailsVC = ChatDetailsViewController(chat: chat, favorited: { favorite in
            chat.favorite = favorite
            self.tableView.reloadData()
        })
        
        guard let cell = tableView.view(atColumn: 0, row: row, makeIfNecessary: false) else { return }
        present(chatDetailsVC, asPopoverRelativeTo: cell.bounds, of: cell, preferredEdge: .maxX, behavior: .transient)
    }
}

extension ChatListViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return chats.count
    }
}

extension ChatListViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: TableCell.identifier, owner: self) as? TableCell else {
            return nil
        }
        
        let chat = chats[row]
        cell.configure(name: chat.name, message: chat.messages.last ?? "", isFavorite: chat.favorite, buttonPressed: { state in
            chat.favorite = (state == .on)
            print(cell)
        })
        
        return cell
    }
}
