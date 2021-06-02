//
//  DisplayViewModel.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

/// ViewModel which embded different page state
struct DisplayViewModel<T> {
  var context = Observable<DisplayType<T>>(value: .none)
}

/// Representation of different page state
enum DisplayType<T> {
  case isLoading
  case none
  case error
  case success(T)
}
