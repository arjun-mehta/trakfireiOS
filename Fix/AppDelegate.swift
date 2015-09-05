//
//  AppDelegate.swift
//  trakfire
//
//  Created by Arjun Mehta on 7/17/15.
//  Copyright (c) 2015 Arjun Mehta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var meteorClient = initialiseMeteor("pre2", "wss://trackfiredemo.meteor.com/websocket");
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let parameters = ["CTghKi5shr3zqF4ZK"] as NSArray
        meteorClient.addSubscription("singleUser", withParameters: parameters as [AnyObject])
        
//        let limit = [15] as NSArray
//        meteorClient.addSubscription("customPublication", withParameters: limit as [AnyObject])
        
        let termsDict:[String:String] = ["view":"singleDay","date":"08/05/2015", "after": "08/05/2015","before": "08/06/2015"]
        let termsArray: NSArray = [termsDict]
        meteorClient.addSubscription("postsList", withParameters: termsArray as [AnyObject])
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportConnection", name: MeteorClientDidConnectNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportDisconnection", name: MeteorClientDidDisconnectNotification, object: nil)

        return true
    }
    
    func reportConnection() {
        println("================> connected to server!")
    }
    
    func reportDisconnection() {
        println("================> disconnected from server!")
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

// MARK: - Typealiases

typealias User = AnyObject
typealias Posts = AnyObject

