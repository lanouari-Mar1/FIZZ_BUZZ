//
//  StatisticsViewModel.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 03/06/2021.
//

import Foundation

struct StatisticsViewModel {
  var itemViewModels: [ItemViewModel]
  
  init(results: [ParamModel : Int]) {
    itemViewModels = results
      .sorted { $0.value > $1.value }
      .map { ItemViewModel(paramModel: $0.key, count: $0.value)}
  }
}
