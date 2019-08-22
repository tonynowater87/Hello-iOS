//
//  MainViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
}
    @IBAction func navigateToUIPickerView(_ sender: UIButton) {
        //change page from bottom to top
        //present(PickerViewController(), animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
        
        //change page from left to right
        navigationController?.pushViewController(PickerViewController(), animated: true)
        //navigationController?.popViewController(animated: true)
    }
    @IBAction func navigateToTableView(_ sender: UIButton) {
        navigationController?.pushViewController(TableViewViewController(), animated: true)
    }
}

