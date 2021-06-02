//
//  MainViewController.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 01/06/2021.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var int1TxtField: UITextField!
  @IBOutlet private weak var int2TxtField: UITextField!
  @IBOutlet private weak var limitTxtField: UITextField!
  @IBOutlet private weak var str1TxtField: UITextField!
  @IBOutlet private weak var str2TxtField: UITextField!
  @IBOutlet private weak var resultLbl: UILabel!
  
  // MARK: Properties
  private let coordinator: NavigationRoutingLogic
  
  // MARK: Initializers
  init(coordinator: NavigationRoutingLogic) {
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: UserAction
  @IBAction private func userDidTapValidate(_ sender: Any) {
  }
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}
