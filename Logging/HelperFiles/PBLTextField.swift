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
        self.addCornerRadius(0)
        self.backgroundColor = .mist
        self.textColor = .fog
        self.textAlignment = .center
        self.autocapitalizationType = .allCharacters
        self.font = .boldSystemFont(ofSize: 17)
    }
    
}
