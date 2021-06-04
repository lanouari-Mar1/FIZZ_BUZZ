//
//  ItemViewModelTest.swift
//  FizzBuzzTests
//
//  Created by marouane lanouari on 04/06/2021.
//

import XCTest
@testable import FizzBuzz

class ItemViewModelTest: XCTestCase {
  
  func test_init_shouldSetRighValues() {
    // Given
    let paramModel = ParamModel(firstInt: 1, secondInt: 2, limit: 5, firstString: "string1", secondString: "string2")
    let expectedString = "1\n2\n5\nstring1\nstring2"
    let vm = ItemViewModel(paramModel: paramModel, count: 2)
    // Then
    XCTAssertEqual(vm.modelString, expectedString)
    XCTAssertEqual(vm.countString, "2")
  }
}
