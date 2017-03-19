//
//  AppDelegate.swift
//  ChWeibo
//
//  Created by 乔腾龙 on 2017/3/19.
//  Copyright © 2017年 乔腾龙. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //设置根窗口
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = ChWeiboMainVC()
        window?.makeKeyAndVisible()
        
        return true
    }



}

