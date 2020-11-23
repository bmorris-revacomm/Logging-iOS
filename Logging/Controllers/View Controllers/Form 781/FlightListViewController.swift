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
    
    @IBOutlet weak var missionDateLabel: UILabel!
    @IBOutlet weak var formSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var missionDataView: UIView!
    @IBOutlet weak var aircrewListView: UIView!
    
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
    
    @IBOutlet weak var flightSeqPopUp: UIView!
    @IBOutlet weak var missionNumber: UITextField!
    @IBOutlet weak var missionSymbol: UITextField!
    @IBOutlet weak var fromICAO: UITextField!
    @IBOutlet weak var toICAO: UITextField!
    @IBOutlet weak var specialUse: UITextField!
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
    
    @IBOutlet weak var aircrewTableView: UITableView!
    @IBOutlet weak var aircrewPopUpView: UIView!
    @IBOutlet weak var popUp2View: UIView!
    @IBOutlet weak var popUp3View: UIView!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var flightAuthDutyCode: UITextField!
    @IBOutlet weak var flyingOrigin: UITextField!
    
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
    @IBOutlet weak var resvStatus: UITextField!
    
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
        aircrewTableView.delegate = self
        aircrewTableView.dataSource = self
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

        missionDateLabel.text = "MISSION \(form.date)"
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
        switch form.flights.count + 1 {
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
            self.flightSeqPopUp.isHidden = true
            self.enableButtons()
        }
    }
    
    func highlightMissionData() {
        dateTextField.text == "" ? Helper.highlightRed(textField: dateTextField) : Helper.unhighlight(textField: dateTextField)
        mdsTextField.text == "" ? Helper.highlightRed(textField: mdsTextField) : Helper.unhighlight(textField: mdsTextField)
        serialNumTextField.text == "" ? Helper.highlightRed(textField: serialNumTextField) : Helper.unhighlight(textField: serialNumTextField)
        unitChargedTextField.text == "" ? Helper.highlightRed(textField: unitChargedTextField) : Helper.unhighlight(textField: unitChargedTextField)
        harmLocationTextField.text == "" ? Helper.highlightRed(textField: harmLocationTextField) : Helper.unhighlight(textField: harmLocationTextField)
        flightAuthTextField.text == "" ? Helper.highlightRed(textField: flightAuthTextField) : Helper.unhighlight(textField: flightAuthTextField)
        issuingUnitTextField.text == "" ? Helper.highlightRed(textField: issuingUnitTextField) : Helper.unhighlight(textField: issuingUnitTextField)
    }
    
    func highlightFlightSeq() {
        missionNumber.text == "" ? Helper.highlightRed(textField: missionNumber) : Helper.unhighlight(textField: missionNumber)
        missionSymbol.text == "" ? Helper.highlightRed(textField: missionSymbol) : Helper.unhighlight(textField: missionSymbol)
        fromICAO.text == "" ? Helper.highlightRed(textField: fromICAO) : Helper.unhighlight(textField: fromICAO)
        toICAO.text == "" ? Helper.highlightRed(textField: toICAO) : Helper.unhighlight(textField: toICAO)
        takeOffTime.text == "" ? Helper.highlightRed(textField: takeOffTime) : Helper.unhighlight(textField: takeOffTime)
        landTime.text == "" ? Helper.highlightRed(textField: landTime) : Helper.unhighlight(textField: landTime)
        totalTime.text == "" ? Helper.highlightRed(textField: totalTime) : Helper.unhighlight(textField: totalTime)
        touchAndGo.text == "" ? Helper.highlightRed(textField: touchAndGo) : Helper.unhighlight(textField: touchAndGo)
        fullStop.text == "" ? Helper.highlightRed(textField: fullStop) : Helper.unhighlight(textField: fullStop)
        totalLandings.text == "" ? Helper.highlightRed(textField: totalLandings) : Helper.unhighlight(textField: totalLandings)
        sorties.text == "" ? Helper.highlightRed(textField: sorties) : Helper.unhighlight(textField: sorties)
    }
    
    func unhighlightMissionData() {
        Helper.unhighlight(textField: dateTextField)
        Helper.unhighlight(textField: mdsTextField)
        Helper.unhighlight(textField: serialNumTextField)
        Helper.unhighlight(textField: unitChargedTextField)
        Helper.unhighlight(textField: harmLocationTextField)
        Helper.unhighlight(textField: flightAuthTextField)
        Helper.unhighlight(textField: issuingUnitTextField)
    }
    
    func unhighlightFlightSeq() {
        Helper.unhighlight(textField: missionNumber)
        Helper.unhighlight(textField: missionSymbol)
        Helper.unhighlight(textField: fromICAO)
        Helper.unhighlight(textField: toICAO)
        Helper.unhighlight(textField: specialUse)
        Helper.unhighlight(textField: takeOffTime)
        Helper.unhighlight(textField: landTime)
        Helper.unhighlight(textField: totalTime)
        Helper.unhighlight(textField: touchAndGo)
        Helper.unhighlight(textField: fullStop)
        Helper.unhighlight(textField: totalLandings)
        Helper.unhighlight(textField: sorties)
    }
    
    func disableButtons() {
        flightTableView.isUserInteractionEnabled = false
        printButton.isUserInteractionEnabled = false
        editButton.isUserInteractionEnabled = false
        backButton.isUserInteractionEnabled = false
        continueButton.isUserInteractionEnabled = false
        aircrewTableView.isUserInteractionEnabled = false
    }
    
    func enableButtons() {
        flightTableView.isUserInteractionEnabled = true
        printButton.isUserInteractionEnabled = true
        editButton.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
        continueButton.isUserInteractionEnabled = true
        aircrewTableView.isUserInteractionEnabled = true
    }

    // MARK: - Actions
    
    @IBAction func formSegmentedControlChanged(_ sender: UISegmentedControl) {
        switch formSegmentedControl.selectedSegmentIndex {
        case 0:
            aircrewListView.isHidden = false
            missionDataView.isHidden = true
        case 1:
            missionDataView.isHidden = false
            aircrewListView.isHidden = true
        case 2:
            missionDataView.isHidden = false
            aircrewListView.isHidden = true
        default:
            missionDataView.isHidden = false
            aircrewListView.isHidden = true
        }
    }
    
    @IBAction func editMissionButtonTapped(_ sender: UIButton) {
        unhighlightMissionData()
        missionDataPopUp.isHidden = false
        disableButtons()
    }
    
    @IBAction func saveMissionDataTapped(_ sender: UIButton) {
        highlightMissionData()
        
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
    
    @IBAction func newFlightButtonTapped(_ sender: UIButton) {
        guard let form = Form781Controller.shared.forms.last else { return Alerts.showNoFormAlert(on: self) }
        guard form.flights.count < 6 else { return Alerts.showFlightsErrorAlert(on: self) }
        unhighlightFlightSeq()
        flightSeqPopUp.isHidden = false
        disableButtons()
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        missionDataPopUp.isHidden = true
        flightSeqPopUp.isHidden = true
        aircrewPopUpView.isHidden = true
        popUp2View.isHidden = true
        popUp3View.isHidden = true
        enableButtons()
    }
    
    @IBAction func calculateTotalTime(_ sender: Any) {    
        if Helper().checkInput(time: takeOffTime.text!) {
            takeOffTimeString = takeOffTime.text!
            Helper.unhighlight(textField: takeOffTime)
            
            if Helper().checkInput(time: landTime.text!) {
                landTimeString = landTime.text!
                Helper.unhighlight(textField: landTime)
                
                let decimalTime = Helper().vmCalculateTotalTime(takeOffTime: takeOffTime, landTime: landTime)
                totalTime.text = decimalTime
            } else {
                if landTime.text == "" {
                    landTime.text = ""
                    totalTime.text = ""
                    Helper.highlightRed(textField: landTime)
                    Alerts.showTimeErrorAlert(on: self)
                } else {
                    Helper.highlightRed(textField: landTime)
                    Alerts.showTimeErrorAlert(on: self)
                }
            }
        } else {
            if takeOffTime.text == "" {
                takeOffTime.text = ""
                totalTime.text = ""
                Helper.highlightRed(textField: takeOffTime)
                Alerts.showTimeErrorAlert(on: self)
            } else {
                Helper.highlightRed(textField: takeOffTime)
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
        highlightFlightSeq()
                
        guard let missionNumber = missionNumber.text, !missionNumber.isEmpty,
              let missionSymbol = missionSymbol.text, !missionSymbol.isEmpty,
              let fromICAO = fromICAO.text, !fromICAO.isEmpty,
              let toICAO = toICAO.text, !toICAO.isEmpty,
              let totalTime = totalTime.text,!totalTime.isEmpty,
              let touchAndGo = touchAndGo.text, !touchAndGo.isEmpty,
              let fullStop = fullStop.text, !fullStop.isEmpty,
              let totalLandings = totalLandings.text, !totalLandings.isEmpty,
              let sorties = sorties.text, !sorties.isEmpty,
              let specialUse = specialUse.text
        else { return presentFlightInputErrorAlert() }
                
        var flightSeq = "A"
        switch form.flights.count + 1 {
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
        
        FlightController.create(form: form, flightSeq: flightSeq, missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTimeString, landTime: landTimeString, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLandings: totalLandings, sorties: sorties, specialUse: specialUse)
        
        flightTableView.reloadData()
        updateGrandTotals(form: form)
        flightSeqPopUp.isHidden = true
        enableButtons()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Aircrew", bundle: nil).instantiateViewController(withIdentifier: "Aircrew") as? AircrewListViewController {
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
        
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        ssn.resignFirstResponder()
        flyingOrigin.resignFirstResponder()
        flightAuthDutyCode.resignFirstResponder()
        primary.resignFirstResponder()
        secondary.resignFirstResponder()
        instructor.resignFirstResponder()
        evaluator.resignFirstResponder()
        other.resignFirstResponder()
        time.resignFirstResponder()
        srty.resignFirstResponder()
        nightPSIE.resignFirstResponder()
        insPIE.resignFirstResponder()
        simIns.resignFirstResponder()
        nvg.resignFirstResponder()
        combatTime.resignFirstResponder()
        combatSrty.resignFirstResponder()
        combatSptTime.resignFirstResponder()
        combatSptSrty.resignFirstResponder()
        resvStatus.resignFirstResponder()
    }
    
} //End

// MARK: - FlightTableViewCell Delegate

extension FlightListViewController: FlightTableViewCellDelegate {
    
    func editButtonTapped(cell: FlightTableViewCell) {
        
    }
    
    func deleteButtonTapped(cell: FlightTableViewCell) {
        guard let form = Form781Controller.shared.forms.last,
              let indexPath = flightTableView.indexPath(for: cell) else { return }
        let flight = form.flights[indexPath.row]
        Form781Controller.shared.remove(flight: flight, from: form)
        flightTableView.reloadData()
        
        updateGrandTotals(form: form)
    }
    
} //End

// MARK: - Aircrew View

extension FlightListViewController {
    
    func presentAircrewInputErrorAlert() {
        guard let form = Form781Controller.shared.forms.last,
              let lastName = lastName.text,
              let firstName = firstName.text,
              let ssn = ssn.text,
              let flightAuthDutyCode = flightAuthDutyCode.text,
              let flyingOrigin = flyingOrigin.text
        else { return }
        
        Alerts.showInputErrorAlert(on: self) { (_) in
            
            CrewMemberController.create(form: form, lastName: lastName, firstName: firstName, ssnLast4: ssn, flightAuthDutyCode: flightAuthDutyCode, flyingOrigin: flyingOrigin)
            
            self.aircrewTableView.reloadData()
            self.popUp3View.isHidden = true
            self.enableButtons()
        }
    }
    
    func highlightAircrew() {
        lastName.text == "" ? Helper.highlightRed(textField: lastName) : Helper.unhighlight(textField: lastName)
        firstName.text == "" ? Helper.highlightRed(textField: firstName) : Helper.unhighlight(textField: firstName)
        ssn.text == "" ? Helper.highlightRed(textField: ssn) : Helper.unhighlight(textField: ssn)
        flightAuthDutyCode.text == "" ? Helper.highlightRed(textField: flightAuthDutyCode) : Helper.unhighlight(textField: flightAuthDutyCode)
        flyingOrigin.text == "" ? Helper.highlightRed(textField: flyingOrigin) : Helper.unhighlight(textField: flyingOrigin)
        primary.text == "" ? Helper.highlightRed(textField: primary) : Helper.unhighlight(textField: primary)
        secondary.text == "" ? Helper.highlightRed(textField: secondary) : Helper.unhighlight(textField: secondary)
        instructor.text == "" ? Helper.highlightRed(textField: instructor) : Helper.unhighlight(textField: instructor)
        evaluator.text == "" ? Helper.highlightRed(textField: evaluator) : Helper.unhighlight(textField: evaluator)
        other.text == "" ? Helper.highlightRed(textField: other) : Helper.unhighlight(textField: other)
        time.text == "" ? Helper.highlightRed(textField: time) : Helper.unhighlight(textField: time)
        srty.text == "" ? Helper.highlightRed(textField: srty) : Helper.unhighlight(textField: srty)
        nightPSIE.text == "" ? Helper.highlightRed(textField: nightPSIE) : Helper.unhighlight(textField: nightPSIE)
        insPIE.text == "" ? Helper.highlightRed(textField: insPIE) : Helper.unhighlight(textField: insPIE)
        simIns.text == "" ? Helper.highlightRed(textField: simIns) : Helper.unhighlight(textField: simIns)
        nvg.text == "" ? Helper.highlightRed(textField: nvg) : Helper.unhighlight(textField: nvg)
        combatTime.text == "" ? Helper.highlightRed(textField: combatTime) : Helper.unhighlight(textField: combatTime)
        combatSrty.text == "" ? Helper.highlightRed(textField: combatSrty) : Helper.unhighlight(textField: combatSrty)
        combatSptTime.text == "" ? Helper.highlightRed(textField: combatSptTime) : Helper.unhighlight(textField: combatSptTime)
        combatSptSrty.text == "" ? Helper.highlightRed(textField: combatSptSrty) : Helper.unhighlight(textField: combatSptSrty)
        resvStatus.text == "" ? Helper.highlightRed(textField: resvStatus) : Helper.unhighlight(textField: resvStatus)
    }
    
    func unhighlightAircrew() {
        Helper.unhighlight(textField: lastName)
        Helper.unhighlight(textField: firstName)
        Helper.unhighlight(textField: ssn)
        Helper.unhighlight(textField: flightAuthDutyCode)
        Helper.unhighlight(textField: flyingOrigin)
        Helper.unhighlight(textField: primary)
        Helper.unhighlight(textField: secondary)
        Helper.unhighlight(textField: instructor)
        Helper.unhighlight(textField: evaluator)
        Helper.unhighlight(textField: other)
        Helper.unhighlight(textField: time)
        Helper.unhighlight(textField: srty)
        Helper.unhighlight(textField: nightPSIE)
        Helper.unhighlight(textField: insPIE)
        Helper.unhighlight(textField: simIns)
        Helper.unhighlight(textField: nvg)
        Helper.unhighlight(textField: combatTime)
        Helper.unhighlight(textField: combatSrty)
        Helper.unhighlight(textField: combatSptTime)
        Helper.unhighlight(textField: combatSptSrty)
        Helper.unhighlight(textField: resvStatus)
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        unhighlightAircrew()
        aircrewPopUpView.isHidden = false
        disableButtons()
    }
    
    @IBAction func back2ButtonTapped(_ sender: UIButton) {
        popUp2View.isHidden = true
        aircrewPopUpView.isHidden = false
    }
    
    @IBAction func back3ButtonTapped(_ sender: UIButton) {
        popUp3View.isHidden = true
        popUp2View.isHidden = false
    }
    
    @IBAction func next1ButtonTapped(_ sender: UIButton) {
        aircrewPopUpView.isHidden = true
        popUp2View.isHidden = false
    }
    
    @IBAction func next2ButtonTapped(_ sender: UIButton) {
        popUp2View.isHidden = true
        popUp3View.isHidden = false
    }
    
    @IBAction func addNewAircrewButtonTapped(_ sender: UIButton) {
        highlightAircrew()
        guard let form = Form781Controller.shared.forms.last else { return }
        guard let lastName = lastName.text, !lastName.isEmpty,
              let firstName = firstName.text, !firstName.isEmpty,
              let ssn = ssn.text, !ssn.isEmpty,
              let flightAuthDutyCode = flightAuthDutyCode.text, !flightAuthDutyCode.isEmpty,
              let flyingOrigin = flyingOrigin.text, !flyingOrigin.isEmpty
        else { return presentAircrewInputErrorAlert() }
        
        CrewMemberController.create(form: form, lastName: lastName, firstName: firstName, ssnLast4: ssn, flightAuthDutyCode: flightAuthDutyCode, flyingOrigin: flyingOrigin)
        
        aircrewTableView.reloadData()
        popUp3View.isHidden = true
        enableButtons()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToAircrewDetailVC" {
            guard let indexPath = aircrewTableView.indexPathForSelectedRow, let destinationVC = segue.destination as? AircrewDetailViewController else { return }
            let crewMember = Form781Controller.shared.forms.last?.crewMembers[indexPath.row]
            destinationVC.crewMember = crewMember
            destinationVC.delegate = self
        }
    }
    
} //End

// MARK: - AircrewTableViewCell Delegate

extension FlightListViewController: AircrewTableViewCellDelegate {
    
    func editButtonTapped(cell: AircrewTableViewCell) {
        self.performSegue(withIdentifier: "ToAircrewDetailVC", sender: self)
    }

    func deleteButtonTapped(cell: AircrewTableViewCell) {
        guard let form = Form781Controller.shared.forms.last,
              let indexPath = aircrewTableView.indexPath(for: cell) else { return }
        let crewMember = form.crewMembers[indexPath.row]
        Form781Controller.shared.remove(crewMember: crewMember, from: form)
        aircrewTableView.reloadData()
    }
    
} //End

// MARK: - AircrewDetailView Delegate

extension FlightListViewController: AircrewDetailViewControllerDelegate {

    func exitButtonTapped() {
        navigationController?.dismiss(animated: true, completion: {
            self.aircrewTableView.reloadData()
        })
    }
    
    func saveButtonTapped() {
        navigationController?.dismiss(animated: true, completion: {
            self.aircrewTableView.reloadData()
        })
    }
    
} //End

// MARK: - TableView Delegate

extension FlightListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.flightTableView {
            return Form781Controller.shared.forms.last?.flights.count ?? 0
        }
        if tableView == self.aircrewTableView {
            return Form781Controller.shared.forms.last?.crewMembers.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.flightTableView {
            guard let cell = self.flightTableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as? FlightTableViewCell else { return UITableViewCell() }
            
            cell.delegate = self
            if let flight = Form781Controller.shared.forms.last?.flights[indexPath.row] {
                cell.setUpViews(flight: flight)
            }
            
            return cell
        }
        if tableView == self.aircrewTableView {
            guard let cell = self.aircrewTableView.dequeueReusableCell(withIdentifier: "AircrewCell", for: indexPath) as? AircrewTableViewCell else { return UITableViewCell() }
            
            cell.delegate = self
            if let crewMember = Form781Controller.shared.forms.last?.crewMembers[indexPath.row] {
                cell.setUpViews(crewMember: crewMember)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
} //End
