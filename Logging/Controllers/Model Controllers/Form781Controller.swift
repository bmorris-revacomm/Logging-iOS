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
    
    func create(date: String, mds: String, serialNo: String, unitCharged: String, harmLocation: String, flightData: [FlightData], crewMembers: [CrewMember]) {
        let form = Form781(date: date, mds: mds, serialNo: serialNo, unitCharged: unitCharged, harmLocation: harmLocation, flightData: flightData, crewMembers: crewMembers)
        forms.append(form)
        save()
    }
    
    func updateFormWith(flight: FlightData, to form: Form781) {
        form.flightData.append(flight)
        save()
    }
    
    func updateFormwith(crewMember: CrewMember, to form: Form781) {
        form.crewMembers.append(crewMember)
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
            let data = try encoder.encode(forms)
            //print(data.base64EncodedString())
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
