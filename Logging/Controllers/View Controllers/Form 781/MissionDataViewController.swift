//
//  MissionDataViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/27/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class MissionDataViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var MDS: UITextField!
    @IBOutlet weak var serialNumber: UITextField!
    @IBOutlet weak var unitCharged: UITextField!
    @IBOutlet weak var harmLocation: UITextField!
    @IBOutlet weak var flightAuthNum: UITextField!
    @IBOutlet weak var issuingUnit: UITextField!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        dateTextField.resignFirstResponder()
        MDS.resignFirstResponder()
        serialNumber.resignFirstResponder()
        unitCharged.resignFirstResponder()
        harmLocation.resignFirstResponder()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let date = dateTextField.text,
              let mds = MDS.text,
              let serialNumber = serialNumber.text,
              let unitCharged = unitCharged.text,
              let harmLocation = harmLocation.text,
              let flightAuthNum = flightAuthNum.text,
              let issuingUnit = issuingUnit.text
        else { return }
        
        if Form781Controller.shared.currentForm == nil {
            Form781Controller.shared.create(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
            print("Created form")
        } else {
            Form781Controller.shared.updateMissionData(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
            print("Saved form")
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

} //End
