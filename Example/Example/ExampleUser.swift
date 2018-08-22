//
//  User.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation
import MCChatModule

///An app user.
struct ExampleUser: SenderType {
    
    ///The display name of the user
    var name: String
    
    ///The unique identifier for the user
    var id: ID
}
