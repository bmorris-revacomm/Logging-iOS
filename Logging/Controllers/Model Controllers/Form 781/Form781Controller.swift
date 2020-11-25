//
//  Form781Controller.swift
//  Logging
//
//  Created by Bethany Morris on 10/26/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

import Foundation

class Form781Controller {
    
    // MARK: - Singleton
    
    static let shared = Form781Controller()
    
    // MARK: - Properties
    
    var forms = [Form781]()
    var formCreated = false
    
    // MARK: - Create
    
    func create(date: String, mds: String, serialNumber: String, unitCharged: String, harmLocation: String, flightAuthNum: String, issuingUnit: String) {
        let form = Form781(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
        forms.append(form)
        formCreated = true
        populateFlights()
        populateCrewMembers()
        NSLog("Created form")
        save()
    }
    
    //populates from previous form
    func populateFlights() {
        let numberOfForms = forms.count
        if numberOfForms > 1 {
            let flightsArray = forms[numberOfForms - 2].flights
            forms.last?.flights = flightsArray
            NSLog("Populated flights")
        }
    }
    
    //populates from previous form
    func populateCrewMembers() {
        let numberOfForms = forms.count
        if numberOfForms > 1 {
            let crewMemberArray = forms[numberOfForms - 2].crewMembers
            forms.last?.crewMembers = crewMemberArray
            NSLog("Populated crew members")
        }
    }
    
    // MARK: - Update
    
    func updateMissionData(date: String, mds: String, serialNumber: String, unitCharged: String, harmLocation: String, flightAuthNum: String, issuingUnit: String) {
        
        guard let form = forms.last else { return }
        form.date = date
        form.mds = mds
        form.serialNumber = serialNumber
        form.unitCharged = unitCharged
        form.harmLocation = harmLocation
        form.flightAuthNum = flightAuthNum
        form.issuingUnit = issuingUnit
        NSLog("Updated mission data")
        save()
    }
    
    func updateFormWith(flight: Flight, form: Form781) {
        form.flights.append(flight)
        NSLog("Added flight")
        save()
    }
    
    func updateFormWith(grandTotalTime: Double, grandTouchGo: Int, grandFullStop: Int, grandTotalLandings: Int, grandTotalSorties: Int, form: Form781) {
        form.grandTotalTime = grandTotalTime
        form.grandTotalTouchAndGo = grandTouchGo
        form.grandTotalFullStop = grandFullStop
        form.grandTotalLandings = grandTotalLandings
        form.grandTotalSorties = grandTotalSorties
        NSLog("Updated grand totals")
        save()
    }
    
    func updateFormwith(crewMember: CrewMember, form: Form781) {
        form.crewMembers.append(crewMember)
        NSLog("Added crew member")
        save()
    }
    
    func updateCrewMember(crewMember: CrewMember, lastName: String, firstName: String, ssnLast4: String, flightAuthDutyCode: String, flyingOrigin: String, primary: String, secondary: String, instructor: String, evaluator: String, other: String, time: String, srty: String, nightPSIE: String, insPIE: String, simIns: String, nvg: String, combatTime: String, combatSrty: String, combatSptTime: String, combatSptSrty: String, resvStatus: String) {
        
        crewMember.lastName = lastName
        crewMember.firstName = firstName
        crewMember.ssnLast4 = ssnLast4
        crewMember.flyingOrigin = flyingOrigin
        crewMember.flightAuthDutyCode = flightAuthDutyCode
        crewMember.primary = primary
        crewMember.secondary = secondary
        crewMember.instructor = instructor
        crewMember.evaluator = evaluator
        crewMember.other = other
        crewMember.time = time
        crewMember.srty = srty
        crewMember.nightPSIE = nightPSIE
        crewMember.insPIE = insPIE
        crewMember.simIns = simIns
        crewMember.nvg = nvg
        crewMember.combatTime = combatTime
        crewMember.combatSrty = combatSrty
        crewMember.combatSptTime = combatSptTime
        crewMember.combatSptSrty = combatSptSrty
        crewMember.resvStatus = resvStatus
                
        NSLog("Updated crew member")
        save()
    }
    
    // MARK: - Delete
    
    func remove(flight: Flight, from form: Form781) {
        guard let index = form.flights.firstIndex(of: flight) else { return }
        form.flights.remove(at: index)
        updateFlightSeqLetters()
        NSLog("Removed flight")
        save()
    }
    
    func updateFlightSeqLetters() {
        guard let flights = forms.last?.flights else { return }
        for (index, flight) in flights.enumerated() {
            
            switch index {
            case 0:
                flight.flightSeq = "A"
            case 1:
                flight.flightSeq = "B"
            case 2:
                flight.flightSeq = "C"
            case 3:
                flight.flightSeq = "D"
            case 4:
                flight.flightSeq = "E"
            case 5:
                flight.flightSeq = "F"
            default:
                flight.flightSeq = ""
            }
        }
    }
    
    func remove(crewMember: CrewMember, from form: Form781) {
        guard let index = form.crewMembers.firstIndex(of: crewMember) else { return }
        form.crewMembers.remove(at: index)
        NSLog("Removed crew member")
        save()
    }
    
    func delete() {
        //delete form from array
    }
    
    // MARK: - Persistance
    
    func fileURL() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Logging.json")
        //print("File URL: \(fileURL)")
        return fileURL
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(forms)
            try data.write(to: fileURL())
        } catch {
            NSLog("There was an error encoding the data: \(error.localizedDescription)")
        }
    }
    
    func loadForms() throws{
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: fileURL())
        forms = try decoder.decode([Form781].self, from: data)
    }
        
} //End
 
