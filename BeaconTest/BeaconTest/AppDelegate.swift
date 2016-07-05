//
//  AppDelegate.swift
//  BeaconTest
//
//  Created by Jessie Albarian on 6/13/16.
//  Copyright © 2016 mademovement. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {

    var window: UIWindow?

    let beaconManager = ESTBeaconManager()
    
//    var beacon = Beacon()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Badge, UIUserNotificationType.Sound]
        let pushNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        
        application.registerUserNotificationSettings(pushNotificationSettings)
        application.registerForRemoteNotifications()
        
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()

        
        // MONITOR FOR BEACONS
        // Info on Kitchen Beacon
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!,
            major: 60912, minor: 20928, identifier: "kitchen"))

        // Info on living room Beacon
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!,
            major: 12140, minor: 40797, identifier: "living room"))

        // Info on dining room Beacon
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!,
            major: 2040, minor: 65518, identifier: "dining room"))
        
        // Info on master bedroom Beacon
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!,
            major: 34137, minor: 8434, identifier: "master bedroom"))
        
        // Info on master bath Beacon
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!,
            major: 61561, minor: 11789, identifier: "master bath"))
        
        // Info on laundry room Beacon
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "979291BF-D2C4-39BB-D497-973985193E6E")!,
            major: 23109, minor: 36900, identifier: "laundry room"))
        
        
        UIApplication.sharedApplication().registerUserNotificationSettings(
            UIUserNotificationSettings(forTypes: [.Alert, .Sound], categories: nil))
        
        
        return true
    }
    
//    /*
//     * Notification when entering range
//     */
//    func beaconManager(manager: AnyObject, didEnterRegion region: CLBeaconRegion) {
//        let notification = UILocalNotification()
//        notification.alertBody =
//            "You are in range of a beacon!!"
//        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
//    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
//        print("DEVICE TOKEN = \(deviceToken)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print(error)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        print(userInfo)
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


}

