//
//  UIViewController+Extensions.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import Foundation
import UIKit

extension UIViewController {
  func presentErrorAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: Constants.validationErrorButton, style: .cancel, handler: nil))
    self.present(alert, animated: true)
  }
  
}
