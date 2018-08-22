//
//  ChatViewController.swift
//  MCChatModule
//
//  Created by Marco Capano on 20/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation
import MCChatModule

class ExampleChatViewController: MessagesCollectionViewController, MessagesCollectionViewControllerDataSource {
    
    ///The messages to display
    var messages = [MessageType]() {
        didSet {
            //Simple reload mechanism. In a production code we should take care of reloading only portions of it.
            collectionView?.reloadData()
            collectionView?.scrollToItem(at: IndexPath(item: messages.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    override func viewDidLoad() {
        title = "Chat example"
        
        datasource = self
        collectionView?.contentInset.top = 8
        inputBar.inputField.layer.cornerRadius = 14
        inputBar.inputField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
        inputBar.inputField.layer.borderColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0).cgColor
    }
    
    func message(for indexPath: IndexPath) -> MessageType {
        return messages[indexPath.item]
    }
    
    func numberOfMessages() -> Int {
        return messages.count
    }
}
