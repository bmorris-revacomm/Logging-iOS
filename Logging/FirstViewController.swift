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
    
    @IBOutlet weak var txtMission: UITextField!
    @IBOutlet weak var txtMissionSym: UITextField!
    @IBOutlet weak var txtFromICAO: UITextField!
    @IBOutlet weak var txtToICAO: UITextField!
    @IBOutlet weak var TakeOffTime: UIDatePicker!
    @IBOutlet weak var LandTime: UIDatePicker!
    @IBOutlet weak var txtTotalTime: UITextField!
    
    
    var missionNumberText: String = "XX-XXXXX"
    var missionSymbolText: String = ""
    var fromICAOText: String = ""
    var toICAOText: String = ""
    var takeOffTimeText: String = ""
    var landTimeText: String = ""
    var TotalTime: Int = 0
    var takeOffTime: String = ""
    var landingTime: String = ""
    var txtDecTime: String = ""
    

    @IBAction func updateForm(_ sender: Any) {
        // Thought here is to calculate the flying hours.
        let toComponents = Calendar.current.dateComponents([.hour, .minute], from: TakeOffTime.date)
        
        takeOffTime = "\(toComponents.hour!) : \(toComponents.minute!)"
        
        let laComponents = Calendar.current.dateComponents([.hour, .minute], from: LandTime.date)
        
        landingTime = "\(laComponents.hour!) : \(laComponents.minute!)"
        
        var diffHrs: Int = 0
        var diffMin: Int = 0
        var decMin: Int = 0
        
        if laComponents.hour! < toComponents.hour! {
            // A day has advanced
            diffHrs = (24 - toComponents.hour!) + laComponents.hour!
        }
        if laComponents.hour! > toComponents.hour!{
            diffHrs = laComponents.hour! - toComponents.hour!
        }
        
        if laComponents.minute! < toComponents.minute!{
            diffHrs -= 1
            diffMin = (laComponents.minute! - toComponents.minute!) + 60
        }
        
        if laComponents.minute! > toComponents.minute!{
            diffMin = laComponents.minute! - toComponents.minute!
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
        
        
        txtDecTime = "\(diffHrs).\(decMin)"
        txtTotalTime.text = txtDecTime
        
        
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
            
            let msnNumberString = NSAttributedString(string: txtMission.text!, attributes: attrs)
            msnNumberString.draw(with: CGRect(x: 445, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let msnSymbolString = NSAttributedString(string: txtMissionSym.text!, attributes: attrs)
            msnSymbolString.draw(with: CGRect(x: 915, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let fromICAOString = NSAttributedString(string: txtFromICAO.text!, attributes: attrs)
            fromICAOString.draw(with: CGRect(x: 1135, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let toICAOString = NSAttributedString(string: txtToICAO.text!, attributes: attrs)
            toICAOString.draw(with: CGRect(x: 1325, y: 545, width: 300, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let toTime = NSAttributedString(string: takeOffTime, attributes: attrs)
            toTime.draw(with: CGRect(x: 1525, y: 545, width: 200, height: 50), options: .usesLineFragmentOrigin, context: nil)
            
            let landTime = NSAttributedString(string: landingTime, attributes: attrs)
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

