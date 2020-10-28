//
//  AircrewDataViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/27/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AircrewDataViewController: UIViewController {
    
    // MARK: - Outlets
    
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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
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
    
    @IBAction func page4BackButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAircrewButtonTapped(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Aircrew", bundle: nil).instantiateViewController(withIdentifier: "Page1") as? AircrewViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func saveStuffTapped(_ sender: UIButton) {
        //Form781Controller.shared.create(date: "date", mds: "test", serialNo: "ttt", unitCharged: "testing", harmLocation: "houston", flightData: FlightDataController.shared.flights, crewMembers: CrewMemberController.shared.members)
        print("Saved form")
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
