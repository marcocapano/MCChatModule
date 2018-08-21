//
//  SenderType.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation

public typealias ID = String

///Defines the interface for a message sender.
public protocol SenderType {
    var name: String { get }
    var id: ID { get }
}
