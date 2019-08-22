//
//  PickerViewController.swift
//  Helloworld
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var textViewValue: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let days = ["Morning", "Noon", "Evening"]
    let weeks = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var selectedWeek = 0
    var selectedDay = 0
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        initPickerView()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return weeks.count
        } else {
            return days.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if component == 0 {
            return weeks[row]
        } else {
            return days[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedWeek = row
        } else {
            selectedDay = row
        }
        textViewValue.text = weeks[selectedWeek] + " " + days[selectedDay]
    }

    func initPickerView() {
        let week = weeks[pickerView.selectedRow(inComponent: 0)]
        let day = days[pickerView.selectedRow(inComponent: 1)]
        textViewValue.text = week + " " + day
    }
    
    
    @IBAction func navigation(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        //navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true, completion: nil)
        //dismiss(animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
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
