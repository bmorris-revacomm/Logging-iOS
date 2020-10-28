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

    let fileURL = Form781Controller().fileURL()
    var line6 = [false, false, false, false, false, false]
    
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
        "mds",
        "serialNo",
        "unitCharged",
        "harmLocation",
        "flightData",
        "grandTotalFlightTime",
        "grandTotalTouchAndGo",
        "grandTotalFullStop",
        "grandTotalStops",
        "grandTotalSorties",
        "crewMember"
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
