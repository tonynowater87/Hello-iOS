//
//  TableViewDataSource.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var items:[Int] {didSet {
        print("willSet:\\items.count")
        }}
    var itemIdentifier:String
    
    init(items: [Int], itemIdentifier: String) {
        self.items = items
        self.itemIdentifier = itemIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemIdentifier) as! TableViewCell
        
        if let item = itemAt(indexPath: indexPath) {
            cell.setIndex(index: item)
        }
        
        return cell
    }
    
    private func itemAt(indexPath:IndexPath) -> Int?{
        guard indexPath.row >= 0 && indexPath.row < items.count else{
            return nil
        }
        return items[indexPath.row]
    }
    
}

