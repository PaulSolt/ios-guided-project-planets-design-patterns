//
//  AppDelegate.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first)
        
        return true
    }
    
    
    // Enable state restoration (Momento Design Pattern)
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        
        // Can have some cases where you don't want this to save/restore
//        if Users.shared.userIsLoggingIn {
//            return false
//        }
        
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }

}

