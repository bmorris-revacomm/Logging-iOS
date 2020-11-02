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
    
    // MARK: - Singleton & Source of Truth
    
    static let shared = Form781Controller()
    
    var forms = [Form781]()
    
    var currentForm: Form781? {
        didSet {
            guard let form = forms.last, let currentForm = currentForm else { return }
            form.date = currentForm.date
            form.mds = currentForm.mds
            form.serialNumber = currentForm.serialNumber
            form.unitCharged = currentForm.unitCharged
            form.harmLocation = currentForm.harmLocation
            form.flightAuthNum = currentForm.flightAuthNum
            form.issuingUnit = currentForm.issuingUnit
        }
    }
    
    // MARK: - CRUD
    
    func create(date: String, mds: String, serialNumber: String, unitCharged: String, harmLocation: String, flightAuthNum: String, issuingUnit: String) {
        let form = Form781(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
        forms.append(form)
        currentForm = form
        save()
    }
    
    func updateMissionData(date: String, mds: String, serialNumber: String, unitCharged: String, harmLocation: String, flightAuthNum: String, issuingUnit: String) {
        
        guard let currentForm = currentForm else { return }
        
        currentForm.date = date
        currentForm.mds = mds
        currentForm.serialNumber = serialNumber
        currentForm.unitCharged = unitCharged
        currentForm.harmLocation = harmLocation
        currentForm.flightAuthNum = flightAuthNum
        currentForm.issuingUnit = issuingUnit
    }
    
    func updateFormWith(flight: Flight, form: Form781) {
        form.flights.append(flight)
        save()
    }
    
    //save after every flight entered or after continue button?
    func updateFormWith(grandTotalTime: Int, grandTouchGo: Int, grandFullStop: Int, grandTotalLandings: Int, grandTotalSorties: Int, form: Form781) {
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
        print("File URL: \(fileURL)")
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
    
    func load() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            forms = try decoder.decode([Form781].self, from: data)
        } catch {
            print("There was an error decoding the data: \(error.localizedDescription)")
        }
    }
    
} //End
 
