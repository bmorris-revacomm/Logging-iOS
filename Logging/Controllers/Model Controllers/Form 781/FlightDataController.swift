//
//  FlightDataController.swift
//  Logging
//
//  Created by Bethany Morris on 10/26/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class FlightDataController {
    
    // MARK: - CRUD
    
    static func create(form: Form781, flightSeq: String, missionNumber: String, missionSymbol: String, fromICAO: String, toICAO: String, takeOffTime: String, landTime: String, totalTime: String, touchAndGo: String, fullStop: String, totalLandings: String, sorties: String, specialUse: String) {
        
        let flight = FlightData(flightSeq: flightSeq, missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTime, landTime: landTime, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLandings: totalLandings, sorties: sorties, specialUse: specialUse)
        
        Form781Controller.shared.updateFormWith(flight: flight, to: form)
    }
    
    static func delete() {
        //delete flight
    }
    
} //End
