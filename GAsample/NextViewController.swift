//
//  NextViewController.swift
//  GAsample
//
//  Created by 한승진 on 2018. 4. 30..
//  Copyright © 2018년 한승진. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "NextVC"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GATracker.default.tracking(screen: "NextVC", description: "NextVC Desc")
        
        GAI.sharedInstance()?.dispatch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
