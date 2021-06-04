//
//  CalculModelTest.swift
//  FizzBuzzTests
//
//  Created by marouane lanouari on 02/06/2021.
//

import XCTest
@testable import FizzBuzz

class ParamViewModelTest: XCTestCase {
  
  func test_init_WithNilValues_shouldBeNil() {
    let vm = ParamViewModel(firstInt: nil, secondInt: nil, limit: nil, firstString: nil, secondString: "nice")
    XCTAssertNil(vm.getParamModel())
  }
  
  func test_init_WithEmptyString_shouldBeNil() {
    let vm = ParamViewModel(firstInt: "nice", secondInt: "10", limit: "10", firstString: "nice", secondString: "")
    XCTAssertNil(vm.getParamModel())
  }
  
  func test_init_WithNoneIntParam_shouldBeNil() {
    let vm = ParamViewModel(firstInt: "nice", secondInt: "10", limit: "10", firstString: "nice", secondString: "nice")
    XCTAssertNil(vm.getParamModel())
  }
  
  func test_init_WithZeroIntParams_shouldBeNil() {
    let vm = ParamViewModel(firstInt: "0", secondInt: "0", limit: "0", firstString: "nice", secondString: "nice")
    XCTAssertNil(vm.getParamModel())
  }
  
  func test_initWithRight_shouldInitWithRightValues() throws {
    let vm = ParamViewModel(firstInt: "10", secondInt: "4", limit: "50", firstString: "nice", secondString: "nice")
    let strongModel = try XCTUnwrap(vm.getParamModel())
    XCTAssertEqual(strongModel.firstInt, 10)
    XCTAssertEqual(strongModel.firstString, "nice")
  }
  
}
