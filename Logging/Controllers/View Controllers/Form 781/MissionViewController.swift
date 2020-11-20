//
//  MissionViewController.swift
//  Logging
//
//  Created by Bethany Morris on 10/30/20.
//  Copyright © 2020 Christian Brechbuhl. All rights reserved.
//

import UIKit

class MissionViewController: UIViewController {

    @IBOutlet var topBar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true

        self.topBar.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(topBatTapped(gesture:)))
        self.topBar.addGestureRecognizer(tap)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func skipButtonTapped(_ sender: UIButton) {
        
    }

    @objc func topBatTapped(gesture: UITapGestureRecognizer) {
        let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
        let build: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
        let about = UIAlertController(title: "About Logger",
                                      message: "Did you bring a towel?\nVersion: \(appVersion)\nBuild: (\(build))",
                                      preferredStyle: .alert)
        about.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(about, animated: true)
    }

} //End
