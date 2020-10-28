//
//  FlightDataModel.swift
//  Logging
//
//  Created by Pete Misik on 10/2/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation


class FlightDataModel: Codable {
    
    var line: String
    var missionNumber: String
    var missionSymbol: String
    var fromICAO: String
    var toICAO: String
    var takeOffTime: String
    var landingTime: String
    var totalFlightTime: String
    var touchAndGo: String
    var fullStop: String
    var totalLanding: String
    var sorties: String
    var specialUse: String
    
    public init(line: String,
                missionNumber: String,
                missionSymbol: String,
                fromICAO: String,
                toICAO: String,
                takeOffTime: String,
                landingTime: String,
                totalFlightTime: String,
                touchAndGo: String,
                fullStop: String,
                totalLanding: String,
                sorties: String,
                specialUse: String) {
        
        self.line = line
        self.missionNumber = missionNumber
        self.missionSymbol = missionSymbol
        self.fromICAO = fromICAO
        self.toICAO = toICAO
        self.takeOffTime = takeOffTime
        self.landingTime = landingTime
        self.totalFlightTime = totalFlightTime
        self.touchAndGo = touchAndGo
        self.fullStop = fullStop
        self.totalLanding = totalLanding
        self.sorties = sorties
        self.specialUse = specialUse
    }
    
}
