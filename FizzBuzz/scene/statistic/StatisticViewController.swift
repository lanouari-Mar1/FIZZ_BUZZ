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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = Constants.statisticVCTitle
  }
  
}

extension StatisticViewController: UITableViewDelegate {
  
}

extension StatisticViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  
}
