//
//  Analytics.swift
//  GAsample
//
//  Created by 한승진 on 2018. 4. 30..
//  Copyright © 2018년 한승진. All rights reserved.
//

import Foundation

public class GATracker {
    
    public static var `default`: GATracker = GATracker()
    public static let trackingID: String = "UA-118387889-1"
    
    private init() {
        
    }
}

extension GATracker {
    
    func tracking(screen name: String, page: Int? = nil, description: String? = nil) {
        guard let tracker = GAI.sharedInstance().defaultTracker else {
            return
        }
        tracker.set(kGAIScreenName, value: name)
        
        if let page = page {
            tracker.set(kGAIPage, value: "\(page)")
        }
        if let description = description {
            tracker.set(kGAIDescription, value: description)
        }
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else {
            return
        }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    func event(category: String, action: String, label: String, value: Int? = nil) {
        guard let tracker = GAI.sharedInstance().defaultTracker else {
            return
        }
        guard let builder = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: value as NSNumber?) else {
            return
        }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
}
