//
//  FlightDataViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/27/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FlightDataViewController: UIViewController {
    
    // MARK: - Properties
    
    var line6 = [false, false, false, false, false, false]
    
    // MARK: - Outlets
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var flightSeq: UITextField!
    @IBOutlet weak var missionNumber: UITextField!
    @IBOutlet weak var missionSymbol: UITextField!
    @IBOutlet weak var fromICAO: UITextField!
    @IBOutlet weak var toICAO: UITextField!
    
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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func newFlightButtonTapped(_ sender: UIButton) {
        popUpView.isHidden = false
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    
   
    
    @IBAction func line6aTapped(_ sender: UITapGestureRecognizer) {
        flightSeq.text = "A"
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
        popUpView.isHidden = false
    }
    
    @IBAction func line6bTapped(_ sender: UITapGestureRecognizer) {
        flightSeq.text = "B"
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
        popUpView.isHidden = false
    }
    
    @IBAction func line6cTapped(_ sender: UITapGestureRecognizer) {
        flightSeq.text = "C"
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
        popUpView.isHidden = false
    }
    
    @IBAction func line6dTapped(_ sender: UITapGestureRecognizer) {
        flightSeq.text = "D"
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
        popUpView.isHidden = false
    }
    
    @IBAction func line6eTapped(_ sender: UITapGestureRecognizer) {
        flightSeq.text = "E"
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
        popUpView.isHidden = false
    }
    
    @IBAction func line6fTapped(_ sender: UITapGestureRecognizer) {
        flightSeq.text = "F"
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
        popUpView.isHidden = false
    }

    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        missionNumber.resignFirstResponder()
        missionSymbol.resignFirstResponder()
        toICAO.resignFirstResponder()
        fromICAO.resignFirstResponder()
        takeOffTime.resignFirstResponder()
        landingTime.resignFirstResponder()
        totalTime.resignFirstResponder()
        touchAndGo.resignFirstResponder()
        fullStop.resignFirstResponder()
        totalLanding.resignFirstResponder()
        sorties.resignFirstResponder()
        specialUse.resignFirstResponder()
    }
    
    @IBAction func addFlightButtonTapped(_ sender: UIButton) {
        
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
                    popUpView.isHidden = true
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
                    popUpView.isHidden = true
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
                    popUpView.isHidden = true
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
                    popUpView.isHidden = true
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
                    popUpView.isHidden = true
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
                    popUpView.isHidden = true
                    print("Populated line F")
                default:
                    break
                }
                break
            }
        }
    }
    
    func clearFields(){
        flightSeq.text = ""
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //End
