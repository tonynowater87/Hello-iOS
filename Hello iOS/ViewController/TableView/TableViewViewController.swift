//
//  TableViewViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource:TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
    }
    
    func setUpTableView() {
        let uiNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: "TableViewCell")
        dataSource = TableViewDataSource(items: [1,2,3,4,5], itemIdentifier: "TableViewCell")
        dataSource?.itemSelectedListener = {
            [weak self] selectedCell in
            print("itemSelectedListener:\(selectedCell)")
        }
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
