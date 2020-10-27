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
    var serialNo: String
    var unitCharged: String
    var harmLocation: String
    
    var flightData: [FlightData]
    var crewMembers: [CrewMember]
    
    init(date: String,
        mds: String,
        serialNo: String,
        unitCharged: String,
        harmLocation: String,
        flightData: [FlightData],
        crewMembers: [CrewMember]
    ) {
        self.date = date
        self.mds = mds
        self.serialNo = serialNo
        self.unitCharged = unitCharged
        self.harmLocation = harmLocation
        self.flightData = flightData
        self.crewMembers = crewMembers
    }
    
} //End
