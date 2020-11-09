//
//  FlightListViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/27/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FlightListViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mdsLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var unitChargedLabel: UILabel!
    @IBOutlet weak var harmLocationLabel: UILabel!
    @IBOutlet weak var flightAuthLabel: UILabel!
    @IBOutlet weak var issuingUnitLabel: UILabel!
    
    @IBOutlet weak var missionDataPopUp: UIView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var mdsTextField: UITextField!
    @IBOutlet weak var serialNumTextField: UITextField!
    @IBOutlet weak var unitChargedTextField: UITextField!
    @IBOutlet weak var harmLocationTextField: UITextField!
    @IBOutlet weak var flightAuthTextField: UITextField!
    @IBOutlet weak var issuingUnitTextField: UITextField!
    
    @IBOutlet weak var flightSeqPopUp1: UIView!
    @IBOutlet weak var missionNumber: UITextField!
    @IBOutlet weak var missionSymbol: UITextField!
    @IBOutlet weak var fromICAO: UITextField!
    @IBOutlet weak var toICAO: UITextField!
    @IBOutlet weak var specialUse: UITextField!
    
    @IBOutlet weak var flightSeqPopUp2: UIView!
    @IBOutlet weak var takeOffTime: UITextField!
    @IBOutlet weak var landTime: UITextField!
    @IBOutlet weak var totalTime: UITextField!
    @IBOutlet weak var touchAndGo: UITextField!
    @IBOutlet weak var fullStop: UITextField!
    @IBOutlet weak var totalLandings: UITextField!
    @IBOutlet weak var sorties: UITextField!

    @IBOutlet weak var flightTableView: UITableView!
    @IBOutlet weak var printButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
        
    @IBOutlet weak var grandTotalTime: UILabel!
    @IBOutlet weak var grandTouchGo: UILabel!
    @IBOutlet weak var grandFullStop: UILabel!
    @IBOutlet weak var grandTotal: UILabel!
    @IBOutlet weak var grandSorties: UILabel!
    
    // MARK: - Properties
    
    var takeOffTimeString: String = " "
    var landTimeString: String = " "
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Methods
    
    func setUpViews() {
        loadFromData()
        flightTableView.delegate = self
        flightTableView.dataSource = self
        disableButtons()
        guard let form = Form781Controller.shared.forms.last else { return }
        updateLabels()
        updateGrandTotals(form: form)
    }
    
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
            serialNumTextField.text = form?.serialNumber
            unitChargedTextField.text = form?.unitCharged
            harmLocationTextField.text = form?.harmLocation
            flightAuthTextField.text = form?.flightAuthNum
            issuingUnitTextField.text = form?.issuingUnit
        } else {
            dateTextField.text = Helper().populateDateField()
        }
    }
    
    func updateLabels() {
        guard let form = Form781Controller.shared.forms.last else { return }

        dateLabel.text = form.date
        mdsLabel.text = form.mds
        serialNumberLabel.text = form.serialNumber
        unitChargedLabel.text = form.unitCharged
        harmLocationLabel.text = form.harmLocation
        issuingUnitLabel.text = form.issuingUnit
        flightAuthLabel.text = form.flightAuthNum
    }
    
    func updateGrandTotals(form: Form781) {
        let grandTotalTime = FlightController.calculateTotalTime()
        let grandTouchGo = FlightController.calculateTotalTouchGo()
        let grandFullStop = FlightController.calculateTotalFullStop()
        let grandTotalLandings = FlightController.calculateTotalLandings()
        let grandTotalSorties = FlightController.calculateTotalSorties()
        
        self.grandTotalTime.text = String(grandTotalTime)
        self.grandTouchGo.text = String(grandTouchGo)
        self.grandFullStop.text = String(grandFullStop)
        self.grandTotal.text = String(grandTotalLandings)
        self.grandSorties.text = String(grandTotalSorties)
        
        Form781Controller.shared.updateFormWith(grandTotalTime: grandTotalTime, grandTouchGo: grandTouchGo, grandFullStop: grandFullStop, grandTotalLandings: grandTotalLandings, grandTotalSorties: grandTotalSorties, form: form)
    }
    
    func presentMissionInputErrorAlert() {
        guard let date = dateTextField.text,
              let mds = mdsTextField.text,
              let serialNumber = serialNumTextField.text,
              let unitCharged = unitChargedTextField.text,
              let harmLocation = harmLocationTextField.text,
              let flightAuthNum = flightAuthTextField.text,
              let issuingUnit = issuingUnitTextField.text
        else { return }
        
        Alerts.showInputErrorAlert(on: self) { (_) in
            
            if Form781Controller.shared.formCreated == false {
                Form781Controller.shared.create(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
            } else {
                Form781Controller.shared.updateMissionData(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
            }
            
            self.updateLabels()
            self.missionDataPopUp.isHidden = true
            self.enableButtons()
        }
    }
    
    func presentFlightInputErrorAlert() {
        
        if specialUse.text == "" {
            Helper().highlightRed(textField: specialUse)
        }
        
        guard let form = Form781Controller.shared.forms.last,
              let missionNumber = missionNumber.text,
              let missionSymbol = missionSymbol.text,
              let fromICAO = fromICAO.text,
              let toICAO = toICAO.text,
              let totalTime = totalTime.text,
              let touchAndGo = touchAndGo.text,
              let fullStop = fullStop.text,
              let totalLandings = totalLandings.text,
              let sorties = sorties.text,
              let specialUse = specialUse.text
        else { return }
        
        var flightSeq = "A"
        switch form.flights.count {
        case 2:
            flightSeq = "B"
        case 3:
            flightSeq = "C"
        case 4:
            flightSeq = "D"
        case 5:
            flightSeq = "E"
        case 6:
            flightSeq = "F"
        default:
            flightSeq = "A"
        }
        
        Alerts.showInputErrorAlert(on: self) { (_) in
            
            FlightController.create(form: form, flightSeq: flightSeq, missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: self.takeOffTimeString, landTime: self.landTimeString, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLandings: totalLandings, sorties: sorties, specialUse: specialUse)
            
            self.flightTableView.reloadData()
            self.updateGrandTotals(form: form)
            self.flightSeqPopUp2.isHidden = true
            self.enableButtons()
        }
    }
    
    func disableButtons() {
        flightTableView.isUserInteractionEnabled = false
        printButton.isUserInteractionEnabled = false
        editButton.isUserInteractionEnabled = false
        backButton.isUserInteractionEnabled = false
        continueButton.isUserInteractionEnabled = false
    }
    
    func enableButtons() {
        flightTableView.isUserInteractionEnabled = true
        printButton.isUserInteractionEnabled = true
        editButton.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
        continueButton.isUserInteractionEnabled = true
    }

    // MARK: - Actions
    
    @IBAction func editMissionButtonTapped(_ sender: UIButton) {
        missionDataPopUp.isHidden = false
        disableButtons()
    }
    
    @IBAction func saveMissionDataTapped(_ sender: UIButton) {
        guard let date = dateTextField.text, !date.isEmpty,
              let mds = mdsTextField.text, !mds.isEmpty,
              let serialNumber = serialNumTextField.text, !serialNumber.isEmpty,
              let unitCharged = unitChargedTextField.text, !unitCharged.isEmpty,
              let harmLocation = harmLocationTextField.text, !harmLocation.isEmpty,
              let flightAuthNum = flightAuthTextField.text, !flightAuthNum.isEmpty,
              let issuingUnit = issuingUnitTextField.text, !issuingUnit.isEmpty
        else { return presentMissionInputErrorAlert() }
        
        if Form781Controller.shared.formCreated == false {
            Form781Controller.shared.create(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
        } else {
            Form781Controller.shared.updateMissionData(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
        }
        
        updateLabels()
        missionDataPopUp.isHidden = true
        enableButtons()
    }
    
    @IBAction func popUpNextButtonTapped(_ sender: UIButton) {
        flightSeqPopUp2.isHidden = false
        flightSeqPopUp1.isHidden = true
    }
    
    @IBAction func popUpBackButtonTapped(_ sender: UIButton) {
        flightSeqPopUp1.isHidden = false
        flightSeqPopUp2.isHidden = true
    }
    
    @IBAction func newFlightButtonTapped(_ sender: UIButton) {
        flightSeqPopUp1.isHidden = false
        disableButtons()
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        missionDataPopUp.isHidden = true
        flightSeqPopUp1.isHidden = true
        flightSeqPopUp2.isHidden = true
        enableButtons()
    }
    
    @IBAction func calculateTotalTime(_ sender: Any) {    
        if Helper().checkInput(time: takeOffTime.text!) {
            takeOffTimeString = takeOffTime.text!
            Helper().highlightGray(textField: takeOffTime)
            
            if Helper().checkInput(time: landTime.text!) {
                landTimeString = landTime.text!
                Helper().highlightGray(textField: landTime)
                
                let decimalTime = Helper().vmCalculateTotalTime(takeOffTime: takeOffTime, landTime: landTime)
                totalTime.text = decimalTime
            } else {
                if landTime.text == ""{
                    landTime.text = ""
                    totalTime.text = " "
                    Helper().highlightRed(textField: landTime)
                    Alerts.showTimeErrorAlert(on: self)
                } else {
                    Helper().highlightRed(textField: landTime)
                    Alerts.showTimeErrorAlert(on: self)
                }
            }
        } else {
            if takeOffTime.text == ""{
                takeOffTime.text = ""
                totalTime.text = ""
                Helper().highlightRed(textField: takeOffTime)
                Alerts.showTimeErrorAlert(on: self)
            } else {
                Helper().highlightRed(textField: takeOffTime)
                Alerts.showTimeErrorAlert(on: self)
            }
        }
    }
        
    @IBAction func calculateTotalLandings(_sender: Any) {
        //Here's where we do the math for filling in the total field
        totalLandings.text = Helper().vmCalculateLandings(touchAndGo: touchAndGo, fullStop: fullStop)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func saveFlightButtonTapped(_ sender: UIButton) {
        guard let form = Form781Controller.shared.forms.last else { return }
        guard form.flights.count < 6 else { return Alerts.showFlightsErrorAlert(on: self) }
                
        guard let missionNumber = missionNumber.text, !missionNumber.isEmpty,
              let missionSymbol = missionSymbol.text, !missionSymbol.isEmpty,
              let fromICAO = fromICAO.text, !fromICAO.isEmpty,
              let toICAO = toICAO.text, !toICAO.isEmpty,
              let totalTime = totalTime.text,!totalTime.isEmpty,
              let touchAndGo = touchAndGo.text, !touchAndGo.isEmpty,
              let fullStop = fullStop.text, !fullStop.isEmpty,
              let totalLandings = totalLandings.text, !totalLandings.isEmpty,
              let sorties = sorties.text, !sorties.isEmpty,
              let specialUse = specialUse.text, !specialUse.isEmpty
        else { return presentFlightInputErrorAlert() }
        
        var flightSeq = "A"
        switch form.flights.count {
        case 1:
            flightSeq = "B"
        case 2:
            flightSeq = "C"
        case 3:
            flightSeq = "D"
        case 4:
            flightSeq = "E"
        case 5:
            flightSeq = "F"
        default:
            flightSeq = "A"
        }
        
        FlightController.create(form: form, flightSeq: flightSeq, missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTimeString, landTime: landTimeString, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLandings: totalLandings, sorties: sorties, specialUse: specialUse)
        
        flightTableView.reloadData()
        updateGrandTotals(form: form)
        flightSeqPopUp2.isHidden = true
        enableButtons()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Aircrew", bundle: nil).instantiateViewController(withIdentifier: "Page1") as? AircrewViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        dateTextField.resignFirstResponder()
        mdsTextField.resignFirstResponder()
        serialNumTextField.resignFirstResponder()
        unitChargedTextField.resignFirstResponder()
        harmLocationTextField.resignFirstResponder()
        flightAuthTextField.resignFirstResponder()
        issuingUnitTextField.resignFirstResponder()
        
        missionNumber.resignFirstResponder()
        missionSymbol.resignFirstResponder()
        fromICAO.resignFirstResponder()
        toICAO.resignFirstResponder()
        specialUse.resignFirstResponder()
        
        takeOffTime.resignFirstResponder()
        landTime.resignFirstResponder()
        totalTime.resignFirstResponder()
        touchAndGo.resignFirstResponder()
        fullStop.resignFirstResponder()
        totalLandings.resignFirstResponder()
        sorties.resignFirstResponder()
    }
    
} //End

// MARK: - TableView Delegate

extension FlightListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Form781Controller.shared.forms.last?.flights.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.flightTableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as? FlightTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self
        if let flight = Form781Controller.shared.forms.last?.flights[indexPath.row] {
            cell.setUpViews(flight: flight)
        }
        
        return cell
    }
    
} //End

// MARK: - TableViewCell Delegate

extension FlightListViewController: FlightTableViewCellDelegate {
    
    func editButtonTapped(cell: FlightTableViewCell) {
        
    }
    
    func deleteButtonTapped(cell: FlightTableViewCell) {
        guard let form = Form781Controller.shared.forms.last,
              let indexPath = flightTableView.indexPath(for: cell) else { return }
        let flight = form.flights[indexPath.row]
        Form781Controller.shared.remove(flight: flight, from: form)
        flightTableView.reloadData()
        print("Deleted flight")
        
        updateGrandTotals(form: form)
    }
    
} //End
