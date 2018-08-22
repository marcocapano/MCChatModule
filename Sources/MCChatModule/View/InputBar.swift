//
//  InputBar.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

public class InputBar: UIView {
    
    ///The input textField for the message.
    public lazy var inputField: UITextField = {
        let tmp = UITextField()
        tmp.translatesAutoresizingMaskIntoConstraints = false
        tmp.layer.borderColor = UIColor.gray.cgColor
        tmp.layer.borderWidth = 1.0
        tmp.delegate = self
        
        return tmp
    }()
    
    ///The send button. The image is customizable with InputBarDelegate protocol.
    public lazy var sendButton: UIButton = {
        let tmp = UIButton()
        tmp.translatesAutoresizingMaskIntoConstraints = false
        tmp.addTarget(self, action: #selector(sendWasTapped), for: .touchUpInside)
        
        return tmp
    }()
    
    ///The delegate object responsible of customization and message sending.
    public weak var delegate: InputBarDelegate? {
        didSet {
            sendButton.setImage(delegate?.imageForSendButton(), for: UIControlState.normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
        
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var intrinsicContentSize: CGSize {
        // Calculate intrinsicContentSize that will fit all the text
        let textSize = inputField.sizeThatFits(CGSize(width: inputField.bounds.width, height: .greatestFiniteMagnitude))
        return CGSize(width: bounds.width, height: textSize.height)
    }
    
    ///Positions the subviews of the inputbar.
    private func setupSubviews() {
        autoresizingMask = [.flexibleHeight]
        
        addSubview(inputField)
        inputField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        inputField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
        inputField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        addSubview(sendButton)
        sendButton.centerYAnchor.constraint(equalTo: inputField.centerYAnchor).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        sendButton.heightAnchor.constraint(equalTo: inputField.heightAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalTo: inputField.heightAnchor).isActive = true
        
        inputField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8).isActive = true
        
        backgroundColor = .white
        sendButton.imageView?.contentMode = .scaleAspectFill
        
        inputField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        inputField.leftViewMode = .always
    }
    
    
    ///Clears the textfield and notifies the delegate that the user wants to send a message.
    @objc private func sendWasTapped() {
        guard let text = inputField.text else { return }
        inputField.text = ""
        delegate?.userWantsToSend(text)
    }

}

extension InputBar: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        invalidateIntrinsicContentSize()
        return true
    }
    
}
