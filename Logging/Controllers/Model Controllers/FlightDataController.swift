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
    
    static func create(form: Form781, missionNumber: String, missionSymbol: String, fromICAO: String, toICAO: String, takeOffTime: String, landingTime: String, totalFlightTime: String, touchAndGo: String, fullStop: String, totalLanding: String, sorties: String, specialUse: String, grandTotalFlightTime: String, grandTotalTouchAndGo: String, grandTotalFullStop: String, grandTotalStops: String, grandTotalSorties: String) {
        
        let flight = FlightData(missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTime, landingTime: landingTime, totalFlightTime: totalFlightTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLanding: totalLanding, sorties: sorties, specialUse: specialUse, grandTotalFlightTime: grandTotalFlightTime, grandTotalTouchAndGo: grandTotalTouchAndGo, grandTotalFullStop: grandTotalFullStop, grandTotalStops: grandTotalStops, grandTotalSorties: grandTotalSorties)
        
        Form781Controller.shared.updateFormWith(flight: flight, to: form)
    }
    
} //End
