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
        title = "MainVC"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GATracker.default.tracking(screen: "MainVC", description: "MainVC Desc")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNextVC" {
            GATracker.default.event(category: "MainVC", action: "performSegue", label: "NextVC")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    
    @IBAction func tappedButton1(_ sender: Any) {
        GATracker.default.event(category: "MainVC", action: "touchUpInside", label: "Button1")
    }
    
    @IBAction func tappedNextButton(_ sender: Any) {
        performSegue(withIdentifier: "showNextVC", sender: self)
    }
}
