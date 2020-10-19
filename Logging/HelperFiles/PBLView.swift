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
        self.backgroundColor = .haze
    }
    
}

class borderView: PBLView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .none
        self.addAccentBorder()
    }
}
