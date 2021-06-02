//
//  ParamModel.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation

struct ParamModel: Hashable {
  
  let int1: Int
  let int2: Int
  let limit: Int
  let str1: String
  let str2: String
  
  init?(int1Str: String?, int2Str: String?, limitStr: String?, str1: String?, str2: String?) {
    guard let int1Strong = Int(int1Str ?? ""),
          let int2Strong = Int(int2Str ?? ""),
          let limiteStrong = Int(limitStr ?? ""),
          let str1Strong = str1,
          let str2Strong = str2 else {
      return nil
    }
    
    self.int1 = int1Strong
    self.int2 = int2Strong
    self.limit = limiteStrong
    self.str1 = str1Strong
    self.str2 = str2Strong
  }
}
