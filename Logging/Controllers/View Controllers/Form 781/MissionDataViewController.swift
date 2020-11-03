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
        loadFromData()
    }
    
    // MARK: - Actions
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        dateTextField.resignFirstResponder()
        MDS.resignFirstResponder()
        serialNumber.resignFirstResponder()
        unitCharged.resignFirstResponder()
        harmLocation.resignFirstResponder()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let date = dateTextField.text, !date.isEmpty,
              let mds = MDS.text, !mds.isEmpty,
              let serialNumber = serialNumber.text, !serialNumber.isEmpty,
              let unitCharged = unitCharged.text, !unitCharged.isEmpty,
              let harmLocation = harmLocation.text, !harmLocation.isEmpty,
              let flightAuthNum = flightAuthNum.text, !flightAuthNum.isEmpty,
              let issuingUnit = issuingUnit.text, !issuingUnit.isEmpty
        else { return }//Alerts.showErrorAlert(on: self, storyboardName: "Form781", identifier: "Page1", destinationVC: FlightListViewController) }
        
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
    
    func loadFromData(){
        do {
            try Form781Controller.shared.load()
        } catch {
            print(Form781Error.FileNotFound)
        }
        
        let form = Form781Controller.shared.forms.last
        if Helper().checkForFile(filePath: Form781Controller.shared.fileURL()){
            dateTextField.text = form?.date
            MDS.text = form?.mds
            serialNumber.text = form?.serialNumber
            unitCharged.text = form?.unitCharged
            harmLocation.text = form?.harmLocation
            flightAuthNum.text = form?.flightAuthNum
            issuingUnit.text = form?.issuingUnit
        } else {
            dateTextField.text = Helper().populateDateField()
        }
    }

} //End
