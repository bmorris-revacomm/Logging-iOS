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
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Outlets
    
    //Page 1
    @IBOutlet weak var Date: UITextField!
    @IBOutlet weak var MDS: UITextField!
    @IBOutlet weak var serialNmber: UITextField!
    @IBOutlet weak var unitChargedForFlyingHours: UITextField!
    @IBOutlet weak var harmLocation: UITextField!
    
    //Page 2
    @IBOutlet weak var missionNumber: UITextField!
    @IBOutlet weak var missionSymbol: UITextField!
    @IBOutlet weak var fromICAO: UITextField!
    @IBOutlet weak var toICAO: UITextField!
    
    //Page 3
    @IBOutlet weak var takeOffTime: UITextField!
    @IBOutlet weak var landingTime: UITextField!
    @IBOutlet weak var totalTime: UITextField!
    
    @IBOutlet weak var touchAndGo: UITextField!
    @IBOutlet weak var fullStop: UITextField!
    @IBOutlet weak var totalLanding: UITextField!
    @IBOutlet weak var sorties:UITextField!
    @IBOutlet weak var specialUse: UITextField!
    
    @IBOutlet weak var grandTotalTime: UITextField!
    @IBOutlet weak var grandTotalTouchAndGo: UITextField!
    @IBOutlet weak var grandTotalFullStop: UITextField!
    @IBOutlet weak var grandTotalLanding: UITextField!
    @IBOutlet weak var grandTotalSorties: UITextField!
    @IBOutlet weak var grandTotalSpecialUse: UITextField!
    
    @IBOutlet weak var line6a01: UITextField!
    @IBOutlet weak var line6a02: UITextField!
    @IBOutlet weak var line6a03: UITextField!
    @IBOutlet weak var line6a04: UITextField!
    @IBOutlet weak var line6a05: UITextField!
    @IBOutlet weak var line6a06: UITextField!
    @IBOutlet weak var line6a07: UITextField!
    @IBOutlet weak var line6a08: UITextField!
    @IBOutlet weak var line6a09: UITextField!
    @IBOutlet weak var line6a10: UITextField!
    @IBOutlet weak var line6a11: UITextField!
    @IBOutlet weak var line6a12: UITextField!
    
    @IBOutlet weak var line6b01: UITextField!
    @IBOutlet weak var line6b02: UITextField!
    @IBOutlet weak var line6b03: UITextField!
    @IBOutlet weak var line6b04: UITextField!
    @IBOutlet weak var line6b05: UITextField!
    @IBOutlet weak var line6b06: UITextField!
    @IBOutlet weak var line6b07: UITextField!
    @IBOutlet weak var line6b08: UITextField!
    @IBOutlet weak var line6b09: UITextField!
    @IBOutlet weak var line6b10: UITextField!
    @IBOutlet weak var line6b11: UITextField!
    @IBOutlet weak var line6b12: UITextField!
    
    @IBOutlet weak var line6c01: UITextField!
    @IBOutlet weak var line6c02: UITextField!
    @IBOutlet weak var line6c03: UITextField!
    @IBOutlet weak var line6c04: UITextField!
    @IBOutlet weak var line6c05: UITextField!
    @IBOutlet weak var line6c06: UITextField!
    @IBOutlet weak var line6c07: UITextField!
    @IBOutlet weak var line6c08: UITextField!
    @IBOutlet weak var line6c09: UITextField!
    @IBOutlet weak var line6c10: UITextField!
    @IBOutlet weak var line6c11: UITextField!
    @IBOutlet weak var line6c12: UITextField!
    
    @IBOutlet weak var line6d01: UITextField!
    @IBOutlet weak var line6d02: UITextField!
    @IBOutlet weak var line6d03: UITextField!
    @IBOutlet weak var line6d04: UITextField!
    @IBOutlet weak var line6d05: UITextField!
    @IBOutlet weak var line6d06: UITextField!
    @IBOutlet weak var line6d07: UITextField!
    @IBOutlet weak var line6d08: UITextField!
    @IBOutlet weak var line6d09: UITextField!
    @IBOutlet weak var line6d10: UITextField!
    @IBOutlet weak var line6d11: UITextField!
    @IBOutlet weak var line6d12: UITextField!
    
    @IBOutlet weak var line6e01: UITextField!
    @IBOutlet weak var line6e02: UITextField!
    @IBOutlet weak var line6e03: UITextField!
    @IBOutlet weak var line6e04: UITextField!
    @IBOutlet weak var line6e05: UITextField!
    @IBOutlet weak var line6e06: UITextField!
    @IBOutlet weak var line6e07: UITextField!
    @IBOutlet weak var line6e08: UITextField!
    @IBOutlet weak var line6e09: UITextField!
    @IBOutlet weak var line6e10: UITextField!
    @IBOutlet weak var line6e11: UITextField!
    @IBOutlet weak var line6e12: UITextField!
    
    @IBOutlet weak var line6f01: UITextField!
    @IBOutlet weak var line6f02: UITextField!
    @IBOutlet weak var line6f03: UITextField!
    @IBOutlet weak var line6f04: UITextField!
    @IBOutlet weak var line6f05: UITextField!
    @IBOutlet weak var line6f06: UITextField!
    @IBOutlet weak var line6f07: UITextField!
    @IBOutlet weak var line6f08: UITextField!
    @IBOutlet weak var line6f09: UITextField!
    @IBOutlet weak var line6f10: UITextField!
    @IBOutlet weak var line6f11: UITextField!
    @IBOutlet weak var line6f12: UITextField!
    
    //Page 4
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var SSN: UILabel!
    @IBOutlet weak var flyingOrigin: UILabel!
    @IBOutlet weak var flightAuthDutyCode: UILabel!
    
    @IBOutlet weak var primary: UITextField!
    @IBOutlet weak var secondary: UITextField!
    @IBOutlet weak var instructor: UITextField!
    @IBOutlet weak var evaluator: UITextField!
    @IBOutlet weak var other: UITextField!
    
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var acSortie: UITextField!
    
    @IBOutlet weak var night: UITextField!
    @IBOutlet weak var ins: UITextField!
    @IBOutlet weak var simIns: UITextField!
    @IBOutlet weak var nav: UITextField!
    
    @IBOutlet weak var combatTime: UITextField!
    @IBOutlet weak var combatSortie: UITextField!
    @IBOutlet weak var combatSptTime: UITextField!
    @IBOutlet weak var combatSptSortie: UITextField!
    @IBOutlet weak var resvStatus: UITextField!
    
    @IBOutlet weak var maintReview: UITextField!
    @IBOutlet weak var pilotReview: UITextField!
            
    //MARK: - Properties
    
    let fileURL = DiskOperations().generateFileName()
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
        
    @IBAction func addToJSON(_ sender: UITextField) {
        if (Date.text == "") {
            print("date")
            Date.text = FVCVM().populateDateField()
            FVCVM().appendToJSON(jsonFile: fileURL, key: "Date", value: Date.text ?? "date")
        }
            if(sender.tag == tags.count) {
                FVCVM().appendToJSON(jsonFile: fileURL,
                                     key: "\(tags[sender.tag])",
                                     value: "\(sender.text ?? " ")")
            }else {
                FVCVM().appendToJSON(jsonFile: fileURL,
                                     key: "\(tags[sender.tag])",
                                     value: "\(sender.text ?? " ")")
            
            }
    }
    
    @IBAction func calculateTotalLanding(_sender: Any) {
        //Here's where we do the math for filling in the total field
        totalLanding.text = FVCVM().vmCalculateLandings(touchAndGo: touchAndGo, fullStop: fullStop)
    }

    @IBAction func updateForm(_ sender: Any) {
        let txtDecTime = FVCVM().vmUpdateForm(takeOffTime: takeOffTime, landingTime: landingTime)
        totalTime.text = txtDecTime
    }
    
    @IBAction func add_row(_ sender: Any) {
        
        for (index, isPopulated) in line6.enumerated() {
            if !isPopulated {
                switch index {
                case 0:
                    //line = a
                    line6a01.text = missionNumber.text
                    line6a02.text = missionSymbol.text
                    line6a03.text = fromICAO.text
                    line6a04.text = toICAO.text
                    line6a05.text = takeOffTime.text
                    line6a06.text = landingTime.text
                    line6a07.text = totalTime.text
                    line6a08.text = touchAndGo.text
                    line6a09.text = fullStop.text
                    line6a10.text = totalLanding.text
                    line6a11.text = sorties.text
                    line6a12.text = specialUse.text
                    // Add row to JSON
                    //FVCVM().addRowToJSON(jsonFile: fileURL, rowID: "a", missionNumber: missionNumber.text ?? "", missionSymbol: missionSymbol.text ?? "", fromICAO: fromICAO.text ?? "", toICAO: toICAO.text ?? "", takeOffTime: takeOffTime.text ?? "", landingTime: landingTime.text ?? "", totalTime: totalTime.text ?? "", touchAndGo: touchAndGo.text ?? "", fullStop: fullStop.text ?? "", totalLanding: totalLanding.text ?? "", sorties: sorties.text ?? "", specialUse: specialUse.text ?? "")
                    
                    clearFields()
                    line6[0] = true
                    print("Populated line A")
                case 1:
                    //line = b
                    line6b01.text = missionNumber.text
                    line6b02.text = missionSymbol.text
                    line6b03.text = fromICAO.text
                    line6b04.text = toICAO.text
                    line6b05.text = takeOffTime.text
                    line6b06.text = landingTime.text
                    line6b07.text = totalTime.text
                    line6b08.text = touchAndGo.text
                    line6b09.text = fullStop.text
                    line6b10.text = totalLanding.text
                    line6b11.text = sorties.text
                    line6b12.text = specialUse.text
                    clearFields()
                    line6[1] = true
                    print("Populated line B")
                case 2:
                    //line = c
                    line6c01.text = missionNumber.text
                    line6c02.text = missionSymbol.text
                    line6c03.text = fromICAO.text
                    line6c04.text = toICAO.text
                    line6c05.text = takeOffTime.text
                    line6c06.text = landingTime.text
                    line6c07.text = totalTime.text
                    line6c08.text = touchAndGo.text
                    line6c09.text = fullStop.text
                    line6c10.text = totalLanding.text
                    line6c11.text = sorties.text
                    line6c12.text = specialUse.text
                    clearFields()
                    line6[2] = true
                    print("Populated line C")
                case 3:
                    //line = d
                    line6d01.text = missionNumber.text
                    line6d02.text = missionSymbol.text
                    line6d03.text = fromICAO.text
                    line6d04.text = toICAO.text
                    line6d05.text = takeOffTime.text
                    line6d06.text = landingTime.text
                    line6d07.text = totalTime.text
                    line6d08.text = touchAndGo.text
                    line6d09.text = fullStop.text
                    line6d10.text = totalLanding.text
                    line6d11.text = sorties.text
                    line6d12.text = specialUse.text
                    clearFields()
                    line6[3] = true
                    print("Populated line D")
                case 4:
                    //line = e
                    line6e01.text = missionNumber.text
                    line6e02.text = missionSymbol.text
                    line6e03.text = fromICAO.text
                    line6e04.text = toICAO.text
                    line6e05.text = takeOffTime.text
                    line6e06.text = landingTime.text
                    line6e07.text = totalTime.text
                    line6e08.text = touchAndGo.text
                    line6e09.text = fullStop.text
                    line6e10.text = totalLanding.text
                    line6e11.text = sorties.text
                    line6e12.text = specialUse.text
                    clearFields()
                    line6[4] = true
                    print("Populated line E")
                case 5:
                    //line = f
                    line6f01.text = missionNumber.text
                    line6f02.text = missionSymbol.text
                    line6f03.text = fromICAO.text
                    line6f04.text = toICAO.text
                    line6f05.text = takeOffTime.text
                    line6f06.text = landingTime.text
                    line6f07.text = totalTime.text
                    line6f08.text = touchAndGo.text
                    line6f09.text = fullStop.text
                    line6f10.text = totalLanding.text
                    line6f11.text = sorties.text
                    line6f12.text = specialUse.text
                    clearFields()
                    line6[5] = true
                    print("Populated line F")
                default:
                    break
                }
                break
            }
        }
    }
    
    func clearFields(){
        missionNumber.text = ""
        missionSymbol.text = ""
        fromICAO.text = ""
        toICAO.text = ""
        takeOffTime.text = ""
        landingTime.text = ""
        totalTime.text = ""
        touchAndGo.text = ""
        fullStop.text = ""
        totalLanding.text = ""
        sorties.text = ""
        specialUse.text = ""
    }
    
    @IBAction func printButtonTapped(_ sender: UIButton) {
        
        guard let missionNumber = missionNumber.text,
              let missionSymbol = missionSymbol.text,
              let fromICAO = fromICAO.text,
              let toICAO = toICAO.text,
              let takeOffTime = takeOffTime.text,
              let landingTime = landingTime.text,
              let totalTime = totalTime.text,
              let touchAndGo = touchAndGo.text,
              let fullStop = fullStop.text,
              let totalLanding = totalLanding.text,
              let sorties = sorties.text,
              let specialUse = specialUse.text
            else { return }
        
        FVCVM().vmPrint_func(missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTime, landingTime: landingTime, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLanding: totalLanding, sorties: sorties, specialUse: specialUse)
    }
    
    @IBAction func line6aTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.text = line6a01.text
        missionSymbol.text = line6a02.text
        fromICAO.text = line6a03.text
        toICAO.text = line6a04.text
        takeOffTime.text = line6a05.text
        landingTime.text = line6a06.text
        totalTime.text = line6a07.text
        touchAndGo.text = line6a08.text
        fullStop.text = line6a09.text
        totalLanding.text = line6a10.text
        sorties.text = line6a11.text
        specialUse.text = line6a12.text
    }
    
    @IBAction func line6bTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.text = line6b01.text
        missionSymbol.text = line6b02.text
        fromICAO.text = line6b03.text
        toICAO.text = line6b04.text
        takeOffTime.text = line6b05.text
        landingTime.text = line6b06.text
        totalTime.text = line6b07.text
        touchAndGo.text = line6b08.text
        fullStop.text = line6b09.text
        totalLanding.text = line6b10.text
        sorties.text = line6b11.text
        specialUse.text = line6b12.text
    }
    
    @IBAction func line6cTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.text = line6c01.text
        missionSymbol.text = line6c02.text
        fromICAO.text = line6c03.text
        toICAO.text = line6c04.text
        takeOffTime.text = line6c05.text
        landingTime.text = line6c06.text
        totalTime.text = line6c07.text
        touchAndGo.text = line6c08.text
        fullStop.text = line6c09.text
        totalLanding.text = line6c10.text
        sorties.text = line6c11.text
        specialUse.text = line6c12.text
    }
    
    @IBAction func line6dTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.text = line6d01.text
        missionSymbol.text = line6d02.text
        fromICAO.text = line6d03.text
        toICAO.text = line6d04.text
        takeOffTime.text = line6d05.text
        landingTime.text = line6d06.text
        totalTime.text = line6d07.text
        touchAndGo.text = line6d08.text
        fullStop.text = line6d09.text
        totalLanding.text = line6d10.text
        sorties.text = line6d11.text
        specialUse.text = line6d12.text
    }
    
    @IBAction func line6eTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.text = line6e01.text
        missionSymbol.text = line6e02.text
        fromICAO.text = line6e03.text
        toICAO.text = line6e04.text
        takeOffTime.text = line6e05.text
        landingTime.text = line6e06.text
        totalTime.text = line6e07.text
        touchAndGo.text = line6e08.text
        fullStop.text = line6e09.text
        totalLanding.text = line6e10.text
        sorties.text = line6e11.text
        specialUse.text = line6e12.text
    }
    
    @IBAction func line6fTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.text = line6f01.text
        missionSymbol.text = line6f02.text
        fromICAO.text = line6f03.text
        toICAO.text = line6f04.text
        takeOffTime.text = line6f05.text
        landingTime.text = line6f06.text
        totalTime.text = line6f07.text
        touchAndGo.text = line6f08.text
        fullStop.text = line6f09.text
        totalLanding.text = line6f10.text
        sorties.text = line6f11.text
        specialUse.text = line6f12.text
    }
    
    @IBAction func page1Tapped(_ sender: UITapGestureRecognizer) {
        Date.resignFirstResponder()
        MDS.resignFirstResponder()
        serialNmber.resignFirstResponder()
        unitChargedForFlyingHours.resignFirstResponder()
        harmLocation.resignFirstResponder()
    }
    
    @IBAction func page2Tapped(_ sender: UITapGestureRecognizer) {
        missionNumber.resignFirstResponder()
        missionSymbol.resignFirstResponder()
        toICAO.resignFirstResponder()
        fromICAO.resignFirstResponder()
    }
    
    @IBAction func page3Tapped(_ sender: UITapGestureRecognizer) {
        takeOffTime.resignFirstResponder()
        landingTime.resignFirstResponder()
        totalTime.resignFirstResponder()
        touchAndGo.resignFirstResponder()
        fullStop.resignFirstResponder()
        totalLanding.resignFirstResponder()
        sorties.resignFirstResponder()
        specialUse.resignFirstResponder()
    }
    
    @IBAction func page4Tapped(_ sender: UITapGestureRecognizer) {
        primary.resignFirstResponder()
        secondary.resignFirstResponder()
        instructor.resignFirstResponder()
        evaluator.resignFirstResponder()
        other.resignFirstResponder()
        time.resignFirstResponder()
        acSortie.resignFirstResponder()
        night.resignFirstResponder()
        ins.resignFirstResponder()
        simIns.resignFirstResponder()
        nav.resignFirstResponder()
        combatTime.resignFirstResponder()
        combatSortie.resignFirstResponder()
        combatSptTime.resignFirstResponder()
        combatSptSortie.resignFirstResponder()
        resvStatus.resignFirstResponder()
        maintReview.resignFirstResponder()
        pilotReview.resignFirstResponder()
    }
    
    @IBAction func page1BackButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func page2BackButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func page3BackButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func page4BackButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
} //End
