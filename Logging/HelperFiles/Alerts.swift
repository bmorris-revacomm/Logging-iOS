//
//  Alerts.swift
//  Logging
//
//  Created by Bethany Morris on 11/3/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

struct Alerts {
    
    private static func showAlert(on vc: UIViewController, title: String, message: String, storyboardName: String, identifier: String, destinationVC: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let editAction = UIAlertAction(title: "Edit Fields", style: .default, handler: nil)
        let continueAction = UIAlertAction(title: title, style: .destructive) { (_) in
            // as? destinationVC not working
            if let viewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? UIViewController  {
                if let navigator = vc.navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
        
        alert.addAction(editAction)
        alert.addAction(continueAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showErrorAlert(on vc: UIViewController, storyboardName: String, identifier: String, destinationVC: UIViewController) {
        showAlert(on: vc, title: "Oops!", message: "Some fields have been filled out incorrectly or not at all. Would you like to continue anyway?", storyboardName: storyboardName, identifier: identifier, destinationVC: destinationVC)
    }
    
} //End
