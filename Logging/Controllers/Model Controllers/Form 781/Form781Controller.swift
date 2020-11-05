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
        save()
    }
    
    //populates from previous form
    func populateFlights() {
        let numberOfForms = forms.count
        if numberOfForms > 1 {
            let flightsArray = forms[numberOfForms - 2].flights
            forms.last?.flights = flightsArray
        }
    }
    
    //populates from previous form
    func populateCrewMembers() {
        let numberOfForms = forms.count
        let crewMemberArray = forms[numberOfForms - 2].crewMembers
        forms.last?.crewMembers = crewMemberArray
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
        save()
    }
    
    func updateFormWith(flight: Flight, form: Form781) {
        form.flights.append(flight)
        save()
    }
    
    func updateFormWith(grandTotalTime: Double, grandTouchGo: Int, grandFullStop: Int, grandTotalLandings: Int, grandTotalSorties: Int, form: Form781) {
        form.grandTotalTime = grandTotalTime
        form.grandTotalTouchAndGo = grandTouchGo
        form.grandTotalFullStop = grandFullStop
        form.grandTotalLandings = grandTotalLandings
        form.grandTotalSorties = grandTotalSorties
        save()
    }
    
    func updateFormwith(crewMember: CrewMember, form: Form781) {
        form.crewMembers.append(crewMember)
        save()
    }
    
    // MARK: - Delete
    
    func remove(flight: Flight, from form: Form781) {
        guard let index = form.flights.firstIndex(of: flight) else { return }
        form.flights.remove(at: index)
        save()
    }
    
    func remove(crewMember: CrewMember, from form: Form781) {
        guard let index = form.crewMembers.firstIndex(of: crewMember) else { return }
        form.crewMembers.remove(at: index)
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
            print("There was an error encoding the data: \(error.localizedDescription)")
        }
    }
    
    func loadForms() throws{
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: fileURL())
        forms = try decoder.decode([Form781].self, from: data)
    }
        
} //End
 
