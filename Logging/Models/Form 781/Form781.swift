//
//  Form781.swift
//  Logging
//
//  Created by Bethany Morris on 10/26/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class Form781: Codable {
    
    var date: String
    var mds: String
    var serialNumber: String
    var unitCharged: String
    var harmLocation: String
    var flightAuthNum: String
    var issuingUnit: String
    
    var grandTotalFlightTime: String?
    var grandTotalTouchAndGo: String?
    var grandTotalFullStop: String?
    var grandTotalStops: String?
    var grandTotalSorties: String?
    
    var flights: [FlightData]
    var crewMembers: [CrewMember]
    
    #warning("TO DO: add maint and pilot review")
    
    init(date: String,
        mds: String,
        serialNumber: String,
        unitCharged: String,
        harmLocation: String,
        flightAuthNum: String,
        issuingUnit: String,
        grandTotalFlightTime: String? = nil,
        grandTotalTouchAndGo: String? = nil,
        grandTotalFullStop: String? = nil,
        grandTotalStops: String? = nil,
        grandTotalSorties: String? = nil,
        flights: [FlightData] = [],
        crewMembers: [CrewMember] = []
    ) {
        self.date = date
        self.mds = mds
        self.serialNumber = serialNumber
        self.unitCharged = unitCharged
        self.harmLocation = harmLocation
        self.flightAuthNum = flightAuthNum
        self.issuingUnit = issuingUnit
        self.grandTotalFlightTime = grandTotalFlightTime
        self.grandTotalTouchAndGo = grandTotalTouchAndGo
        self.grandTotalFullStop = grandTotalFullStop
        self.grandTotalStops = grandTotalStops
        self.grandTotalSorties = grandTotalSorties
        self.flights = flights
        self.crewMembers = crewMembers
    }
    
} //End

extension Form781: Equatable {
    
    //make sure it equals what we want it to
    static func ==(lhs: Form781, rhs: Form781) -> Bool {
        return (lhs.serialNumber == rhs.serialNumber)
    }
    
}
