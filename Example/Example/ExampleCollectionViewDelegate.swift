//
//  UserCollectionViewDelegate.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit
import MCChatModule

class ExampleCollectionViewDelegate: MessagesCollectionViewControllerDelegate {
    
    let myID: ID
    var vc: MessagesCollectionViewController?
    
    init(myID: ID) {
        self.myID = myID
    }
    
    func messageIsFromCurrentUser(_ message: MessageType) -> Bool {
        return message.sender.id == myID
    }
    
    func color(for message: MessageType) -> UIColor {
        let me = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1.0)
        let others = UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
        return messageIsFromCurrentUser(message) ? me : others
    }
    
    func textColor(for message: MessageType) -> UIColor {
        return messageIsFromCurrentUser(message) ? .white : UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1.0)
    }
    
    func preferredMessagesFont() -> UIFont {
        return .systemFont(ofSize: 16)
    }
    
    func backgroundColorForCollectionView() -> UIColor {
        return .white
    }
    
}
