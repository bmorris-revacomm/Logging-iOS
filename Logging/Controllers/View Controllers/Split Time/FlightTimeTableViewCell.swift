//
//  FlightTimeTableViewCell.swift
//  Logging
//
//  Created by Bethany Morris on 10/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FlightTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var primary: UILabel!
    @IBOutlet weak var secondary: UILabel!
    @IBOutlet weak var instructor: UILabel!
    @IBOutlet weak var evaluator: UILabel!
    @IBOutlet weak var other: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var srty: UILabel!
    
    func setUpViews(crewMember: CrewMember) {
        name.text = crewMember.lastName
        primary.text = crewMember.primary
        secondary.text = crewMember.secondary
        instructor.text = crewMember.instructor
        evaluator.text = crewMember.evaluator
        other.text = crewMember.other
        time.text = crewMember.time
        srty.text = crewMember.srty
    }

} //End
