//
//  Form781Controller.swift
//  Logging
//
//  Created by Bethany Morris on 10/26/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class Form781Controller {
    
    // MARK: - Singleton & Source of Truth
    
    static let shared = Form781Controller()
    
    var forms = [Form781]()
    
    // MARK: - CRUD
    
    func create(date: String, mds: String, serialNumber: String, unitCharged: String, harmLocation: String, flightAuthNum: String, issuingUnit: String) {
        let form = Form781(date: date, mds: mds, serialNumber: serialNumber, unitCharged: unitCharged, harmLocation: harmLocation, flightAuthNum: flightAuthNum, issuingUnit: issuingUnit)
        forms.append(form)
        save()
    }
    
    func updateFormWith(flight: Flight, form: Form781) {
        form.flights.append(flight)
        save()
    }
    
    func updateFormwith(crewMember: CrewMember, to form: Form781) {
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
        return fileURL
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(forms)
            //print(data.base64EncodedString())
            try data.write(to: fileURL())
        } catch {
            print("There was an error encoding the data: \(error.localizedDescription)")
        }
    }
    
    func load() throws {
        let decoder = JSONDecoder()
//        do {
        guard let data = try? Data(contentsOf: fileURL()) else {
            print("There was an error finding the file")
            throw Form781Error.FileNotFound
        }
        forms = try decoder.decode([Form781].self, from: data)
//        } catch {
//            print("There was an error decoding the data: \(error.localizedDescription)")
//        }
    }
    
    
    func loadFormData() {
        
    }
    
    
    
} //End
