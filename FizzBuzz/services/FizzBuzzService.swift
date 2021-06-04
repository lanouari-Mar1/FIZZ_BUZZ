//
//  FizzBuzzService.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

protocol FizzBuzzServiceProtocol {
  func calculFizzBuzz(model: ParamModel, completion: @escaping (String) -> ())
  var results: [ParamModel: Int] { get }
}

class FizzBuzzService: FizzBuzzServiceProtocol {
  
  private(set) var results = [ParamModel: Int]()
  
  func calculFizzBuzz(model: ParamModel, completion: @escaping (String) -> ()) {
    DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      guard let self = self else { return }
      let result = self.calculResult(model: model)
      self.results[model] = (self.results[model] ?? 0) + 1
      DispatchQueue.main.async {
        completion(result)
      }
    }
  }
  
  private func calculResult(model: ParamModel) -> String {
    var resultStr = [String]()
    for i in 1...model.limit {
      resultStr.append(getFizzBuzzString(for: i, model: model))
    }
    return resultStr.joined(separator: ",")
  }
  
  private func getFizzBuzzString(for number: Int, model: ParamModel) -> String {
    switch (number % model.firstInt == 0, number % model.secondInt == 0) {
    case (true, false):
      return model.firstString
    case (false, true):
      return model.secondString
    case (true, true):
      return model.firstString + model.secondString
    case (false, false):
      return String(number)
    }
  }
}
