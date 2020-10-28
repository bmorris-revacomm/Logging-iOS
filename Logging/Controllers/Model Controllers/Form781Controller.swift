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
    
    var forms = [FormData]()
    var form = FormData()
    
    // MARK: - CRUD
    
    // func create(date: String, mds: String, serialNo: String, unitCharged: String, harmLocation: String, flightData: FlightData, crewMembers: [CrewMember]) {
    func create() {
        forms.append(form)
        save(formData: form)
    }
    
    func update() {
        //update specific form in array
    }
    
    func delete() {
        //delete forms from array
    }
    
    // MARK: - Persistance
    
    func fileURL() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Logging.json")
        return fileURL
    }
    
    func save(formData: FormData) {
        self.forms.append(formData)
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(forms)
            try data.write(to: fileURL())
        } catch {
            print("There was an error encoding the data: \(error.localizedDescription)")
        }
    }
    
    func load() -> FormData {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            forms = try decoder.decode([FormData].self, from: data)
        } catch {
            print("There was an error decoding the data: \(error.localizedDescription)")
        }
        return forms[0]
    }
    
} //End
