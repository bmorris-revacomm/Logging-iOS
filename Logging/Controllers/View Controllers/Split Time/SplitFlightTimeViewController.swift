//
//  SplitTimeListViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/29/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class SplitFlightTimeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var flightTimeTableView: UITableView!
    @IBOutlet weak var flightSeqTableView: UITableView!
    @IBOutlet weak var flightSeqButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
    @IBAction func flightSeqButtonTapped(_ sender: UIButton) {
        flightSeqButton.isSelected.toggle()
        if flightSeqButton.isSelected {
            flightSeqButton.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
            flightSeqTableView.isHidden = false
        } else {
            flightSeqButton.setImage(UIImage(systemName: "arrowtriangle.forward.fill"), for: .normal)
            flightSeqTableView.isHidden = true
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

} //End
