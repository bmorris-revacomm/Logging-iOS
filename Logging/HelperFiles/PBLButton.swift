//
//  PBLButton.swift
//  Logging
//
//  Created by Bethany Morris on 10/9/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

//12.9in iPad Pro has screen height of 1366

class PBLButtonClear: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.setTitleColor(.slate, for: .normal)
        self.updateFont(to: FontNames.dmSansRegular, size: UIScreen.main.bounds.height/56.9)
    }
    
    func updateFont(to font: String, size: CGFloat) {
        //guard let size = self.titleLabel?.font.pointSize else { return }
        self.titleLabel?.font = UIFont(name: font, size: size)
    }
}

class PBLButton: PBLButtonClear {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Screen height: \(UIScreen.main.bounds.height)")
        print("Button height: \(UIScreen.main.bounds.height/21.3)")
        print("Button font size: \(UIScreen.main.bounds.height/68.3)")
        
        ///Divided by 21.3 because that is aproximately 64px in height for the largest ipad screen
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/21.3).isActive = true
        self.frame.size.height = UIScreen.main.bounds.height/21.3
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        self.addCornerRadius(self.frame.size.height/2)
        self.backgroundColor = .fog
        self.tintColor = .clear
        self.updateFont(to: FontNames.dmSansBold, size: UIScreen.main.bounds.height/68.3)
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

class PBLOverviewButton: PBLButtonClear {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .mist
        self.setTitleColor(.slate, for: .normal)
        self.tintColor = .slate
        self.contentHorizontalAlignment = .left
        self.contentEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 0)
        
        self.layer.shadowColor = UIColor.fog.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 2
    }
}

class PBLPrintButton: PBLButtonClear {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateFont(to: FontNames.dmSansBold, size: UIScreen.main.bounds.height/97.6)
    }
}
