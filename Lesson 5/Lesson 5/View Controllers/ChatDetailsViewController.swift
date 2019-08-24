//
//  ChatDetailsViewController.swift
//  Lesson 5
//
//  Created by Lucas Derraugh on 8/22/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ChatDetailsViewController: NSViewController {
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var messagesLabel: NSTextField!
    @IBOutlet weak var favoriteButton: Toggle!
    
    let chat: Chat
    let favorited: (Bool) -> Void

    init(chat: Chat, favorited: @escaping (Bool) -> Void) {
        self.chat = chat
        self.favorited = favorited
        super.init(nibName: "ChatDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        nameLabel.stringValue = chat.name
        messagesLabel.stringValue = chat.messages.joined(separator: "\n")
        favoriteButton.state = chat.favorite ? .on : .off
        favoriteButton.buttonPressed = favorited(_:)
    }
    
    private func favorited(_ state: NSControl.StateValue) {
        let isFavorite = (state == .on)
        favorited(isFavorite)
    }
}
