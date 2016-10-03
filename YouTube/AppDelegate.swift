//
//  AppDelegate.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // get the window
        window = UIWindow(frame: UIScreen.main.bounds)
        // make the window visible
        window?.makeKeyAndVisible()
        
        // set the root view controller to your initial viewcontroller. 
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: layout))
        
        //layout.scrollDirection = .horizontal
        
        //Update UINavigationBar Appearance
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        
        //Get rid of black bar underneath the nav bar 
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        //Create status var background
        
        let statusBackgroundView = UIView()
        statusBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31, alpha: 1)
        
        //Window is the actual window that contains everything in the screen inside the application. 
        
        window?.addSubview(statusBackgroundView)
        window?.addConstraintsWithFormat("H:|[v0]|", views: statusBackgroundView)
        window?.addConstraintsWithFormat("V:|[v0(20)]", views: statusBackgroundView)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

