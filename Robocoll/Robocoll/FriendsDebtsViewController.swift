//
//  FriendsDebtsViewController.swift
//  Robocoll
//
//  Created by user on 3/24/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import UserNotifications

class FriendsDebtsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var friends = [(phone: "+564767966", image: "robocop.jpg", debtCount: "10$", date: "03.10.1992"), (phone: "+564767966", image: "bender", debtCount: "50р", date: "05.12.2003"), (phone: "+564767966", image: "ironMan.png", debtCount: "30$", date: "15.06.2017"), (phone: "+564767966", image: "wally.jpg", debtCount: "100$", date: "01.01.2030")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мне должны"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FriendsDebtsTableViewCell", bundle: nil),  forCellReuseIdentifier:"FriendsDebtsTableViewCell")
        tableView.allowsSelection = false
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            } else {
                print("User has accept notifications")
            }
        }
    }
    
    @IBAction func addDebtPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateViewController(withIdentifier: "CreateNewDebtViewController") as! CreateNewDebtViewController
        self.navigationController?.pushViewController(startViewController, animated: true)
    }
}

extension FriendsDebtsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "FriendsDebtsTableViewCell", for: indexPath) as? FriendsDebtsTableViewCell)!
        let debtData = friends[indexPath.row]
        cell.friendImage.image = UIImage(named: debtData.image)
        cell.debtCountLabel.text = debtData.debtCount
        cell.debtDateLabel.text = debtData.date
        cell.userPhoneLabel.text = debtData.phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
