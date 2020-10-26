//
//  AircrewTableViewCell.swift
//  Logging
//
//  Created by Bethany Morris on 10/22/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AircrewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var flyingOriginLabel: UILabel!
    @IBOutlet weak var flightAuthDutyCodeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setUpViews(member: CrewMember) {
        nameLabel.text = "\(member.lastName), \(member.firstName)"
        ssnLabel.text = member.ssn
        flyingOriginLabel.text = member.flyingOrigin
        flightAuthDutyCodeLabel.text = member.flightAuthDutyCode
    }

    @IBAction func editButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
    }
    
} //End
