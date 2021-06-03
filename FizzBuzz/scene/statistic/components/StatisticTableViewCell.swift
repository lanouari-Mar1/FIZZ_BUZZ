//
//  StatisticTableViewCell.swift
//  FizzBuzz
//
//  Created by marouane lanouari on 03/06/2021.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
  static let identifier = "StatisticTableViewCell"
  
  @IBOutlet private weak var paramNameLbl: UILabel!
  @IBOutlet private weak var hitCountLbl: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setUp(with viewModel: ItemViewModel) {
    paramNameLbl.text = viewModel.modelString
    hitCountLbl.text = viewModel.countString
  }
}
