//
//  CrewMembers.swift
//  Logging
//
//  Created by Pete Misik on 10/26/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

struct CrewMember: Codable {
    let flyingOrgn: String?
    let ssnLast4: String?
    let lastName: String?
    let firstName: String?
    let flightAuthDutyCode: String?
    let prim: String?
    let sec: String?
    let instr: String?
    let eval: String?
    let other: String?
    let time: String?
    let srty: String?
    let nightpsie: String?
    let inspie: String?
    let siminspie: String?
    let nvg: String?
    let combatTime: String?
    let combatSrty: String?
    let combatSptTime: String?
    let combatSptSrty: String?
    let resvStatus: String?
    
    init(flyingOrgn: String? = nil,
            ssnLast4: String? = nil,
            lastName: String? = nil,
            firstName: String? = nil,
            flightAuthDutyCode: String? = nil,
            prim: String? = nil,
            sec: String? = nil,
            instr: String? = nil,
            eval: String? = nil,
            other: String? = nil,
            time: String? = nil,
            srty: String? = nil,
            nightpsie: String? = nil,
            inspie: String? = nil,
            siminspie: String? = nil,
            nvg: String? = nil,
            combatTime: String? = nil,
            combatSrty: String? = nil,
            combatSptTime: String? = nil,
            combatSptSrty: String? = nil,
            resvStatus: String? = nil) {
        self.flyingOrgn = flyingOrgn
        self.ssnLast4 = ssnLast4
        self.lastName = lastName
        self.firstName = firstName
        self.flightAuthDutyCode = flightAuthDutyCode
        self.prim = prim
        self.sec = sec
        self.instr = instr
        self.eval = eval
        self.other = other
        self.time = time
        self.srty = srty
        self.nightpsie = nightpsie
        self.inspie = inspie
        self.siminspie = siminspie
        self.nvg = nvg
        self.combatTime = combatTime
        self.combatSrty = combatSrty
        self.combatSptTime = combatSptTime
        self.combatSptSrty = combatSptSrty
        self.resvStatus = resvStatus
    }
}
