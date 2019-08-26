//
//  TableViewDataSource.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

typealias TableCellClickListener = ((_ selectedItem:EnumComponents)->())
typealias TableSearchCompletedListener = (()->())

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var items:[EnumComponents]
    var backUpItems:[EnumComponents]
    
    var itemIdentifier:String
    
    var itemSelectedListener: TableCellClickListener?
    
    var searchCompletedListener: TableSearchCompletedListener?
    
    init(items: [EnumComponents], itemIdentifier: String) {
        self.items = items
        self.backUpItems = items
        self.itemIdentifier = itemIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: itemIdentifier) as! TableViewCell
        
        if let item = itemAt(indexPath: indexPath) {
            cell.setText(text: item.rawValue)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = itemAt(indexPath: indexPath) {
            print("didSelect:\(item)")
            itemSelectedListener?(item)
        }
    }
    
    private func itemAt(indexPath:IndexPath) -> EnumComponents?{
        guard indexPath.row >= 0 && indexPath.row < items.count else{
            return nil
        }
        return items[indexPath.row]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        items = backUpItems
        
        print("search:\(searchText)")
        
        if searchText.isEmpty {
            searchCompletedListener?()
            return
        }
        
        var filterItem = [EnumComponents]()
        
        for item in items {
            if item.rawValue.contains(searchText) {
                filterItem.append(item)
            }
        }
        
        items = filterItem
        
        searchCompletedListener?()
    }
}

