//
//  NavigationCoordinator.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation
import UIKit

protocol NavigationRoutingLogic: AnyObject {
}

class NavigationCoordinator: NavigationRoutingLogic {
  
  private let dependencies: SharedRootContainer
  private let navigationController: UINavigationController
  
  var rootViewController: UINavigationController {
    navigationController
  }
  
  init(dependencies: SharedRootContainer, navigationController: UINavigationController) {
    self.dependencies = dependencies
    self.navigationController = navigationController
  }
  
}
