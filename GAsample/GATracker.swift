//
//  Analytics.swift
//  GAsample
//
//  Created by 한승진 on 2018. 4. 30..
//  Copyright © 2018년 한승진. All rights reserved.
//

import Foundation

struct GAEvent {
    var category: String, action: String
    
    init(_ category: String, _ action: String) {
        self.category = category
        self.action = action
    }
}

public class GATracker {
    
    #if DEBUG
    public static let trackingID: String = "UA-118387889-1"
    #else
    public static let trackingID: String = "UA-118387889-1"
    #endif
    
    public static var `default`: GATracker = GATracker()
    
    private init() { }
}

// MARK: - Build & Send
extension GATracker {
    
    /*
     GATracker.default.send(screen: self)
     */
    func send(screen vc: UIViewController) {
        let screenName: String = String(describing: type(of: vc))
        
        guard let tracker = GAI.sharedInstance().defaultTracker else {
            return
        }
        tracker.set(kGAIScreenName, value: screenName)
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else {
            return
        }
        tracker.send(builder.build() as [NSObject: AnyObject])
        
        print("[GA] screen send:", screenName)
    }
    
    /*
     GATracker.default.send(event: GATracker.Device.SEND_VOICE.event)
     GATracker.default.send(event: GATracker.Device.SEND_VOICE.event, label: G.deviceManager.mainWave?.clientName)
     */
    func send(event: GAEvent, label: String? = nil, value: Int? = nil) {
        guard let tracker = GAI.sharedInstance().defaultTracker else {
            return
        }
        guard let builder = GAIDictionaryBuilder.createEvent(withCategory: event.category, action: event.action, label: label, value: value as NSNumber?) else {
            return
        }
        tracker.send(builder.build() as [NSObject: AnyObject])
        
        print("[GA] event send:", event.category, event.action, label ?? "")
    }
}
