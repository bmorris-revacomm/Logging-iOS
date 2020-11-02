//
//  PBLView.swift
//  Logging
//
//  Created by Bethany Morris on 10/15/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class PBLView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addCornerRadius(10)
    }
    
}

class borderView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .none
        self.addAccentBorder()
    }
}

class shadowView: PBLView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .mist
        self.layer.shadowColor = UIColor.notBlack.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
    }
    
}

class circleView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addCornerRadius(self.frame.size.height/2)
    }
    
}
