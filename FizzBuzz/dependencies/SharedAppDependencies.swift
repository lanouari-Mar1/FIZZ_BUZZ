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
  
  let fizzBuzzService: FizzBuzzServiceProtocol
  
  init() {
    self.fizzBuzzService = FizzBuzzService()
  }
  func makeMainNavigationController() -> UINavigationController {
    let nvc = UINavigationController()
    let coordinator = NavigationCoordinator(dependencies: self, navigationController: nvc)
    nvc.viewControllers = [MainViewController(coordinator: coordinator)]
    return nvc
  }
  
}
