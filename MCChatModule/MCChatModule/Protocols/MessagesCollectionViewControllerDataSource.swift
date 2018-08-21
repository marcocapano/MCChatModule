//
//  MessagesCollectionViewControllerDataSource.swift
//  MCChatModule
//
//  Created by Marco Capano on 21/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation

public protocol MessagesCollectionViewControllerDataSource: class {
    func message(for indexPath: IndexPath) -> MessageType
    func numberOfMessages() -> Int
}
