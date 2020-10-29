//
//  AircrewDetailViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/29/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AircrewDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    var crewMember: CrewMember?

    @IBOutlet weak var name: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Methods
    
    func setUpViews() {
        guard let crewMember = crewMember else { return }
        name.text = "\(crewMember.lastName), \(crewMember.firstName)"
    }

} //End
