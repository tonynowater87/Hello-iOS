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
    case HelloML
    case PassDataBetweenVC
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var helloIOSLabel: UILabel!
    @IBOutlet weak var tableViewComponents: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private static let components = [EnumComponents.UIPickerView, .UITableView, .UIAlertController, .UIImagePicker, .DrawCanvas, .UICollectionView, .WKWebView, .MKMapView, .SVProgressHUD, .NFC, .HelloML, .PassDataBetweenVC]
    private static let CELL_ID = "TableViewCell"
    
    private let mDataSource: TableViewDataSource = TableViewDataSource(items: MainViewController.components, itemIdentifier: MainViewController.CELL_ID)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a
        setUpTableView()
        helloIOSLabel.text = "Hello".localized()
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
        case .HelloML:
            navigationController?.pushViewController(HelloMLViewController(), animated: true)
        case .PassDataBetweenVC:
            let vc = PassDataViewController()
            vc.passDataDelegate = self
            navigationController?.pushViewController(vc, animated: true)
        default:
            fatalError("illegal argument:\(component)")
        }
    }
}

extension MainViewController: PassDataDelegate {
    func onData(data: String) {
        print("data back to main:\(data)")
        self.helloIOSLabel.text = String(format: "%@ %@", "Hello".localized(), data)
    }
    
    func getData() -> String {
        return "Parameter~~"
    }
}
