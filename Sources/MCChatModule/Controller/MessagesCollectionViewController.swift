//
//  MessagesCollectionViewController.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

open class MessagesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    ///The input bar where the user can type.
    public lazy var inputBar = InputBar()
    
    ///The delegate of the collectionView. It is needed, so it crashes if not set.
    public weak var delegate: MessagesCollectionViewControllerDelegate!
    
    ///The datasource of the collectionView. It is needed, so it crashes if not set.
    public weak var datasource: MessagesCollectionViewControllerDataSource!

    ///We return true so that the inputBar shows up.
    override open var canBecomeFirstResponder: Bool { return true }
    
    ///We set out inputBar as the accessoryView so that we get keyboard-avoidance behavior for free.
    override open var inputAccessoryView: UIView? { return inputBar }
    
    override open func viewWillAppear(_ animated: Bool) {
        becomeFirstResponder()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(MessageCell.self, forCellWithReuseIdentifier: "messageCell")
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 55, right: 0)
        collectionView?.keyboardDismissMode = .interactive
        collectionView?.contentInsetAdjustmentBehavior = .always
        inputAccessoryView?.insetsLayoutMarginsFromSafeArea = true
        
        assert(datasource != nil, "MessagesCollectionViewControllerDataSource not set.")
    }
    
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        ///This is needed to change cells look when the device rotates
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.numberOfMessages()
    }
    
    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "messageCell", for: indexPath) as? MessageCell else { return UICollectionViewCell() }
        
        //Set the message's text
        let message = datasource.message(for: indexPath)
        cell.textView.text = message.text
        cell.textView.font = delegate.preferredMessagesFont()
        
        //We calculate the needed space and add some more to make it look better.
        cell.bubbleWidthAnchor?.constant = estimateFrameForText(text: message.text).width + 30
        
        //Moving the bubble on the appropriate side.
        if delegate.messageIsFromCurrentUser(message) { //message from me
            cell.bubbleLeadingAnchor?.isActive = false
            cell.bubbleTrailingAnchor?.isActive = true
        } else {
            cell.bubbleLeadingAnchor?.isActive = true
            cell.bubbleTrailingAnchor?.isActive = false
        }
        
        cell.bubbleView.backgroundColor = delegate.color(for: message)
        
        return cell
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //We return an appropriate size based on the message content.
        let message = datasource.message(for: indexPath)
        let height = estimateFrameForText(text: message.text).height + 20
        
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
    
    ///Estimates the space needed to display a text.
    private func estimateFrameForText(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        return NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font : delegate.preferredMessagesFont()], context: nil)
    }
    
}
