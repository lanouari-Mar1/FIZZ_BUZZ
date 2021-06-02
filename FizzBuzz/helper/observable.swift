//
//  observable.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

/// Simple type to observe property change
/// An observable can have multiple observer
class Observable<T> {
  var value: T {
    didSet {
      self.valuesChanged.forEach { closure in
        closure(self.value)
      }
    }
  }
  
  private var valuesChanged: [((T) -> Void)] = []
  
  init(value: T) {
    self.value = value
  }
  
  /// Add closure as an observer and trigger the closure immediately if fireNow = true
  func addObserver(fireNow: Bool = true, _ onChange: @escaping ((T) -> Void)) {
    valuesChanged.append(onChange)
    if fireNow {
      onChange(value)
    }
  }
}
