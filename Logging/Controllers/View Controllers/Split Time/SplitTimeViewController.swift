//
//  SplitTimeViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/23/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class SplitTimeViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Methods
    
    func setUpViews() {
<<<<<<< HEAD:Logging/Controllers/View Controllers/Aircrew/SplitTimeViewController.swift
        descriptionLabel.text = "You've added \(Form781Controller.shared.forms.last!.crewMembers.count) crew members to this mission. Would you like to split their time equally?"
=======
        if let form = Form781Controller.shared.forms.last {
            if form.crewMembers.count == 1 {
                descriptionLabel.text = "You've added \(form.crewMembers.count) crew member to this mission. Would you like to split their time equally?"
            } else {
                descriptionLabel.text = "You've added \(form.crewMembers.count) crew members to this mission. Would you like to split their time equally?"
            }
        }
>>>>>>> upstream/master:Logging/Controllers/View Controllers/Split Time/SplitTimeViewController.swift
    }
    
    // MARK: - Actions
    
    @IBAction func equallyButtonTapped(_ sender: UIButton) {
        // Based on the duty code is how we will split the time
        
    }
    
    @IBAction func manuallyButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func moreOptionsButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

} //End
