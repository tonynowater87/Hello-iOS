//
//  CollectionViewDatasource.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/22.
//  Copyright © 2019 Tony. All rights reserved.
//

import Foundation
import UIKit

typealias callbackAddRandomNumber = (()->())

class CollectionViewDatasource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let SPACING_VERTICAL = CGFloat(1)
    private let SPACING_HORIZENTAL = CGFloat(1)
    private let ROW_COUNT = CGFloat(3)
    
    private var items: [String]
    private var itemIdentifier:String
    
    var callback: callbackAddRandomNumber?
    
    init(items: [String], itemIdentifier: String) {
        self.items = items
        self.itemIdentifier = itemIdentifier
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier, for: indexPath) as! CollectionViewCell
        
        if let item = itemAt(indexPath: indexPath) {
            cell.setText(text: item)
        }
        
        return cell
    }
    
    private func itemAt(indexPath:IndexPath) -> String?{
        guard indexPath.row >= 0 && indexPath.row < items.count else{
            return nil
        }
        return items[indexPath.row]
    }
    
    //Cell's width & height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / ROW_COUNT - SPACING_HORIZENTAL, height: collectionView.bounds.height / 2 - SPACING_VERTICAL)
    }
    
    //SPACING_VERTICAL
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SPACING_VERTICAL
    }
    
    //SPACING_HORIZENTAL
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return SPACING_HORIZENTAL
    }
    
    func addRandomNumber(randomNumber: Int) {
        items.append(String(randomNumber))
        self.callback?()
    }
}
