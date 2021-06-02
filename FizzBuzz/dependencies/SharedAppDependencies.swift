//
//  SharedAppDependencies.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation
import UIKit

protocol SharedRootContainer {
  func makeMainNavigationController() -> UINavigationController
}

class SharedAppDependencies : SharedRootContainer {
  
  func makeMainNavigationController() -> UINavigationController {
    let nvc = UINavigationController(rootViewController: MainViewController())
    return nvc
  }
  
}
