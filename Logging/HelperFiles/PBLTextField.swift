//
//  PBLTextField.swift
//  Logging
//
//  Created by Bethany Morris on 10/15/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class PBLTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let superview = superview {
            self.frame.size.height = superview.frame.size.height * 0.06
        }
        self.borderStyle = .none
        self.backgroundColor = .mist
        self.textColor = .slate
        self.textAlignment = .center
        self.autocapitalizationType = .allCharacters
        self.font = .boldSystemFont(ofSize: 17)
    }
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}

class PBLTextFieldBordered: PBLTextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame.size.height = 60
        self.backgroundColor = .white
        self.addAccentBorder()
        self.textAlignment = .left
    }
    
}

class gridTextField: PBLTextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderStyle = .roundedRect
        self.font = .boldSystemFont(ofSize: 10)
    }
}
