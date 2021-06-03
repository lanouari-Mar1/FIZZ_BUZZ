//
//  MainInteractor.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

protocol MainUseCase {
  var viewModel: MainViewModel { get }
  func calculFizzBuzz(with paramViewModel: ParamViewModel)
}

class MainInteractor: MainUseCase {
  
  let viewModel = MainViewModel()
  private let fizzBuzzService: FizzBuzzServiceProtocol
  
  init(fizzBuzzService: FizzBuzzServiceProtocol) {
    self.fizzBuzzService = fizzBuzzService
  }
  
  func calculFizzBuzz(with paramViewModel: ParamViewModel) {
    guard let paramModel = paramViewModel.getParamModel() else {
      viewModel.displayedResult.context.value = .error
      return
    }
    viewModel.displayedResult.context.value = .isLoading
    fizzBuzzService.calculFizzBuzz(model: paramModel) { [weak self] result in
      self?.viewModel.displayedResult.context.value = .success(result)
    }
  }
}
