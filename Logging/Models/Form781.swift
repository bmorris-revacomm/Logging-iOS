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
    
    var flightData: [FlightData]
    var crewMembers: [CrewMember]
    
    init(date: String,
        mds: String,
        serialNumber: String,
        unitCharged: String,
        harmLocation: String,
        flightAuthNum: String,
        issuingUnit: String,
        flightData: [FlightData] = [],
        crewMembers: [CrewMember] = []
    ) {
        self.date = date
        self.mds = mds
        self.serialNumber = serialNumber
        self.unitCharged = unitCharged
        self.harmLocation = harmLocation
        self.flightAuthNum = flightAuthNum
        self.issuingUnit = issuingUnit
        self.flightData = flightData
        self.crewMembers = crewMembers
    }
    
} //End
