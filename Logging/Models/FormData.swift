//
//  FormData.swift
//  Logging
//
//  Created by Pete Misik on 10/26/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

struct FormData: Codable {
    var date: String?
    var mds: String?
    var serialNo: String?
    var unitCharged: String?
    var harmLocation: String?
    
    var flightData: FlightData?

    var grandTotalFlightTime: String?
    var grandTotalTouchAndGo: String?
    var grandTotalFullStop: String?
    var grandTotalStops: String?
    var grandTotalSorties: String?
    
    var crewMember: CrewMember?
    
    init(date: String? = nil,
        mds: String? = nil,
        serialNo: String? = nil,
        unitCharged: String? = nil,
        harmLocation: String? = nil,
        flightData: FlightData? = nil,
        grandTotalFlightTime: String? = nil,
        grandTotalTouchAndGo: String? = nil,
        grandTotalFullStop: String? = nil,
        grandTotalStops: String? = nil,
        grandTotalSorties: String? = nil,
        crewMember: CrewMember? = nil
    ) {
        self.date = date
        self.mds = mds
        self.serialNo = serialNo
        self.unitCharged = unitCharged
        self.harmLocation = harmLocation
        self.flightData = flightData
        self.grandTotalFlightTime = grandTotalFlightTime
        self.grandTotalTouchAndGo = grandTotalTouchAndGo
        self.grandTotalFullStop = grandTotalFullStop
        self.grandTotalStops = grandTotalStops
        self.grandTotalSorties = grandTotalSorties
        self.crewMember = crewMember
    }
    
}
