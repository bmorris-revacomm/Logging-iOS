//
//  FirstVCViewModel.swift
//  Logging
//
//  Created by Pete Misik on 10/2/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FVCVM {
    
    let WIDTH: Int = 3300
    let HEIGHT: Int = 2550
    
    let formController = Form781Controller()
    
    func populateDateField() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let date = dateFormatter.string(from: Date())
        
        return date
    }
    
    func checkForFile(filePath: URL) -> Bool {
        print("\(filePath.absoluteString)")
        var strPath = filePath.absoluteString
        strPath = strPath.replacingOccurrences(of: "file://", with: "")
        if FileManager.default.fileExists(atPath: strPath) {
            return true
        } else {
            return false
        }
    }
    
    func decodeJSON(jsonFile: URL) -> FormData {
        var jsonData: Data
        var formData = FormData()
        
        do {
            jsonData = try Data(contentsOf: jsonFile)
            do {
                formData = try JSONDecoder().decode(FormData.self, from: jsonData)
            }catch{
                print("JSON decoder error")
            }
        }catch{
            print("[DEBUG] - decodeJSON - Couldn't read json")
        }
        
        return formData
    }
    
    func encodeJSON(jsonFile: URL, formData: FormData) {
        // Now we need to encode our new object
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let jsonEncoded = try encoder.encode(formData)
            
            DiskOperations().updateFile(line: String(data: jsonEncoded, encoding: .utf8)!, fileURL: jsonFile)
        }catch {
            print("JSON encoding problem")
        }
    }
    
//    func addRowToJSON(jsonFile: URL,
//                      rowID: String,
//                      missionNumber: String,
//                      missionSymbol: String,
//                      fromICAO: String,
//                      toICAO: String,
//                      takeOffTime: String,
//                      landingTime: String,
//                      totalTime: String,
//                      touchAndGo: String,
//                      fullStop: String,
//                      totalLanding: String,
//                      sorties: String,
//                      specialUse: String) {
//        // Function to add a row to JSON when it's added with addRow function
//        // We need to write to the json file when we're done.
//        var flightData = FlightDataModel()
//        flightData.line = rowID
//        flightData.missionNumber = missionNumber
//        flightData.missionSymbol = missionSymbol
//        flightData.fromICAO = fromICAO
//        flightData.toICAO = toICAO
//        flightData.takeOffTime = takeOffTime
//        flightData.landingTime = landingTime
//        flightData.totalFlightTime = totalTime
//        flightData.touchAndGo = touchAndGo
//        flightData.fullStop = fullStop
//        flightData.totalLanding = totalLanding
//        flightData.sorties = sorties
//        flightData.specialUse = specialUse
//        
//        var formData: FormData = decodeJSON(jsonFile: jsonFile)
//            
//        
//        formData.flightData = [flightData]
//        
//        encodeJSON(jsonFile: jsonFile, formData: formData)
//    }
    

    func separateHoursAndMins(strInput: String, pointer: String) -> String {

        let index0 = strInput.index(strInput.startIndex, offsetBy: 0)
        let index1 = strInput.index(strInput.startIndex, offsetBy: 1)
        let index3 = strInput.index(strInput.startIndex, offsetBy: 3)
        let index4 = strInput.index(strInput.startIndex, offsetBy: 4)
        
        if pointer == "hour"{
            return "\(strInput[index0])\(strInput[index1])"
        } else {
            return "\(strInput[index3])\(strInput[index4])"
        }
    }

    func vmCalculateLandings(touchAndGo: UITextField, fullStop: UITextField) -> String{
        // First we need to cast our text in to integers
        var intTouchAndGo: Int = 0
        var intFullStop: Int = 0
        
        if touchAndGo.text! != "" {
            intTouchAndGo = Int(touchAndGo.text!)!
        }
        
        
        if fullStop.text! != "" {
            intFullStop = Int(fullStop.text!)!
        }
        // Can't forget about input validation:
        
        let total = intTouchAndGo + intFullStop
        return "\(total)"
    }

    func vmCalculateGrandTotals(totalTime: String, intTouchAndGo: Int, intFullStop: Int, intSorties: Int) {
        var gTTime: Int = 0
        var gTTAndG: Int = 0
        var gTFS: Int = 0
        var gTLand: Int = 0
        var gTSorties: Int = 0
        var lclTotalTime: Double = 0.0
        
        // I need to draw in the calculated time
        if totalTime != "" {
            
        }
        
    //    if line6e.count == 12 {
    //        gTTime = 0
    //    }
    }

    func vmUpdateForm(takeOffTime: UITextField, landingTime: UITextField) -> String{
        // Thought here is to calculate the flying hours.
        var diffMin: Int = 0
        var diffHrs: Int = 0
        var decMin: Int = 0

        var toHrsStr: String = ""
        var toMinStr: String = ""
        var laHrsStr: String = ""
        var laMinStr: String = ""
        
        var toHrsTime: Int
        var toMinTime: Int
        var laHrsTime: Int
        var laMinTime: Int
        
        
        // Technically, the first thing we should do is count characters to make sure
        
        
        // First thing we need to do is see if someone put in a : by mistake
        let colon = CharacterSet(charactersIn: ":")
        if takeOffTime.text!.rangeOfCharacter(from: colon) != nil {
            let toTime = takeOffTime.text!
            toHrsStr = separateHoursAndMins(strInput: toTime, pointer: "hour")
            toMinStr = separateHoursAndMins(strInput: toTime, pointer: "min")
        } else {
            let toTime = takeOffTime.text!
            let hrIndex0 = toTime.index(toTime.startIndex, offsetBy: 0)
            let hrIndex1 = toTime.index(toTime.startIndex, offsetBy: 1)
            
            let mnIndex0 = toTime.index(toTime.startIndex, offsetBy: 2)
            let mnIndex1 = toTime.index(toTime.startIndex, offsetBy: 3)
            
            let hr0 = toTime[hrIndex0]
            let hr1 = toTime[hrIndex1]
            
            let mn0 = toTime[mnIndex0]
            let mn1 = toTime[mnIndex1]
            
            toHrsStr = "\(hr0)\(hr1)"
            toMinStr = "\(mn0)\(mn1)"
        }
            if landingTime.text!.rangeOfCharacter(from: colon) != nil {
                let laTime = landingTime.text!
                laHrsStr = separateHoursAndMins(strInput: laTime, pointer: "hour")
                laMinStr = separateHoursAndMins(strInput: laTime, pointer: "min")
            } else {
                let laTime = landingTime.text!
                let hrIndex0 = laTime.index(laTime.startIndex, offsetBy: 0)
                let hrIndex1 = laTime.index(laTime.startIndex, offsetBy: 1)
                
                let mnIndex0 = laTime.index(laTime.startIndex, offsetBy: 2)
                let mnIndex1 = laTime.index(laTime.startIndex, offsetBy: 3)
                
                let hr0 = laTime[hrIndex0]
                let hr1 = laTime[hrIndex1]
                
                let mn0 = laTime[mnIndex0]
                let mn1 = laTime[mnIndex1]
                
                laHrsStr = "\(hr0)\(hr1)"
                laMinStr = "\(mn0)\(mn1)"
            }
            
            laHrsTime = Int(laHrsStr)!
            toHrsTime = Int(toHrsStr)!
            
            laMinTime = Int(laMinStr)!
            toMinTime = Int(toMinStr)!
            
            if laHrsTime < toHrsTime {
                diffHrs = (laHrsTime - toHrsTime) + 24
            } else {
                diffHrs = laHrsTime - toHrsTime
            }
            
            if laMinTime < toMinTime {
                diffHrs -= 1
                diffMin = (laMinTime - toMinTime) + 60
            } else {
                diffMin = laMinTime - toMinTime
            }
            
            
            
            if 0...2 ~= diffMin || 58...60 ~= diffMin{
                decMin = 0
            }
            if 3...8 ~= diffMin{
                decMin = 1
            }
            if 9...14 ~= diffMin{
                decMin = 2
            }
            if 15...20 ~= diffMin{
                decMin = 3
            }
            if 21...26 ~= diffMin{
                decMin = 4
            }
            if 27...33 ~= diffMin{
                decMin = 5
            }
            if 34...39 ~= diffMin{
                decMin = 6
            }
            if 40...45 ~= diffMin{
                decMin = 7
            }
            if 46...51 ~= diffMin{
                decMin = 8
            }
            if 52...57 ~= diffMin{
                decMin = 9
            }
            
            // print("\(diffHrs)\(diffMin)")
            
            // return statement here
        
            return "\(diffHrs).\(decMin)"
        }

    func vmPrint_func(missionNumber: String, missionSymbol: String, fromICAO: String, toICAO: String, takeOffTime: String, landingTime: String, totalTime: String, touchAndGo: String, fullStop: String, totalLanding: String, sorties: String, specialUse: String) {
        
        let formImage = UIImage(named: "afto781.jpg")
        let dataImage = generateImage(missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTime: takeOffTime, landingTime: landingTime, totalTime: totalTime, touchAndGo: touchAndGo, fullStop: fullStop, totalLanding: totalLanding, sorties: sorties, specialUse: specialUse)
        
        let size = CGSize(width: WIDTH, height: HEIGHT)
        UIGraphicsBeginImageContext(size)
        
        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        formImage!.draw(in: areaSize)
        dataImage!.draw(in: areaSize, blendMode: .normal, alpha: 0.8)
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.jobName = "781_print"
        printInfo.outputType = .photo
        
        let printController = UIPrintInteractionController.shared
        printController.printInfo = printInfo
        printController.showsNumberOfCopies = false
        
        printController.printingItem = newImage
        
        printController.present(animated: true, completionHandler: nil)

    }


    func generateImage(missionNumber: String, missionSymbol: String, fromICAO: String, toICAO: String, takeOffTime: String, landingTime: String, totalTime: String, touchAndGo: String, fullStop: String, totalLanding: String, sorties: String, specialUse: String) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: WIDTH, height: HEIGHT))
        
        let img = renderer.image { ctx in
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36)
            ]
            
            // Section 1
            let strTail = "89-1192"
            let tailString = NSAttributedString(string: strTail, attributes: attrs)
            tailString.draw(with: CGRect(x: 1035, y: 330, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let msnNumberString = NSAttributedString(string: missionNumber, attributes: attrs)
            msnNumberString.draw(with: CGRect(x: 445, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let msnSymbolString = NSAttributedString(string: missionSymbol, attributes: attrs)
            msnSymbolString.draw(with: CGRect(x: 915, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let fromICAOString = NSAttributedString(string: fromICAO, attributes: attrs)
            fromICAOString.draw(with: CGRect(x: 1135, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let toICAOString = NSAttributedString(string: toICAO, attributes: attrs)
            toICAOString.draw(with: CGRect(x: 1325, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let toTime = NSAttributedString(string: takeOffTime, attributes: attrs)
            toTime.draw(with: CGRect(x: 1525, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let landTime = NSAttributedString(string: landingTime, attributes: attrs)
            landTime.draw(with: CGRect(x: 1710, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let totalTime = NSAttributedString(string: totalTime, attributes: attrs)
            totalTime.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            
            // fix x
            let touchAndGo = NSAttributedString(string: touchAndGo, attributes: attrs)
            touchAndGo.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let fullStop = NSAttributedString(string: fullStop, attributes: attrs)
            fullStop.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let totalLanding = NSAttributedString(string: totalLanding, attributes: attrs)
            totalLanding.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let sorties = NSAttributedString(string: sorties, attributes: attrs)
            sorties.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let specialUse = NSAttributedString(string: specialUse, attributes: attrs)
            specialUse.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            

            // Section 2
            let strOrg = "0016"
            let orgString = NSAttributedString(string: strOrg, attributes: attrs)
            orgString.draw(with: CGRect(x: 325, y: 1225, width: 100, height: 25), options: .usesLineFragmentOrigin, context: nil)
            
            let strLast4 = "1210"
            let last4String = NSAttributedString(string: strLast4, attributes: attrs)
            last4String.draw(with: CGRect(x: 465, y: 1225, width: 100, height: 25), options: .usesLineFragmentOrigin, context: nil)
            
            let strLastName = "Brechbuhl"
            let lastNameString = NSAttributedString(string: strLastName, attributes: attrs)
            lastNameString.draw(with: CGRect(x: 595, y: 1225, width: 100, height: 25), options: .usesLineFragmentOrigin, context: nil)
        }
        
        return img
    }
    
    
    func getPage1Info(date: String) {
        let filepath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let file = "swift/jsonHandler/Sources/jsonHandler/Resources/file.json"
        // let fullpath = "\(filepath)\(file)"
        let fileURL = filepath!.appendingPathComponent("test.json")
    }
    
} //End
