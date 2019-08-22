//
//  AlertViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/22.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    private let confirmAction = UIAlertAction.init(title: "Confirm", style: .default, handler: nil)
    private let cancelAction = UIAlertAction.init(title: "Cancel", style: .default, handler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController.init(title: "Title", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet(_ sender: Any) {
        let alertController = UIAlertController.init(title: "Title", message: "Message", preferredStyle: UIAlertController.Style.actionSheet)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showCustomAlert(_ sender: Any) {
        let customAlert = UIAlertController.init(title: "title", message: "Message", preferredStyle: .alert)
        customAlert.addTextField { (textField) in textField.placeholder = "Account" }
        customAlert.addTextField {
            (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            customAlert.addAction(self.confirmAction)
            customAlert.addAction(self.cancelAction)
        }
        self.present(customAlert, animated: true, completion: nil)
    }
}
