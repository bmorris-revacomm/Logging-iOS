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

        // Do any additional setup after loading the view.
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
