//
//  StatisticInteractor.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

protocol StatisticUseCase {
  var statisticsViewModel: StatisticsViewModel { get }
}

class StatisticInteractor: StatisticUseCase {
  
  var statisticsViewModel: StatisticsViewModel
  private let fizzBuzzService: FizzBuzzServiceProtocol
  
  init(fizzBuzzService: FizzBuzzServiceProtocol) {
    self.fizzBuzzService = fizzBuzzService
    self.statisticsViewModel = StatisticsViewModel(results: fizzBuzzService.results)
  }
}
