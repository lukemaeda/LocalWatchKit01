//
//  InterfaceController.swift
//  LocalWatchKit01 WatchKit Extension
//
//  Created by MAEDAHAJIME on 2015/06/04.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

//    override func awakeWithContext(context: AnyObject?) {
//        super.awakeWithContext(context)
//        
//        // Configure interface objects here.
//        var notification = UILocalNotification()
//        notification.category = "mainCategory"
//        notification.alertTitle = "My title"
//        notification.alertBody = "My scheduling text"
//        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
//        notification.applicationIconBadgeNumber = 1
//        notification.soundName = UILocalNotificationDefaultSoundName
//        
//        UIApplication.sharedApplication().scheduleLocalNotification(notification)
//    }
    
    override func awakeWithContext(context: AnyObject?) {
        var userInfo = [
            "scheduleLocalNotification": true,
            "category": "someCategory",
            "alertTitle": "My title",
            "alertBody": "My scheduling text",
            "fireDate": NSDate(timeIntervalSinceNow: 5),
            "applicationIconBadgeNumber": 1,
            "soundName": UILocalNotificationDefaultSoundName
        ]
        
        // Register notifications in iOS
        WKInterfaceController.openParentApplication(userInfo) {
            (replyInfo, error) -> Void in
            // Callback here if needed                
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
