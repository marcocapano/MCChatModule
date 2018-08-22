//
//  ExampleInputDelegate.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit
import MCChatModule

///Example of implamentation of the InputBarDelegate
class ExampleInputBarDelegate: InputBarDelegate {
    
    var vc: ExampleChatViewController?
    var user: ExampleUser?

    func textColor() -> UIColor {
        return UIColor.black
    }
    
    func userWantsToSend(_ textMessage: String) {
        vc?.messages.append(ExampleMessage(text: textMessage, sender: user!))
        vc?.inputBar.inputField.resignFirstResponder()
        vc?.collectionView?.scrollToItem(at: IndexPath(item: (vc?.messages.count)! - 1, section: 0), at: .bottom, animated: true)
    }
    
    func imageForSendButton() -> UIImage {
        return #imageLiteral(resourceName: "sendIcon")
    }
}


