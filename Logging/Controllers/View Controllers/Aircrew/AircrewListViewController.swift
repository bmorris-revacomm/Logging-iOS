//
//  AircrewListViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/22/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class AircrewListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var aircrewTableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aircrewTableView.delegate = self
        aircrewTableView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

} //End

// MARK: - TableViewDelegate

extension AircrewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.aircrewTableView.dequeueReusableCell(withIdentifier: "AircrewCell", for: indexPath) as? AircrewTableViewCell else { return UITableViewCell() }
        
        //let member = members[indexPath.row]
        //cell.setUpViews(member: member)
        
        return cell
    }
    
} //End
