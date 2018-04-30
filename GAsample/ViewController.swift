//
//  ViewController.swift
//  GAsample
//
//  Created by 한승진 on 2018. 4. 30..
//  Copyright © 2018년 한승진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Analytics.default.tracker(name: "MainViewController", description: "메인 페이지")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    @IBAction func tappedButton1(_ sender: Any) {
        Analytics.default.event(category: "MainViewController", action: "touchUpInside", label: "Button1", value: 0)
    }
    
    @IBAction func tappedButton2(_ sender: Any) {
    
    }
    
    @IBAction func tappedButton3(_ sender: Any) {
    
    }
}
