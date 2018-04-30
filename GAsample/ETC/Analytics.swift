//
//  Analytics.swift
//  GAsample
//
//  Created by 한승진 on 2018. 4. 30..
//  Copyright © 2018년 한승진. All rights reserved.
//

import Foundation

public class Analytics {
    
    public static var `default`: Analytics = Analytics()
}

extension Analytics {
    
    func tracking(name screen: String, page: Int? = nil, description: String? = nil) {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: screen)
        
        if let page = page {
            tracker.set(kGAIPage, value: "\(page)")
        }
        if let description = description {
            tracker.set(kGAIDescription, value: description)
        }
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
}
