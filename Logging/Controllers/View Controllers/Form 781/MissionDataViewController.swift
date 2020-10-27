//
//  MissionDataViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/27/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class MissionDataViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var MDS: UITextField!
    @IBOutlet weak var serialNumber: UITextField!
    @IBOutlet weak var unitCharged: UITextField!
    @IBOutlet weak var harmLocation: UITextField!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        dateTextField.resignFirstResponder()
        MDS.resignFirstResponder()
        serialNumber.resignFirstResponder()
        unitCharged.resignFirstResponder()
        harmLocation.resignFirstResponder()
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
