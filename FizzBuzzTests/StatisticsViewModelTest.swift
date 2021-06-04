//
//  StatisticsViewModelTest.swift
//  FizzBuzzTests
//
//  Created by marouane lanouari on 04/06/2021.
//

import XCTest
@testable import FizzBuzz

class StatisticsViewModelTest: XCTestCase {
  
  func test_init_shouldSetRighValues_withRightOrder() {
    // Given
    let paramModel = ParamModel(firstInt: 1, secondInt: 2, limit: 5, firstString: "string1", secondString: "string2")
    let paramModel2 = ParamModel(firstInt: 1, secondInt: 2, limit: 5, firstString: "string3", secondString: "string4")
    
    let result = [paramModel: 1, paramModel2: 3]
    let viewModel = StatisticsViewModel(results: result)
    // Then
    XCTAssertEqual(viewModel.itemViewModels.count, 2)
    XCTAssertEqual(viewModel.itemViewModels.first?.countString, "3")
  }
}
