//
//  MainInteractor.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

protocol MainUseCase {
  var viewModel: MainViewModel { get }
  func userTapValidate(int1Str: String?, int2Str: String?, limitStr: String?, str1: String?, str2: String?)
}

class MainInteractor: MainUseCase {
  
  let viewModel = MainViewModel()
  private let fizzBuzzService: FizzBuzzServiceProtocol
  
  init(fizzBuzzService: FizzBuzzServiceProtocol) {
    self.fizzBuzzService = fizzBuzzService
  }
  
  func userTapValidate(int1Str: String?, int2Str: String?, limitStr: String?, str1: String?, str2: String?) {
    guard let paramModel = ParamModel(int1Str: int1Str, int2Str: int2Str, limitStr: limitStr, str1: str1, str2: str2) else {
      viewModel.displayedResult.context.value = .error
      return
    }
    viewModel.displayedResult.context.value = .isLoading
    fizzBuzzService.calculFizzBuzz(model: paramModel) { [weak self] result in
      self?.viewModel.displayedResult.context.value = .success(result)
    }
  }
}
