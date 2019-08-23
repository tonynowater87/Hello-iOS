//
//  WebViewViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/23.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textFieldURL: UITextField!
    
    private let defaultUrl = "http://www.google.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.uiDelegate = self
        textFieldURL.text = defaultUrl
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func forward(_ sender: Any) {
        let inputURL = textFieldURL.text!
        let request = URLRequest.init(url: URL.init(string: inputURL)!)
        webView.load(request)
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
}
