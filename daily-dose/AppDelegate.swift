//
//  AppDelegate.swift
//  daily-dose
//
//  Created by Donald Belliveau on 2017-12-17.
//  Copyright © 2017 Donald Belliveau. All rights reserved.
//

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /*
     Instance Variables.
     */
    
    var window: UIWindow?
    
    
    /*
     Functions.
     */
    
    
    
    /* Did Finish Launching With Options Function. */
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
            // This will associate the App with your Google Dev Account.
        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")
        
            // Grab our IAP ID's.
        PurchaseManager.instance.fetchProducts()
        
        return true
    } // END Did Finish Launching With Options.
    
    
    /* Application Will Resign Active Function. */
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    } // END Application Will Resign Active
    
    
    /* Application Did Enter Background Function. */
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    } // END Application Did Enter Background.
    
    
    /* Application Will Enter Foreground Function */
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    } // END Application Will Enter Foreground.
    
    
    /* Application Did Become Active Function. */
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    } // END Application Did Become Active
    
    
    /* Application Will Terminate Function. */
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    } // END Application Will Terminate
    
    
} // END Class.



// AppDelegate: 

















