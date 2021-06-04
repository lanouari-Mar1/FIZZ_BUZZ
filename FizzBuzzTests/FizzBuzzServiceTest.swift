//
//  FizzBuzzServiceTest.swift
//  FizzBuzzTests
//
//  Created by marouane lanouari on 03/06/2021.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzServiceTest: XCTestCase {
  
  func testCalculFizzBuzz_shouldReturnTheRightResult1() {
    let expectation = XCTestExpectation(description: "Calcul Finish")
    let service = FizzBuzzService()
    let model = ParamModel(firstInt: 1, secondInt: 2, limit: 10, firstString: "fizz", secondString: "buzz")
    service.calculFizzBuzz(model: model) { result in
      XCTAssertEqual(result, "fizz,fizzbuzz,fizz,fizzbuzz,fizz,fizzbuzz,fizz,fizzbuzz,fizz,fizzbuzz")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 1.0)
  }
  
  func testCalculFizzBuzz_shouldReturnTheRightResult2() {
    let expectedResult = "1,2,fizz,4,buzz,fizz,7,8,fizz,buzz,11,fizz,13,14,fizzbuzz,16,17,fizz,19,buzz,fizz,22,23,fizz,buzz,26,fizz,28,29,fizzbuzz,31,32,fizz,34,buzz,fizz,37,38,fizz,buzz"
    let expectation = XCTestExpectation(description: "Calcul Finish")
    let service = FizzBuzzService()
    let model = ParamModel(firstInt: 3, secondInt: 5, limit: 40, firstString: "fizz", secondString: "buzz")
    service.calculFizzBuzz(model: model) { result in
      XCTAssertEqual(result, expectedResult)
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 1.0)
  }
}
