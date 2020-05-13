//
//  AppDelegate.swift
//  moneyCalculator
//
//  Created by Александр  Бровков  on 06.05.2020.
//  Copyright © 2020 Александр  Бровков . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainMenuView = MainMenuAssemble.assembleModuleNavigation()
        
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = mainMenuView
        
                window?.makeKeyAndVisible()
        return true
    }
}

