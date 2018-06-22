//
//  AppDelegate.swift
//  Moviebase
//
//  Created by Marko Burčul on 04/05/2018.
//  Copyright © 2018 Marko Burčul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let startingScreen = SearchMovieController()
        let navcontroller = UINavigationController(rootViewController: startingScreen)
        navcontroller.navigationBar.isTranslucent = false
        window?.rootViewController = navcontroller
        window?.makeKeyAndVisible()
        return true
    }



}

