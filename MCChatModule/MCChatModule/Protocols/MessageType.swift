//
//  MessageType.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation

//we do the same for the message

///Defines the interface for a message.
public protocol MessageType {
    var text: String { get }
    var sender: SenderType { get }
}
