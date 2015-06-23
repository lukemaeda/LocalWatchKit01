//
//  AppDelegate.swift
//  LocalWatchKit01
//
//  Created by MAEDAHAJIME on 2015/06/04.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//
//  スウィフト WatchKitからの通知を作成します
//  Creating Notifications from WatchKit in Swift
//  http://basememara.com/creating-notifications-from-watchkit-in-swift/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // --------------------------------------
        // 1. 通知に表示するアクションを生成する
        // --------------------------------------
        var snoozeAction = UIMutableUserNotificationAction()
        snoozeAction.identifier = "snoozeAction"
        snoozeAction.title = "Snooze"
        snoozeAction.activationMode = .Background
        snoozeAction.destructive = false
        snoozeAction.authenticationRequired = false
        
        // -----------------------------------
        // 2. 生成したアクションをカテゴリに設定する
        // -----------------------------------
        var mainCategory = UIMutableUserNotificationCategory()
        mainCategory.identifier = "mainCategory"
        
        let defaultActions = [snoozeAction]
        let minimalActions = [snoozeAction]
        
        mainCategory.setActions(defaultActions, forContext: .Default)
        mainCategory.setActions(minimalActions, forContext: .Minimal)
        
        // --------------------------------
        // 3. セッティングへのカテゴリの設定する
        // --------------------------------
        
        // 通知のタイプを選択（バッジ、サウンド、アラート）
        let notificationSettings = UIUserNotificationSettings(
            forTypes: .Alert | .Badge | .Sound,
            categories: NSSet(objects: mainCategory) as Set<NSObject>)
        
        // --------------------------------
        // 4. セッティングの通知を登録する
        // --------------------------------
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // 
    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {
        if let value: AnyObject = userInfo?["scheduleLocalNotification"] where value as! Bool {
            var notification = UILocalNotification()
            notification.category = userInfo?["category"] as? String
            notification.alertTitle = userInfo?["alertTitle"] as! String
            notification.alertBody = userInfo?["alertBody"] as? String
            notification.fireDate = userInfo?["fireDate"] as? NSDate
            if let badge: AnyObject = userInfo?["applicationIconBadgeNumber"] {
                notification.applicationIconBadgeNumber = badge as! Int
            }
            notification.soundName = userInfo?["soundName"] as? String
            
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }
    }
}

