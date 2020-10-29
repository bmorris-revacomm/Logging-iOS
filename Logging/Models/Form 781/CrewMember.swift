//
//  CrewMember.swift
//  Logging
//
//  Created by Bethany Morris on 10/28/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class CrewMember: Codable {
    
    let lastName: String
    let firstName: String
    let ssnLast4: String
    let flightAuthDutyCode: String
    let flyingOrigin: String
    let primary: String
    let secondary: String
    let instructor: String
    let evaluator: String
    let other: String
    let time: String
    let srty: String
    let nightPSIE: String
    let insPIE: String
    let simIns: String
    let nvg: String
    let combatTime: String
    let combatSrty: String
    let combatSptTime: String
    let combatSptSrty: String
    let resvStatus: String
    
    init(lastName: String,
         firstName: String,
         ssnLast4: String,
         flightAuthDutyCode: String,
         flyingOrigin: String,
         primary: String,
         secondary: String,
         instructor: String,
         evaluator: String,
         other: String,
         time: String,
         srty: String,
         nightPSIE: String,
         insPIE: String,
         simIns: String,
         nvg: String,
         combatTime: String,
         combatSrty: String,
         combatSptTime: String,
         combatSptSrty: String,
         resvStatus: String) {
        
        self.lastName = lastName
        self.firstName = firstName
        self.ssnLast4 = ssnLast4
        self.flightAuthDutyCode = flightAuthDutyCode
        self.flyingOrigin = flyingOrigin
        self.primary = primary
        self.secondary = secondary
        self.instructor = instructor
        self.evaluator = evaluator
        self.other = other
        self.time = time
        self.srty = srty
        self.nightPSIE = nightPSIE
        self.insPIE = insPIE
        self.simIns = simIns
        self.nvg = nvg
        self.combatTime = combatTime
        self.combatSrty = combatSrty
        self.combatSptTime = combatSptTime
        self.combatSptSrty = combatSptSrty
        self.resvStatus = resvStatus
    }
    
} //End

extension CrewMember: Equatable {
    
    //make sure it equals what we want it to
    static func ==(lhs: CrewMember, rhs: CrewMember) -> Bool {
        return (lhs.lastName == rhs.lastName) && (lhs.ssnLast4 == rhs.ssnLast4)
    }
    
}
