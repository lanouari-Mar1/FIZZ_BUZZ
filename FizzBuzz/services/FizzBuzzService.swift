//
//  FizzBuzzService.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

protocol FizzBuzzServiceProtocol {
  func calculFizzBuzz(model: ParamModel, completion: @escaping (String) -> ())
}

class FizzBuzzService: FizzBuzzServiceProtocol {
    
  func calculFizzBuzz(model: ParamModel, completion: @escaping (String) -> ()) {
    DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      guard let self = self else { return }
      let result = self.calculResult(model: model)
      DispatchQueue.main.async {
        completion(result)
      }
    }
  }
  
  private func calculResult(model: ParamModel) -> String {
    var resultStr = ""
    for i in 1...model.limit {
      resultStr = resultStr + getFizzBuzzString(for: i, model: model) + ","
    }
    return resultStr
  }
  
  private func getFizzBuzzString(for number: Int, model: ParamModel) -> String {
    switch (number % model.int1 == 0, number % model.int2 == 0) {
    case (true, false):
      return model.str1
    case (false, true):
      return model.str2
    case (true, true):
      return model.str1 + model.str2
    case (false, false):
      return String(number)
    }
  }
}
