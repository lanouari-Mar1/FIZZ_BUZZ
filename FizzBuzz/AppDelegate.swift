//
//  AppDelegate.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 01/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let mainViewController = MainViewController()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainViewController
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

