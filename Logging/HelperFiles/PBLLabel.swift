//
//  PBLLabel.swift
//  Logging
//
//  Created by Bethany Morris on 11/3/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class PBLLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = .slate
        self.updateFont(to: FontNames.dmSansBold)
    }
    
    func updateFont(to font: String) {
        guard let size = self.font?.pointSize else { return }
        self.font = UIFont(name: font, size: size)
    }
    
}

class PBLLabelLight: PBLLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = .fog
    }
    
}

class PBLLabelWhite: PBLLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = .white
    }
    
}
