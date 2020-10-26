//
//  CrewMemberController.swift
//  Logging
//
//  Created by Bethany Morris on 10/23/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class CrewMemberController {
    
    static let shared = CrewMemberController()
    
    var members = [CrewMember]()
    
    func create(lastName: String, firstName: String, ssn: String, flightAuthDutyCode: String, flyingOrigin: String) {
        let member = CrewMember(lastName: lastName, firstName: firstName, ssn: ssn, flightAuthDutyCode: flightAuthDutyCode, flyingOrigin: flyingOrigin)
        members.append(member)
    }
    
}
