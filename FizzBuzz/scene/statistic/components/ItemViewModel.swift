//
//  ItemViewModel.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 03/06/2021.
//

import Foundation

struct ItemViewModel {
  let modelString: String
  let countString: String
  
  init(paramModel: ParamModel, count: Int) {
    modelString = String(paramModel.int1) + "\n"
      + String(paramModel.int2) + "\n"
      + String(paramModel.limit) + "\n"
      + paramModel.str1 + "\n"
      + paramModel.str2
    countString = String(count)
  }
}
