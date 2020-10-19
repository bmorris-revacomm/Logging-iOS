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
        self.frame.size.height = 70
        self.borderStyle = .none
        self.backgroundColor = .mist
        self.textColor = .fog
        self.textAlignment = .center
        self.autocapitalizationType = .allCharacters
        self.font = .boldSystemFont(ofSize: 17)
    }
    
}
