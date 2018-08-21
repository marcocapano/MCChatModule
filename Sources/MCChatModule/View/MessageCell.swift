//
//  MessageCell.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

///A cell that displays a text message
class MessageCell: UICollectionViewCell {
    
    ///The textView with the message content.
    lazy var textView: UITextView = {
        let tmp = UITextView()
        tmp.font = UIFont.systemFont(ofSize: 16)
        tmp.translatesAutoresizingMaskIntoConstraints = false
        tmp.textColor = .white
        tmp.backgroundColor = .clear
        tmp.isEditable = false
        
        return tmp
    }()
    
    ///The chat bubble. It wraps the textView.
    lazy var bubbleView: UIView = {
        let tmp = UIView()
        tmp.translatesAutoresizingMaskIntoConstraints = false
        tmp.backgroundColor = .clear
        tmp.layer.cornerRadius = 16
        tmp.layer.masksToBounds = true
        
        return tmp
    }()
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    var bubbleTrailingAnchor: NSLayoutConstraint?
    var bubbleLeadingAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bubbleView)
        addSubview(textView)
        
        textView.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        bubbleView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        bubbleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        bubbleTrailingAnchor = bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        bubbleTrailingAnchor?.isActive = true
        
        bubbleLeadingAnchor = bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        bubbleLeadingAnchor?.isActive = false
        
        bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthAnchor?.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
