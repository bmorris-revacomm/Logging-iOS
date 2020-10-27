//
//  CrewMemberController.swift
//  Logging
//
//  Created by Bethany Morris on 10/23/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class CrewMemberController {
    
    //MARK: - CRUD
    
    static func create(form: Form781, lastName: String, firstName: String, ssn: String, flightAuthDutyCode: String, flyingOrigin: String) {
        let crewMember = CrewMember(flyingOrgn: flyingOrigin, ssnLast4: ssn, lastName: lastName, firstName: firstName, flightAuthDutyCode: flightAuthDutyCode, prim: nil, sec: nil, instr: nil, eval: nil, other: nil, time: nil, srty: nil, nightpsie: nil, inspie: nil, siminspie: nil, nvg: nil, combatTime: nil, combatSrty: nil, combatSptTime: nil, combatSptSrty: nil, resvStatus: nil)
        
        Form781Controller.shared.updateFormwith(crewMember: crewMember, to: form)
    }
    
    func delete() {
        
    }
    
} //End
