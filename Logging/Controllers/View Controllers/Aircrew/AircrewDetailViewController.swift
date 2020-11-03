//
//  AircrewDetailViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/29/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AircrewDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    var crewMember: CrewMember?

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var flyingOrigin: UITextField!
    @IBOutlet weak var flightAuthDutyCode: UITextField!
    
    @IBOutlet weak var primary: UITextField!
    @IBOutlet weak var secondary: UITextField!
    @IBOutlet weak var instructor: UITextField!
    @IBOutlet weak var evaluator: UITextField!
    @IBOutlet weak var other: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var srty: UITextField!
    
    @IBOutlet weak var nightPSIE: UITextField!
    @IBOutlet weak var insPIE: UITextField!
    @IBOutlet weak var simIns: UITextField!
    @IBOutlet weak var nvg: UITextField!
    @IBOutlet weak var combatTime: UITextField!
    @IBOutlet weak var combatSrty: UITextField!
    @IBOutlet weak var combatSptTime: UITextField!
    @IBOutlet weak var combatSptSrty: UITextField!
    @IBOutlet weak var resv: UITextField!

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Methods
    
    func setUpViews() {
        guard let crewMember = crewMember else { return }
        
        name.text = "\(crewMember.lastName), \(crewMember.firstName)"
        
        lastName.text = crewMember.lastName
        firstName.text = crewMember.firstName
        ssn.text = crewMember.ssnLast4
        flyingOrigin.text = crewMember.flyingOrigin
        flightAuthDutyCode.text = crewMember.flightAuthDutyCode
        primary.text = crewMember.primary
        secondary.text = crewMember.secondary
        instructor.text = crewMember.instructor
        evaluator.text = crewMember.evaluator
        other.text = crewMember.other
        time.text = crewMember.time
        srty.text = crewMember.srty
        nightPSIE.text = crewMember.nightPSIE
        insPIE.text = crewMember.insPIE
        simIns.text = crewMember.simIns
        nvg.text = crewMember.nvg
        combatTime.text = crewMember.combatTime
        combatSrty.text = crewMember.combatSrty
        combatSptTime.text = crewMember.combatSptTime
        combatSptSrty.text = crewMember.combatSptSrty
        resv.text = crewMember.resvStatus
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
    }
    
} //End
