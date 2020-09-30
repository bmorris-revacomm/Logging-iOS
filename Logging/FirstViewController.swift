//
//  FirstViewController.swift
//  Logging
//
//  Created by Christian Brechbuhl on 7/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var WIDTH: Int = 3300
    var HEIGHT: Int = 2550
    
    @IBOutlet weak var missionNumber: UITextField!
    @IBOutlet weak var missionSymbol: UITextField!
    @IBOutlet weak var fromICAO: UITextField!
    @IBOutlet weak var toICAO: UITextField!
    @IBOutlet weak var totalTime: UITextField!
    
    @IBOutlet weak var touchAndGo: UITextField!
    @IBOutlet weak var fullStop: UITextField!
    @IBOutlet weak var totalLanding: UITextField!
    @IBOutlet weak var sorties:UITextField!
    
    @IBOutlet weak var takeOffTime: UITextField!
    @IBOutlet weak var landingTime: UITextField!
    
    @IBOutlet weak var specialUse: UITextField!
    
    @IBOutlet weak var line6a01: UITextField!
    @IBOutlet weak var line6a02: UITextField!
    @IBOutlet weak var line6a03: UITextField!
    @IBOutlet weak var line6a04: UITextField!
    @IBOutlet weak var line6a05: UITextField!
    @IBOutlet weak var line6a06: UITextField!
    @IBOutlet weak var line6a07: UITextField!
    @IBOutlet weak var line6a08: UITextField!
    @IBOutlet weak var line6a09: UITextField!
    @IBOutlet weak var line6a10: UITextField!
    @IBOutlet weak var line6a11: UITextField!
    @IBOutlet weak var line6a12: UITextField!
    
    @IBOutlet weak var line6b01: UITextField!
    @IBOutlet weak var line6b02: UITextField!
    @IBOutlet weak var line6b03: UITextField!
    @IBOutlet weak var line6b04: UITextField!
    @IBOutlet weak var line6b05: UITextField!
    @IBOutlet weak var line6b06: UITextField!
    @IBOutlet weak var line6b07: UITextField!
    @IBOutlet weak var line6b08: UITextField!
    @IBOutlet weak var line6b09: UITextField!
    @IBOutlet weak var line6b10: UITextField!
    @IBOutlet weak var line6b11: UITextField!
    @IBOutlet weak var line6b12: UITextField!
    
    @IBOutlet weak var line6c01: UITextField!
    @IBOutlet weak var line6c02: UITextField!
    @IBOutlet weak var line6c03: UITextField!
    @IBOutlet weak var line6c04: UITextField!
    @IBOutlet weak var line6c05: UITextField!
    @IBOutlet weak var line6c06: UITextField!
    @IBOutlet weak var line6c07: UITextField!
    @IBOutlet weak var line6c08: UITextField!
    @IBOutlet weak var line6c09: UITextField!
    @IBOutlet weak var line6c10: UITextField!
    @IBOutlet weak var line6c11: UITextField!
    @IBOutlet weak var line6c12: UITextField!
    
    @IBOutlet weak var line6d01: UITextField!
    @IBOutlet weak var line6d02: UITextField!
    @IBOutlet weak var line6d03: UITextField!
    @IBOutlet weak var line6d04: UITextField!
    @IBOutlet weak var line6d05: UITextField!
    @IBOutlet weak var line6d06: UITextField!
    @IBOutlet weak var line6d07: UITextField!
    @IBOutlet weak var line6d08: UITextField!
    @IBOutlet weak var line6d09: UITextField!
    @IBOutlet weak var line6d10: UITextField!
    @IBOutlet weak var line6d11: UITextField!
    @IBOutlet weak var line6d12: UITextField!
    
    @IBOutlet weak var line6e01: UITextField!
    @IBOutlet weak var line6e02: UITextField!
    @IBOutlet weak var line6e03: UITextField!
    @IBOutlet weak var line6e04: UITextField!
    @IBOutlet weak var line6e05: UITextField!
    @IBOutlet weak var line6e06: UITextField!
    @IBOutlet weak var line6e07: UITextField!
    @IBOutlet weak var line6e08: UITextField!
    @IBOutlet weak var line6e09: UITextField!
    @IBOutlet weak var line6e10: UITextField!
    @IBOutlet weak var line6e11: UITextField!
    @IBOutlet weak var line6e12: UITextField!
    
    @IBOutlet weak var line6f01: UITextField!
    @IBOutlet weak var line6f02: UITextField!
    @IBOutlet weak var line6f03: UITextField!
    @IBOutlet weak var line6f04: UITextField!
    @IBOutlet weak var line6f05: UITextField!
    @IBOutlet weak var line6f06: UITextField!
    @IBOutlet weak var line6f07: UITextField!
    @IBOutlet weak var line6f08: UITextField!
    @IBOutlet weak var line6f09: UITextField!
    @IBOutlet weak var line6f10: UITextField!
    @IBOutlet weak var line6f11: UITextField!
    @IBOutlet weak var line6f12: UITextField!
    
    var txtMissionNumber: String = "XX-XXXXX"
    var missionSymbolText: String = ""
    var fromICAOText: String = ""
    var toICAOText: String = ""
    var takeOffTimeText: String = ""
    var landTimeText: String = ""
    var TotalTime: Int = 0
    var txtTakeOffTime: String = ""
    var txtLandingTime: String = ""
    var txtDecTime: String = ""
    var line1: String = ""
    var line2: String = ""
    var line3: String = ""
    
    var linePointer: String = "a"
    var line6a: [String] = []
    var line6b: [String] = []
    var line6c: [String] = []
    var line6d: [String] = []
    var line6e: [String] = []
    var line6f: [String] = []
    
    
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

    @IBAction func updateForm(_ sender: Any) {
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
        
        txtDecTime = "\(diffHrs).\(decMin)"
        totalTime.text = txtDecTime
        
        
    }
    
    @IBAction func add_row(_ sender: Any) {
        // 9-30-20 PMM - Here's the thought, we can take all of the text in the boxes and drop it in to an array.  We need to track some way of what line we're looking at.
        // So let's swing for the fences.
        
        // So that didn't work.  The variable isn't persistent
        print("A = \(line6a.count)")
        print("B = \(line6b.count)")
        print("C = \(line6c.count)")
        print("D = \(line6d.count)")
        print("E = \(line6e.count)")
        print("F = \(line6f.count)")
        
        
        if line6a.count == 12 {
            linePointer = "b"
            if line6b.count == 12 {
                linePointer = "c"
                if line6c.count == 12 {
                    linePointer = "d"
                    if line6d.count == 12 {
                        linePointer = "e"
                        if line6e.count == 12 {
                            linePointer = "f"
                        }
                    }
                }
            }
        }
        
        if linePointer == "a"{
            linePointer = "b"
            //Populate the array
            line6a.append(missionNumber.text!)
            line6a.append(missionSymbol.text!)
            line6a.append(fromICAO.text!)
            line6a.append(toICAO.text!)
            line6a.append(takeOffTime.text!)
            line6a.append(landingTime.text!)
            line6a.append(totalTime.text!)
            line6a.append(touchAndGo.text!)
            line6a.append(fullStop.text!)
            line6a.append(totalLanding.text!)
            line6a.append(sorties.text!)
            line6a.append(specialUse.text!)
            // Clear the input boxes
            clearRow()
            // set the appropriate line with the values from the array
            let size = line6a.count
            for x in 0...size{
                switch(x){
                case 0:
                    line6a01.text = line6a[x]
                case 1:
                    line6a02.text = line6a[x]
                case 2:
                    line6a03.text = line6a[x]
                case 3:
                    line6a04.text = line6a[x]
                case 4:
                    line6a05.text = line6a[x]
                case 5:
                    line6a06.text = line6a[x]
                case 6:
                    line6a07.text = line6a[x]
                case 7:
                    line6a08.text = line6a[x]
                case 8:
                    line6a09.text = line6a[x]
                case 9:
                    line6a10.text = line6a[x]
                case 10:
                    line6a11.text = line6a[x]
                case 11:
                    line6a12.text = line6a[x]
                default:
                    break
                }
            }
        }
        else if linePointer == "b"{
            linePointer = "c"
            //Populate the array
            line6b.append(missionNumber.text!)
            line6b.append(missionSymbol.text!)
            line6b.append(fromICAO.text!)
            line6b.append(toICAO.text!)
            line6b.append(takeOffTime.text!)
            line6b.append(landingTime.text!)
            line6b.append(totalTime.text!)
            line6b.append(touchAndGo.text!)
            line6b.append(fullStop.text!)
            line6b.append(totalLanding.text!)
            line6b.append(sorties.text!)
            line6b.append(specialUse.text!)
            // Clear the input boxes
            clearRow()
            // set the appropriate line with the values from the array
            let size = line6a.count
            for x in 0...size{
                switch(x){
                case 0:
                    line6b01.text = line6b[x]
                case 1:
                    line6b02.text = line6b[x]
                case 2:
                    line6b03.text = line6b[x]
                case 3:
                    line6b04.text = line6b[x]
                case 4:
                    line6b05.text = line6b[x]
                case 5:
                    line6b06.text = line6b[x]
                case 6:
                    line6b07.text = line6b[x]
                case 7:
                    line6b08.text = line6b[x]
                case 8:
                    line6b09.text = line6b[x]
                case 9:
                    line6b10.text = line6b[x]
                case 10:
                    line6b11.text = line6b[x]
                case 11:
                    line6b12.text = line6b[x]
                default:
                    break
                }
            }
        }
        
        else if linePointer == "c"{
            linePointer = "d"
            //Populate the array
            line6c.append(missionNumber.text!)
            line6c.append(missionSymbol.text!)
            line6c.append(fromICAO.text!)
            line6c.append(toICAO.text!)
            line6c.append(takeOffTime.text!)
            line6c.append(landingTime.text!)
            line6c.append(totalTime.text!)
            line6c.append(touchAndGo.text!)
            line6c.append(fullStop.text!)
            line6c.append(totalLanding.text!)
            line6c.append(sorties.text!)
            line6c.append(specialUse.text!)
            // Clear the input boxes
            clearRow()
            // set the appropriate line with the values from the array
            let size = line6a.count
            for x in 0...size{
                switch(x){
                case 0:
                    line6c01.text = line6c[x]
                case 1:
                    line6c02.text = line6c[x]
                case 2:
                    line6c03.text = line6c[x]
                case 3:
                    line6c04.text = line6c[x]
                case 4:
                    line6c05.text = line6c[x]
                case 5:
                    line6c06.text = line6c[x]
                case 6:
                    line6c07.text = line6c[x]
                case 7:
                    line6c08.text = line6c[x]
                case 8:
                    line6c09.text = line6c[x]
                case 9:
                    line6c10.text = line6c[x]
                case 10:
                    line6c11.text = line6c[x]
                case 11:
                    line6c12.text = line6c[x]
                default:
                    break
                }
            }
        }
        else if linePointer == "d"{
            linePointer = "e"
            //Populate the array
            line6d.append(missionNumber.text!)
            line6d.append(missionSymbol.text!)
            line6d.append(fromICAO.text!)
            line6d.append(toICAO.text!)
            line6d.append(takeOffTime.text!)
            line6d.append(landingTime.text!)
            line6d.append(totalTime.text!)
            line6d.append(touchAndGo.text!)
            line6d.append(fullStop.text!)
            line6d.append(totalLanding.text!)
            line6d.append(sorties.text!)
            line6d.append(specialUse.text!)
            // Clear the input boxes
            clearRow()
            // set the appropriate line with the values from the array
            let size = line6a.count
            for x in 0...size{
                switch(x){
                case 0:
                    line6d01.text = line6d[x]
                case 1:
                    line6d02.text = line6d[x]
                case 2:
                    line6d03.text = line6d[x]
                case 3:
                    line6d04.text = line6d[x]
                case 4:
                    line6d05.text = line6d[x]
                case 5:
                    line6d06.text = line6d[x]
                case 6:
                    line6d07.text = line6d[x]
                case 7:
                    line6d08.text = line6d[x]
                case 8:
                    line6d09.text = line6d[x]
                case 9:
                    line6d10.text = line6d[x]
                case 10:
                    line6d11.text = line6d[x]
                case 11:
                    line6d12.text = line6d[x]
                default:
                    break
                }
            }
        }
        else if linePointer == "e"{
            linePointer = "f"
            //Populate the array
            line6e.append(missionNumber.text!)
            line6e.append(missionSymbol.text!)
            line6e.append(fromICAO.text!)
            line6e.append(toICAO.text!)
            line6e.append(takeOffTime.text!)
            line6e.append(landingTime.text!)
            line6e.append(totalTime.text!)
            line6e.append(touchAndGo.text!)
            line6e.append(fullStop.text!)
            line6e.append(totalLanding.text!)
            line6e.append(sorties.text!)
            line6e.append(specialUse.text!)
            // Clear the input boxes
            clearRow()
            // set the appropriate line with the values from the array
            let size = line6a.count
            for x in 0...size{
                switch(x){
                case 0:
                    line6e01.text = line6e[x]
                case 1:
                    line6e02.text = line6e[x]
                case 2:
                    line6e03.text = line6e[x]
                case 3:
                    line6e04.text = line6e[x]
                case 4:
                    line6e05.text = line6e[x]
                case 5:
                    line6e06.text = line6e[x]
                case 6:
                    line6e07.text = line6e[x]
                case 7:
                    line6e08.text = line6e[x]
                case 8:
                    line6e09.text = line6e[x]
                case 9:
                    line6e10.text = line6e[x]
                case 10:
                    line6e11.text = line6e[x]
                case 11:
                    line6e12.text = line6e[x]
                default:
                    break
                }
            }
        }
        else if linePointer == "f"{
            linePointer = "a"
            //Populate the array
            line6f.append(missionNumber.text!)
            line6f.append(missionSymbol.text!)
            line6f.append(fromICAO.text!)
            line6f.append(toICAO.text!)
            line6f.append(takeOffTime.text!)
            line6f.append(landingTime.text!)
            line6f.append(totalTime.text!)
            line6f.append(touchAndGo.text!)
            line6f.append(fullStop.text!)
            line6f.append(totalLanding.text!)
            line6f.append(sorties.text!)
            line6f.append(specialUse.text!)
            // Clear the input boxes
            clearRow()
            // set the appropriate line with the values from the array
            let size = line6a.count
            for x in 0...size{
                switch(x){
                case 0:
                    line6f01.text = line6f[x]
                case 1:
                    line6f02.text = line6f[x]
                case 2:
                    line6f03.text = line6f[x]
                case 3:
                    line6f04.text = line6f[x]
                case 4:
                    line6f05.text = line6f[x]
                case 5:
                    line6f06.text = line6f[x]
                case 6:
                    line6f07.text = line6f[x]
                case 7:
                    line6f08.text = line6f[x]
                case 8:
                    line6f09.text = line6f[x]
                case 9:
                    line6f10.text = line6f[x]
                case 10:
                    line6f11.text = line6f[x]
                case 11:
                    line6f12.text = line6f[x]
                default:
                    break
                }
            }
        }
    }
    
    func clearRow(){
        missionNumber.text = ""
        missionSymbol.text = ""
        fromICAO.text = ""
        toICAO.text = ""
        takeOffTime.text = ""
        landingTime.text = ""
        totalTime.text = ""
        touchAndGo.text = ""
        fullStop.text = ""
        totalLanding.text = ""
        sorties.text = ""
        specialUse.text = ""
    }
    
    
    @IBAction func print_func(_ sender: Any) {
        
        /*
        if let guide_url = Bundle.main.url(forResource: "afto781", withExtension: "pdf"){
            if UIPrintInteractionController.canPrint(guide_url) {
                let printInfo = UIPrintInfo(dictionary: nil)
                printInfo.jobName = guide_url.lastPathComponent
                printInfo.outputType = .photo

                let printController = UIPrintInteractionController.shared
                printController.printInfo = printInfo
                printController.showsNumberOfCopies = false

                printController.printingItem = guide_url

                printController.present(animated: true, completionHandler: nil)
            }
        }
        */
        let formImage = UIImage(named: "afto781.jpg")
        let dataImage = self.generateImage()
        
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
    
    
    func generateImage() -> UIImage? {
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
            
            let toTime = NSAttributedString(string: takeOffTimeText, attributes: attrs)
            toTime.draw(with: CGRect(x: 1525, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let landTime = NSAttributedString(string: landTimeText, attributes: attrs)
            landTime.draw(with: CGRect(x: 1710, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let totalTime = NSAttributedString(string: txtDecTime, attributes: attrs)
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
}

