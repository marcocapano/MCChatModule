//
//  InputBarDelegate.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///Defines the interface for the object that manages the appearance of the input bar.
public protocol InputBarDelegate: class {
    func userWantsToSend(_ textMessage: String)
    func imageForSendButton() -> UIImage
    func textColor() -> UIColor
}
