//
//  Chat.swift
//  Lesson 5
//
//  Created by Lucas Derraugh on 8/22/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Foundation

class Chat {
    let name: String
    let messages: [String]
    var favorite: Bool
    
    init(sender: String, messages: [String], favorite: Bool) {
        self.name = sender
        self.messages = messages
        self.favorite = favorite
    }
    
    static func generateChats() -> [Chat] {
        var chats = [
            Chat(sender: "Shania", messages: ["Hey Billy!", "I'm having a party."], favorite: false),
            Chat(sender: "Time Zone", messages: ["Speak about destruction.", "Speak about destruction."], favorite: false),
            Chat(sender: "Billie", messages: ["I'm that bad type"], favorite: false),
            Chat(sender: "Calvin", messages: ["Don't blame it on me"], favorite: false)
        ]
        
        var fakeChats = [Chat]()
        fakeChats.reserveCapacity(100)
        for index in 0..<100 {
            fakeChats.append(Chat(sender: "Chat \(index)", messages: ["Message content of chat #\(index)"], favorite: false))
        }
        chats.append(contentsOf: fakeChats)
        
        return chats
    }
}
