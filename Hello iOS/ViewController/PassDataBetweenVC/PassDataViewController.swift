//
//  PassDataViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/12/19.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

protocol PassDataDelegate:class {
    func getData() -> String
    func onData(data: String)
}

class PassDataViewController: UIViewController {
    
    @IBOutlet weak var labelDataFrom: UILabel!
    @IBOutlet weak var textFieldResult: UITextField!
    
    @IBAction func sendResultBack(_ sender: UIButton) {
        let inputRaw = textFieldResult.text
        if let input = inputRaw, let delegate = self.passDataDelegate {
            print("has delegate 2")
            delegate.onData(data: input)
            //dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    var passDataDelegate: PassDataDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        if let delegate = passDataDelegate {
            print("has delegate 1")
            labelDataFrom.text = "Data From VC:\(delegate.getData())"
        }
    }
}
