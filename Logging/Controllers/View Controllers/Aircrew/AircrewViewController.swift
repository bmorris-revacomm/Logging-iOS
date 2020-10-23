//
//  AircrewViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/22/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AircrewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addAircrewButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //End
