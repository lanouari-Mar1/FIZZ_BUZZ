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
    modelString = String(paramModel.firstInt) + "\n"
      + String(paramModel.secondInt) + "\n"
      + String(paramModel.limit) + "\n"
      + paramModel.firstString + "\n"
      + paramModel.secondString
    countString = String(count)
  }
}
