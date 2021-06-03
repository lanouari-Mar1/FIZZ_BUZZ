//
//  StatisticViewController.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 02/06/2021.
//

import UIKit

class StatisticViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: Properties
  private let interactor: StatisticUseCase
  
  // MARK: Initializers
  init(interactor: StatisticUseCase) {
    self.interactor = interactor
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = Constants.statisticVCTitle
    tableView.register(UINib(nibName: StatisticTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: StatisticTableViewCell.identifier)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
  
}

extension StatisticViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return interactor.statisticsViewModel.itemViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: StatisticTableViewCell.identifier, for: indexPath) as? StatisticTableViewCell else {
      fatalError("Cannot get cell for identifier: \(StatisticTableViewCell.identifier)")
    }
    let vm = interactor.statisticsViewModel.itemViewModels[indexPath.row]
    cell.setUp(with: vm)
    return cell
  }
}
