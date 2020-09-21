//
//  FirstViewController.swift
//  Logging
//
//  Created by Christian Brechbuhl on 7/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var WIDTH: Int = 3300
    var HEIGHT: Int = 2550
    
    
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
                .font: UIFont.systemFont(ofSize: 24)
            ]
            
            let strTail = "89-1192"
            let attributedString = NSAttributedString(string: strTail, attributes: attrs)
            attributedString.draw(with: CGRect(x: 1035, y: 330, width: 300, height: 25), options: .usesLineFragmentOrigin, context: nil)
            
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

