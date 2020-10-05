//
//  FirstVCViewModel.swift
//  Logging
//
//  Created by Pete Misik on 10/2/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import Foundation
import UIKit

var WIDTH: Int = 3300
var HEIGHT: Int = 2550

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

func vmPrint_func(missionNumber: UITextField, missionSymbol: UITextField, fromICAO: UITextField, toICAO: UITextField, takeOffTimeText: UITextField, landTimeText: UITextField, txtDecTime: UITextField) {
    
    let formImage = UIImage(named: "afto781.jpg")
    let dataImage = generateImage(missionNumber: missionNumber, missionSymbol: missionSymbol, fromICAO: fromICAO, toICAO: toICAO, takeOffTimeText: takeOffTimeText, landTimeText: landTimeText, txtDecTime: txtDecTime)
    
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


func generateImage(missionNumber: UITextField, missionSymbol: UITextField, fromICAO: UITextField, toICAO: UITextField, takeOffTimeText: UITextField, landTimeText: UITextField, txtDecTime: UITextField) -> UIImage? {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: WIDTH, height: HEIGHT))
    
    let img = renderer.image { ctx in
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 36)
        ]
        // Section 1
        let strTail = "89-1192"
        let tailString = NSAttributedString(string: strTail, attributes: attrs)
        tailString.draw(with: CGRect(x: 1035, y: 330, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let msnNumberString = NSAttributedString(string: missionNumber.text!, attributes: attrs)
        msnNumberString.draw(with: CGRect(x: 445, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let msnSymbolString = NSAttributedString(string: missionSymbol.text!, attributes: attrs)
        msnSymbolString.draw(with: CGRect(x: 915, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let fromICAOString = NSAttributedString(string: fromICAO.text!, attributes: attrs)
        fromICAOString.draw(with: CGRect(x: 1135, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let toICAOString = NSAttributedString(string: toICAO.text!, attributes: attrs)
        toICAOString.draw(with: CGRect(x: 1325, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let toTime = NSAttributedString(string: takeOffTimeText.text!, attributes: attrs)
        toTime.draw(with: CGRect(x: 1525, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let landTime = NSAttributedString(string: landTimeText.text!, attributes: attrs)
        landTime.draw(with: CGRect(x: 1710, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
        
        let totalTime = NSAttributedString(string: txtDecTime.text!, attributes: attrs)
        totalTime.draw(with: CGRect(x: 1935, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
        

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
