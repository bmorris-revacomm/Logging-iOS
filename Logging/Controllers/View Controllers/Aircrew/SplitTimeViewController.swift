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
        descriptionLabel.text = "You've added \(Form781Controller.shared.forms.last?.crewMembers.count) crew members to this mission. Would you like to split their time equally?"
    }
    
    // MARK: - Actions
    
    @IBAction func equallyButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func manuallyButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func moreOptionsButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

} //End
