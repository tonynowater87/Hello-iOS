//
//  SVProgressHUDViewController.swift
//  Hello iOS
//
//  Created by Stan on 2019/8/24.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit
import SVProgressHUD

class SVProgressHUDViewController: UIViewController {
    
    private let BUTTON_WIDTH = CGFloat(100)
    private let BUTTON_HEIGHT = CGFloat(50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var showButton: UIButton = UIButton(type: UIButton.ButtonType.roundedRect)
        showButton.setTitle("show", for: UIControl.State.normal)
        showButton.frame = CGRect(x: UIScreen.main.bounds.width / 2 - BUTTON_WIDTH / 2 ,y: UIScreen.main.bounds.height / 2 - BUTTON_HEIGHT / 2, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
        showButton.addTarget(self, action: #selector(clickShowButton), for: UIControl.Event.touchDown)
        
        self.view.addSubview(showButton)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SVProgressHUD.dismiss()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc private func clickShowButton() {
        SVProgressHUD.show()
    }
}
