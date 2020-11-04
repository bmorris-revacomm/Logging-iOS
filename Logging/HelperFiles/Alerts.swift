//
//  Alerts.swift
//  Logging
//
//  Created by Bethany Morris on 11/3/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

struct Alerts {
    
    private static func showAlert(on vc: UIViewController, title: String, message: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let editAction = UIAlertAction(title: "Edit Fields", style: .default, handler: nil)
        let continueAction = UIAlertAction(title: "Continue Anyway", style: .destructive) { (_) in
            completion(.success(()))
        }
        
        alert.addAction(editAction)
        alert.addAction(continueAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showTextFieldsAlert(on vc: UIViewController, completion: @escaping (Result<Void, Error>) -> Void) {
        showAlert(on: vc, title: "Oops!", message: "Some fields have been filled out incorrectly or not at all. Would you like to continue anyway?", completion: completion)
    }
    
} //End
