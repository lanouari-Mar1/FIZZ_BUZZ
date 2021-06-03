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
  func makeStatisticViewController() -> StatisticViewController
  
}

class SharedAppDependencies : SharedRootContainer {
  
  let fizzBuzzService: FizzBuzzServiceProtocol
  
  init() {
    self.fizzBuzzService = FizzBuzzService()
  }
  
  func makeMainNavigationController() -> UINavigationController {
    let nvc = UINavigationController()
    let coordinator = NavigationCoordinator(dependencies: self, navigationController: nvc)
    let mainVC = MainViewController(
      interactor: MainInteractor(
        fizzBuzzService: fizzBuzzService
      ),
      coordinator: coordinator
    )
    nvc.viewControllers = [mainVC]
    return nvc
  }
  
  func makeStatisticViewController() -> StatisticViewController {
    StatisticViewController(interactor: StatisticInteractor(fizzBuzzService: fizzBuzzService))
  }
  
}
