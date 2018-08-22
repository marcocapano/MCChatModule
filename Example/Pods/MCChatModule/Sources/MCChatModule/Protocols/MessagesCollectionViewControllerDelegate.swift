//
//  MessagesCollectionViewControllerDelegate.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///Defines an interface for the object that manages the messages collectionView
public protocol MessagesCollectionViewControllerDelegate: class {
    func color(for message: MessageType) -> UIColor
    func textColor(for message: MessageType) -> UIColor
    func backgroundColorForCollectionView() -> UIColor
    func preferredMessagesFont() -> UIFont
    func messageIsFromCurrentUser(_ message: MessageType) -> Bool
}

///Default implementations
extension MessagesCollectionViewControllerDelegate {
    func color(for message: MessageType) -> UIColor { return .white }
    func textColor(for message: MessageType) -> UIColor { return .white }
    func backgroundColorForCollectionView() -> UIColor { return .white }
    func preferredMessagesFont() -> UIFont { return .preferredFont(forTextStyle: .body) }
}
