//
//  MainViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

enum EnumComponents: String {
    case UIPickerView
    case UITableView
    case UIAlertController
    case UIImagePicker
    case DrawCanvas
    case UICollectionView
    case WKWebView
    case MKMapView
    case SVProgressHUD
    case NFC
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableViewComponents: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private static let components = [EnumComponents.UIPickerView, .UITableView, .UIAlertController, .UIImagePicker, .DrawCanvas, .UICollectionView, .WKWebView, .MKMapView, .SVProgressHUD, .NFC]
    private static let CELL_ID = "TableViewCell"
    
    private let mDataSource: TableViewDataSource = TableViewDataSource(items: MainViewController.components, itemIdentifier: MainViewController.CELL_ID)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        print("viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//        print("didReceiveMemoryWarning")
    }
    
    private func setUpTableView() {
        let uiNib = UINib(nibName: MainViewController.CELL_ID, bundle: nil)
        tableViewComponents.register(uiNib, forCellReuseIdentifier: MainViewController.CELL_ID)
        tableViewComponents.dataSource = mDataSource
        tableViewComponents.delegate = mDataSource
        
        mDataSource.itemSelectedListener = {
            selectedItem in
            self.navigate(selectedItem)
        }
        
        mDataSource.searchCompletedListener = {
            print("searchCompleted!")
            self.tableViewComponents.reloadData()
        }
        
        searchBar.autocapitalizationType = .none
        searchBar.delegate = mDataSource
    }
    
    private func navigate(_ component: EnumComponents) {
        switch component {
        case .UIPickerView:
            navigationController?.pushViewController(PickerViewController(), animated: true)
        case .UITableView:
            navigationController?.pushViewController(TableViewViewController(), animated: true)
        case .UIAlertController:
            navigationController?.pushViewController(AlertViewController(), animated: true)
        case .UIImagePicker:
            navigationController?.pushViewController(ImagePickerViewController(), animated: true)
        case .DrawCanvas:
            navigationController?.pushViewController(DrawCanvasViewController(), animated: true)
        case .UICollectionView:
            navigationController?.pushViewController(CollectionViewViewController(), animated: true)
        case .WKWebView:
            navigationController?.pushViewController(WebViewViewController(), animated: true)
        case .MKMapView:
            navigationController?.pushViewController(MapKitViewController(), animated: true)
        case .SVProgressHUD:
            navigationController?.pushViewController(SVProgressHUDViewController(), animated: true)
        case .NFC:
            navigationController?.pushViewController(NFCViewController(), animated: true)
        default:
            fatalError("illegal argument:\(component)")
        }
    }
    
    @IBAction func navigateToUIPickerView(_ sender: UIButton) {
        //change page from bottom to top
        //present(PickerViewController(), animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
        
        //change page from left to right
        navigationController?.pushViewController(PickerViewController(), animated: true)
        //navigationController?.popViewController(animated: true)
    }
}

