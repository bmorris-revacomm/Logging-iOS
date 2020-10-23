//
//  AddAircrewViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/23/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AddAircrewViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var flightAuthDutyCode: UITextField!
    @IBOutlet weak var flyingOrigin: UITextField!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    @IBAction func addAircrewButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

} //End
