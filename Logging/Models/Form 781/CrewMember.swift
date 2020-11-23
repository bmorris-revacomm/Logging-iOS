//
//  CrewMember.swift
//  Logging
//
//  Created by Bethany Morris on 10/28/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class CrewMember: Codable {
    
    var lastName: String
    var firstName: String
    var ssnLast4: String
    var flightAuthDutyCode: String
    var flyingOrigin: String
    var primary: String?
    var secondary: String?
    var instructor: String?
    var evaluator: String?
    var other: String?
    var time: String?
    var srty: String?
    var nightPSIE: String?
    var insPIE: String?
    var simIns: String?
    var nvg: String?
    var combatTime: String?
    var combatSrty: String?
    var combatSptTime: String?
    var combatSptSrty: String?
    var resvStatus: String?
    
    init(lastName: String,
         firstName: String,
         ssnLast4: String,
         flightAuthDutyCode: String,
         flyingOrigin: String,
         primary: String? = nil,
         secondary: String? = nil,
         instructor: String? = nil,
         evaluator: String? = nil,
         other: String? = nil,
         time: String? = nil,
         srty: String? = nil,
         nightPSIE: String? = nil,
         insPIE: String? = nil,
         simIns: String? = nil,
         nvg: String? = nil,
         combatTime: String? = nil,
         combatSrty: String? = nil,
         combatSptTime: String? = nil,
         combatSptSrty: String? = nil,
         resvStatus: String? = nil) {
        
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
