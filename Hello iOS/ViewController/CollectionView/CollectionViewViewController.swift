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
    
    private var refreshControll: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpCollectionView()
        setUpUIRefreshControll()
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
    
    private func setUpUIRefreshControll() {
        refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        collectionView.refreshControl = refreshControll
    }
    
    @objc func onRefresh() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            self.refreshControll.endRefreshing()
            self.datasource.addRandomNumber(randomNumber: Int.random(in: 0...10))
            let row = self.datasource.counts - 1
            self.collectionView.scrollToItem(at: IndexPath(row: row, section: 0), at: .bottom, animated: true)
        })
    }
    
    @IBAction func addImage(_ sender: Any) {
        datasource.addRandomNumber(randomNumber: Int.random(in: 0...10))//include 10
        //datasource.addRandomNumber(randomNumber: Int.random(in: 0..<10))//not include 10
    }
}
