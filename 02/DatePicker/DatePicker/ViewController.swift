//
//  ViewController.swift
//  DatePicker
//
//  Created by Jinwoo Kim on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectedTime: UILabel!
    @IBOutlet weak var dataPickerView: UIDatePicker!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: NSDate() as Date)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectedTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
    }
}

