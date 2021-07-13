//
//  ViewController+Combine.swift
//  SwiftUp
//
//  Created by 马海平 on 2021/6/23.
//  Copyright © 2021 mahp. All rights reserved.
//

import Foundation

extension Notification.Name{
    static var newTrickDownloaded:Notification.Name {
        return Notification.Name("aa")
    }
}

class MagicTrick:Codable {
    var name:String = ""
}

extension ViewController{
    
    public func sendNtf() {
        if #available(iOS 13.0, *) {
            let trickNamePublisher = NotificationCenter.Publisher(center: .default, name: .newTrickDownloaded).map { notification->Data in
                let userInfo = notification.userInfo
                print(userInfo ?? "")
                return userInfo?["data"] as! Data
            }
            
            
//            var test = MagicTrick()
//            trickNamePublisher.assign(to: \.name, on: test)
            
            
        } else {
            // Fallback on earlier versions
        }
        
        
        
        
        
        
    }
    
}
