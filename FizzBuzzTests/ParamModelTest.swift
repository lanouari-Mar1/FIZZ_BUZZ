//
//  CalculModelTest.swift
//  FizzBuzzTests
//
//  Created by marouane lanouari on 02/06/2021.
//

import XCTest
@testable import FizzBuzz

class ParamModelTest: XCTestCase {
  
  func test_initWithNilValues_shouldBeNil() {
    let model = ParamModel(int1Str: nil, int2Str: nil, limitStr: nil, str1: nil, str2: "nice")
    XCTAssertNil(model)
  }
  
  func test_initWithEmptyString_shouldBeNil() {
    let model = ParamModel(int1Str: "nice", int2Str: "10", limitStr: "10", str1: "nice", str2: "")
    XCTAssertNil(model)
  }
  
  func test_initNoneIntParam_shouldBeNil() {
    let model = ParamModel(int1Str: "nice", int2Str: "10", limitStr: "10", str1: "nice", str2: "nice")
    XCTAssertNil(model)
  }
  
  func test_initWithRight_shouldInitWithRightValues() throws {
    let model = ParamModel(int1Str: "10", int2Str: "4", limitStr: "50", str1: "nice", str2: "nice")
    let strongModel = try XCTUnwrap(model)
    XCTAssertEqual(strongModel.int1, 10)
    XCTAssertEqual(strongModel.str1, "nice")
  }
  
}
