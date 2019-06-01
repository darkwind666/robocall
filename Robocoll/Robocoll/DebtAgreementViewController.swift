//
//  DebtAgreementViewController.swift
//  Robocoll
//
//  Created by user on 3/24/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class DebtAgreementViewController: UIViewController {

    @IBOutlet weak var agreementView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url : URL! = URL(string: "https://docs.google.com/document/d/1_IGMAYN3n0-lCLc22BWm1-kIjq9SYr9WbUdrj_HU-pc/edit#")
        agreementView.loadRequest(URLRequest(url: url))
    }
    
    @IBAction func backPressed(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
    }
}
