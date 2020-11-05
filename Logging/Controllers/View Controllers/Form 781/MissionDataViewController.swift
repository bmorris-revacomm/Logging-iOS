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
    @IBOutlet weak var mdsTextField: UITextField!
    @IBOutlet weak var serialNumberTextField: UITextField!
    @IBOutlet weak var unitChargedTextField: UITextField!
    @IBOutlet weak var harmLocationTextField: UITextField!
    @IBOutlet weak var flightAuthNumTextField: UITextField!
    @IBOutlet weak var issuingUnitTextField: UITextField!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromData()
    }
    
    // MARK: - Methods
    
    func loadFromData(){
        do {
            try Form781Controller.shared.loadForms()
        } catch {
            print(Form781Error.FileNotFound)
        }
        
        let form = Form781Controller.shared.forms.last
        if Helper().checkForFile(filePath: Form781Controller.shared.fileURL()){
            dateTextField.text = form?.date
            mdsTextField.text = form?.mds
            serialNumberTextField.text = form?.serialNumber
            unitChargedTextField.text = form?.unitCharged
            harmLocationTextField.text = form?.harmLocation
            flightAuthNumTextField.text = form?.flightAuthNum
            issuingUnitTextField.text = form?.issuingUnit
        } else {
            dateTextField.text = Helper().populateDateField()
        }
    }
    
    func presentAlert() {
        guard let date = dateTextField.text,
              let mds = mdsTextField.text,
              let serialNumber = serialNumberTextField.text,
              let unitCharged = unitChargedTextField.text,
              let harmLocation = harmLocationTextField.text,
              let flightAuthNum = flightAuthNumTextField.text,
              let issuingUnit = issuingUnitTextField.text
        else { return }
        
        Alerts.showTextFieldsAlert(on: self) { (_) in
            
            if Form781Controller.shared.formCreated == false {
                Form781Controller.shared.create(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
                print("Created form")
            } else {
                Form781Controller.shared.updateMissionData(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
                print("Saved form")
            }
            
            if let viewController = UIStoryboard(name: "Form781", bundle: nil).instantiateViewController(withIdentifier: "FlightList") as? FlightListViewController {
                if let navigator = self.navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        dateTextField.resignFirstResponder()
        mdsTextField.resignFirstResponder()
        serialNumberTextField.resignFirstResponder()
        unitChargedTextField.resignFirstResponder()
        harmLocationTextField.resignFirstResponder()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let date = dateTextField.text, !date.isEmpty,
              let mds = mdsTextField.text, !mds.isEmpty,
              let serialNumber = serialNumberTextField.text, !serialNumber.isEmpty,
              let unitCharged = unitChargedTextField.text, !unitCharged.isEmpty,
              let harmLocation = harmLocationTextField.text, !harmLocation.isEmpty,
              let flightAuthNum = flightAuthNumTextField.text, !flightAuthNum.isEmpty,
              let issuingUnit = issuingUnitTextField.text, !issuingUnit.isEmpty
        else { return presentAlert() }
        
        if Form781Controller.shared.formCreated == false {
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
