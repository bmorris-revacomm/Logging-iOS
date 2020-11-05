//
//  Alerts.swift
//  Logging
//
//  Created by Bethany Morris on 11/3/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

struct Alerts {
    
    static func showInputErrorAlert(on vc: UIViewController, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let alert = UIAlertController(title: "Oops!", message: "Some fields have not been filled out. Would you like to continue anyway?", preferredStyle: .alert)
        
        let editAction = UIAlertAction(title: "Edit Fields", style: .default, handler: nil)
        let continueAction = UIAlertAction(title: "Continue Anyway", style: .destructive) { (_) in
            completion(.success(()))
        }
        
        alert.addAction(editAction)
        alert.addAction(continueAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showFlightsErrorAlert(on vc: UIViewController) {
        
        let alert = UIAlertController(title: "Oops!", message: "You already have 6 flights on this form.", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showTimeErrorAlert(on vc: UIViewController) {
        
        let alert = UIAlertController(title: "Invalid Time", message: "Please enter your time in the 4 digit manner, ie 0400", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
} //End
