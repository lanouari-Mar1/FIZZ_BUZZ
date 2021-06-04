//
//  ParamModel.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

struct ParamModel: Hashable {
  
  let firstInt: Int
  let secondInt: Int
  let limit: Int
  let firstString: String
  let secondString: String
  
  init(firstInt: Int, secondInt: Int, limit: Int, firstString: String, secondString: String) {
    self.firstInt = firstInt
    self.secondInt = secondInt
    self.limit = limit
    self.firstString = firstString
    self.secondString = secondString
  }
  
  func isLimitExceeded() -> Bool {
    limit > Constants.maxLimitNumber
  }
}
