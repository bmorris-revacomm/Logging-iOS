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
        //self.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        self.addCornerRadius(self.frame.size.height/1.6)
        self.backgroundColor = .fog
        self.setTitleColor(.slate, for: .normal)
        self.tintColor = .clear
    }
        
}

class PBLButtonDark: PBLButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .slate
        self.setTitleColor(.white, for: .normal)
    }
    
}

class PBLButtonLight: PBLButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .mist
        self.setTitleColor(.slate, for: .normal)
    }
    
}
