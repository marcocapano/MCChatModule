//
//  UIColor+Extension.swift
//  MCChatModule
//
//  Created by Marco Capano on 22/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation

extension UIColor {
    func getContrastColor() -> UIColor? {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let a = Double((0.299 * red + 0.587 * green + 0.114 * blue))
        return (a > 0.5) ? UIColor(red: 0, green: 0, blue: 0, alpha: 1) : UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
}
