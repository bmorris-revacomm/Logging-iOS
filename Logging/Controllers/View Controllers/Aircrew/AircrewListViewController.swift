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
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var flightAuthDutyCodeTextField: UITextField!
    @IBOutlet weak var flyingOriginTextField: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aircrewTableView.delegate = self
        aircrewTableView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        popUpView.isHidden = false
    }
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    
    @IBAction func addNewAircrewButtonTapped(_ sender: UIButton) {
        guard let form = Form781Controller.shared.forms.last,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let firstName = firstNameTextField.text, !firstName.isEmpty,
              let ssn = ssnTextField.text, !ssn.isEmpty,
              let flightAuthDutyCode = flightAuthDutyCodeTextField.text, !flightAuthDutyCode.isEmpty,
              let flyingOrigin = flyingOriginTextField.text, !flyingOrigin.isEmpty
        else { return }
        
        CrewMemberController.create(form: form, lastName: lastName, firstName: firstName, ssn: ssn, flightAuthDutyCode: flightAuthDutyCode, flyingOrigin: flyingOrigin)
        
        aircrewTableView.reloadData()
        popUpView.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        lastNameTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        ssnTextField.resignFirstResponder()
        flightAuthDutyCodeTextField.resignFirstResponder()
        flyingOriginTextField.resignFirstResponder()
    }
    
} //End

// MARK: - TableViewDelegate

extension AircrewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Form781Controller.shared.forms.last?.crewMembers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.aircrewTableView.dequeueReusableCell(withIdentifier: "AircrewCell", for: indexPath) as? AircrewTableViewCell else { return UITableViewCell() }
        
        if let crewMember = Form781Controller.shared.forms.last?.crewMembers[indexPath.row] {
            cell.setUpViews(crewMember: crewMember)
        }
        
        return cell
    }
    
} //End
