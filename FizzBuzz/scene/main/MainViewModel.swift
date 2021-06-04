//
//  MainViewModel.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

struct MainViewModel {
  let displayedResult = DisplayViewModel<String>()
}

struct ParamViewModel {
  
  let firstInt: String?
  let secondInt: String?
  let limit: String?
  let firstString: String?
  let secondString: String?
  
  init(firstInt: String?, secondInt: String?, limit: String?, firstString: String?, secondString: String?) {
    self.firstInt = firstInt
    self.secondInt = secondInt
    self.limit = limit
    self.firstString = firstString
    self.secondString = secondString
  }
  
  func getParamModel() -> ParamModel? {
    guard let int1Strong = Int(firstInt ?? ""),
          let int2Strong = Int(secondInt ?? ""),
          let limiteStrong = Int(limit ?? ""),
          let str1Strong = firstString,
          let str2Strong = secondString,
          int1Strong > 0,
          int2Strong > 0,
          limiteStrong > 0 else {
      return nil
    }
    
    return ParamModel(
      firstInt: int1Strong,
      secondInt: int2Strong,
      limit: limiteStrong,
      firstString: str1Strong,
      secondString: str2Strong
    )
  }
}
