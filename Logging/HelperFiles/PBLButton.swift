//
//  PBLButton.swift
//  Logging
//
//  Created by Bethany Morris on 10/9/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class PBLButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addCornerRadius(self.frame.size.height/2)
        self.backgroundColor = .fog
        self.setTitleColor(.slate, for: .normal)
    }
    
}

class PBLButtonDark: PBLButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .slate
        self.setTitleColor(.white, for: .normal)
    }
    
}
