//
//  WelcomeViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/20/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func form781Tapped(_ sender: UIButton) {
        
    }
    
    @IBAction func fuelTrackerTapped(_ sender: UIButton) {
    
    }
    
    @IBAction func form1881Tapped(_ sender: UIButton) {
    
    }
    
    @IBAction func form2131Tapped(_ sender: UIButton) {
    
    }
    
    @IBAction func form97Tapped(_ sender: UIButton) {
    
    }
    
    @IBAction func form1081Tapped(_ sender: UIButton) {
    
    }
    
    @IBAction func ormMissionTapped(_ sender: UIButton) {
    
    }
    
    @IBAction func ormLocalTapped(_ sender: UIButton) {
    
    }
    
    @IBAction func moreFormsButtonTapped(_ sender: UIButton) {
    
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page1") as? ContainerViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
} //End
