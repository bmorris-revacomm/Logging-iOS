//
//  ContainerViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/21/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var sideMenuIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension ContainerViewController: SideMenuDelegate {
    
    func toggleSideMenu() {
        if sideMenuIsOpen {
            sideMenuConstraint.constant = -200
        } else {
            sideMenuConstraint.constant = 0
        }
    }
    
}
