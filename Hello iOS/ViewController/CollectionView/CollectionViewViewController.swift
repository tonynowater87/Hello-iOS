//
//  CollectionViewViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/22.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private static let COLLECTION_CELL_ID = "CollectionViewCell"
    
    private let datasource = CollectionViewDatasource(items: [], itemIdentifier: CollectionViewViewController.COLLECTION_CELL_ID)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpCollectionView()
    }

    private func setUpCollectionView() {
        let uiNib = UINib(nibName: CollectionViewViewController.COLLECTION_CELL_ID, bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier: CollectionViewViewController.COLLECTION_CELL_ID)
        collectionView.delegate = datasource
        collectionView.dataSource = datasource
        
        datasource.callback = {
            self.collectionView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addImage(_ sender: Any) {
        datasource.addRandomNumber(randomNumber: Int.random(in: 0...10))//include 10
        //datasource.addRandomNumber(randomNumber: Int.random(in: 0..<10))//not include 10
    }
}
