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
    let paramVM = ParamViewModel(
      firstInt: int1TxtField.text,
      secondInt: int2TxtField.text,
      limit: limitTxtField.text,
      firstString: str1TxtField.text,
      secondString: str2TxtField.text
    )
    interactor.calculFizzBuzz(with: paramVM)
  }
  
  @IBAction func userDidTapStatistic(_ sender: Any) {
    coordinator.showStatisticView()
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
    title = Constants.mainVCTitle
    activityContainerView.isHidden = true
    if #available(iOS 13.0, *) {
      activityIndicator.style = .large
    } else {
      activityIndicator.style = .whiteLarge
    }
  }
  
  private func updateDisplay(with context: DisplayType<String>) {
    switch context {
    case .isLoading:
      refreshLoadingAnimation(isPlaying: true)
    case .error(let errorType) where errorType == .incorrectParams:
      presentErrorAlert(title: Constants.validationErrorTitle, message: Constants.validationErrorMessage)
      refreshLoadingAnimation(isPlaying: false)
    case .error(let errorType) where errorType == .maxLimit:
      presentErrorAlert(title: Constants.maxLimitErrorTitle, message: Constants.maxLimitErrorMessage)
      refreshLoadingAnimation(isPlaying: false)
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
