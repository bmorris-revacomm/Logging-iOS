//
//  FirstViewController.swift
//  Logging
//
//  Created by Christian Brechbuhl on 7/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
    }
    
    // MARK: - Outlets
    
    //Page 1
    
    
    //Page 2
    
    
    //Page 3
    
    
    //Page 4
    
            
    //MARK: - Properties
    
    let fileURL = DiskOperations().generateFileName()
    
//    var txtMissionNumber: String = "XX-XXXXX"
//    var missionSymbolText: String = ""
//    var fromICAOText: String = ""
//    var toICAOText: String = ""
//    var takeOffTimeText: String = ""
//    var landTimeText: String = ""
//    var TotalTime: Int = 0
//    var txtTakeOffTime: String = ""
//    var txtLandingTime: String = ""
//    var txtDecTime: String = ""
//    var line1: String = ""
//    var line2: String = ""
//    var line3: String = ""
    
    let tags: [String] = [
        "MDS", "Serial #", "Unit Charged", "HARM Location",
        "6a - Mission #", "6a - Mission Symbol", "6a - From (ICAO)",
        "6a - To (ICAO)", "6a - Take Off Time", "6a - Landing Time",
        "6a - Total Time", "6a - Touch & Go", "6a - Full Stop",
        "6a - Sorties", "6a - Total Landings", "6a - Special Use",
        "6b - Mission #", "6b - Mission Symbol", "6b - From (ICAO)",
        "6b - To (ICAO)", "6b - Take Off Time", "6b - Landing Time",
        "6b - Total Time", "6b - Touch & Go", "6b - Full Stop",
        "6b - Sorties", "6b - Special Use", "6c - Mission #",
        "6c - Mission Symbol", "6c - From (ICAO)", "6c - To (ICAO)",
        "6c - Take Off Time", "6c - Landing Time", "6c - Total Time",
        "6c - Touch & Go", "6c - Full Stop", "6c - Total Landing",
        "6c - Sorties", "6c - Special Use", "6d - Mission #",
        "6d - Mission Symbol", "6d - From (ICAO)", "6d - To (ICAO)",
        "6d - Take Off Time", "6d - Landing Time", "6d - Total Time",
        "6d - Touch & Go", "6d - Full Stop", "6d - Total Landing",
        "6d - Sorties", "6d - Special Use", "6e - Mission #", "6e - Mission Symbol",
        "6e - From (ICAO)", "6e - To (ICAO)", "6e - Take Off Time",
        "6e - Landing Time", "6e - Total Time", "6e - Touch & Go",
        "6e - Full Stop", "6e - Total Landing", "6e - Sorties",
        "6e - Special Use", "6f - Mission #", "6f - Mission Symbol",
        "6f - From (ICAO)", "6f - To (ICAO)", "6f - Take Off Time",
        "6f - Landing Time", "6f - Total Time", "6f - Touch & Go",
        "6f - Full Stop", "6f - Total Landing", "6f - Sorties",
        "6f - Special Use", "GrandTotalFlightTime", "GrandTotalTouchAndGo",
        "GrandTotalFullStop", "GrandTotalStops", "GrandTotalSorties"
    ]
    
    //MARK: - Actions
        
//    @IBAction func addToJSON(_ sender: UITextField) {
//        if (dateTextField.text == "") {
//            print("date")
//            dateTextField.text = FVCVM().populateDateField()
//
//            FVCVM().appendToJSON(jsonFile: fileURL, key: "Date", value: dateTextField.text ?? "date")
//        }
//            if(sender.tag == tags.count) {
//                FVCVM().appendToJSON(jsonFile: fileURL,
//                                     key: "\(tags[sender.tag])",
//
//                                     value: "\(sender.text ?? " ")")
//            }else {
//                FVCVM().appendToJSON(jsonFile: fileURL,
//                                     key: "\(tags[sender.tag])",
//                                     value: "\(sender.text ?? " ")")
//
//            }
//    }
    
   
    
//    @IBAction func printButtonTapped(_ sender: UIButton) {
//
//        guard let missionNumber = missionNumber.text,
//              let missionSymbol = missionSymbol.text,
//              let fromICAO = fromICAO.text,
//              let toICAO = toICAO.text,
//              let takeOffTime = takeOffTime.text,
//              let landingTime = landingTime.text,
//              let totalTime = totalTime.text,
//              let touchAndGo = touchAndGo.text,
//              let fullStop = fullStop.text,
//              let totalLanding = totalLanding.text,
//              let sorties = sorties.text,
//              let specialUse = specialUse.text
//            else { return }
//
//        FVCVM().vmPrint_func(missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTime, landingTime: landingTime, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLanding: totalLanding, sorties: sorties, specialUse: specialUse)
//    }
    
} //End
