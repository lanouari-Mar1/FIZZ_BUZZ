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
  @IBOutlet private weak var activityContainerView: UIView!
  @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
  
  
  // MARK: Properties
  private let coordinator: NavigationRoutingLogic
  private let interactor: MainUseCase
  
  // MARK: Initializers
  init(interactor: MainUseCase, coordinator: NavigationRoutingLogic) {
    self.coordinator = coordinator
    self.interactor = interactor
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: UserAction
  @IBAction private func userDidTapValidate(_ sender: Any) {
    interactor.userTapValidate(
      int1Str: int1TxtField.text,
      int2Str: int2TxtField.text,
      limitStr: limitTxtField.text,
      str1: str1TxtField.text,
      str2: str2TxtField.text
    )
  }
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setNotificationKeyboard()
    setUpUI()
    interactor.viewModel.displayedResult.context.addObserver(fireNow: false) { [weak self] context in
      self?.updateDisplay(with: context)
    }
  }
  
  // MARK: Private methodes
  private func setUpUI() {
    title = Constants.mainTitle
    activityContainerView.isHidden = true
  }
  
  private func updateDisplay(with context: DisplayType<String>) {
    switch context {
    case .isLoading:
      refreshLoadingAnimation(isPlaying: true)
    case .error:
      presentErrorAlert(title: Constants.validationErrorTitle, message: Constants.validationErrorMessage)
      refreshLoadingAnimation(isPlaying: false)
    break
    case .success(let result):
      refreshLoadingAnimation(isPlaying: false)
      resultLbl.text = result
    default:
      refreshLoadingAnimation(isPlaying: false)
      break
    }
  }
  
  private func refreshLoadingAnimation(isPlaying: Bool) {
    isPlaying ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    activityContainerView.isHidden = !isPlaying
  }
}

// Mark: Keyboard Management
extension MainViewController {
  
  private func setNotificationKeyboard() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillShow),
                                           name: UIResponder.keyboardWillShowNotification,
                                           object: nil)
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification,
                                           object: nil)
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
  }
  
  @objc private func keyboardWillShow(notification: NSNotification) {
    guard let userInfo = notification.userInfo,
          let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
    else { return }
    
    var keyboardFrame = value.cgRectValue
    keyboardFrame = view.convert(keyboardFrame, from: nil)
    
    var contentInset: UIEdgeInsets = scrollView.contentInset
    contentInset.bottom = keyboardFrame.size.height
    scrollView.contentInset = contentInset
  }
  
  @objc private func keyboardWillHide(notification: NSNotification) {
    var contentInset: UIEdgeInsets = scrollView.contentInset
    contentInset.bottom = .zero
    scrollView.contentInset = contentInset
  }
  
  @objc private func didTap() {
    view.endEditing(true)
  }
  
}
