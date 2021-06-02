//
//  AppDelegate.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 01/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  let dependencies = SharedAppDependencies()
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let mainNavigationController = dependencies.makeMainNavigationController()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainNavigationController
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

