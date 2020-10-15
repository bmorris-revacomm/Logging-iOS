//
//  Writable.swift
//  Logging
//
//  Created by Pete Misik on 10/6/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation

class DiskOperations {
    func generateFileName() -> URL {
        // Get a timestamp and use that for that for the filename
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMddyyyyHHmm"
        
        // Set our filename
        let filename = "AFTO781-\(dateFormatter.string(from: date))"
        let dir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = dir.appendingPathComponent(filename).appendingPathExtension("json")
        
        return fileURL
    }

    
    func updateFile(line: String, fileURL: URL) {
        
        // Read the file
        var fileData: String = readFile(fileURL: fileURL)
        // append to the bottom
        fileData += line
        writeFile(fileURL: fileURL, fileData: fileData)
        
    }
    func writeFile(fileURL: URL, fileData: String) {
        // didn't think about a race condition... so let's work from there
        do {
            try fileData.write(to: fileURL, atomically: true, encoding: .utf8)
        }catch {
            // tried to write to a file that doesn't exist
            FileManager.default.createFile(atPath: fileURL.path, contents: fileData.data(using: .utf8))
        }
    }
    
    func readFile(fileURL: URL) -> String {
        //Create variable to dump data to
        var fileData: String = ""
        // Check to see if file exists
        // if FileManager.default.fileExists(atPath: fileURL.absoluteString){
        do {
            print("File found")
            fileData = try String(contentsOf: fileURL, encoding: .utf8)
            
        }catch {
            print("File read error")
        }
        // print("--> \(fileData)")
        return fileData
    }
}

