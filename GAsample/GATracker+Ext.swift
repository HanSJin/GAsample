//
//  File.swift
//  GAsample
//
//  Created by 한승진 on 2018. 5. 4..
//  Copyright © 2018년 한승진. All rights reserved.
//


// MARK: - Event Data
extension GATracker {
    enum MainView {
        case BUTTON_01
        case NEXT

        var event: GAEvent {
            switch self {
            case .BUTTON_01: return GAEvent("main_screen", "button01")
            case .NEXT: return GAEvent("main_screen", "next")
            }
        }
    }
}
