//
//  CreateNewDebtViewController.swift
//  Robocoll
//
//  Created by user on 3/24/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import UserNotifications

class CreateNewDebtViewController: UIViewController {
    @IBOutlet weak var debtCountField: UITextField!
    @IBOutlet weak var debtDateField: UITextField!
    @IBOutlet weak var debtPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debtCountField.delegate = self
        debtDateField.delegate = self
        debtPhone.delegate = self
    }
    
    @IBAction func backPressed(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        let calendar = Calendar.current
        let debtDate = calendar.date(byAdding: .second, value: 5, to: Date())
        let date = Calendar.current.dateComponents([.year, .month, .day, .hour], from: debtDate ?? Date())
        
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.title = "Новый долг"
        
        content.subtitle = debtCountField.text ?? ""
        content.body = "Вернуть до \(debtDateField.text ?? "")"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

extension CreateNewDebtViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return false
    }
}
