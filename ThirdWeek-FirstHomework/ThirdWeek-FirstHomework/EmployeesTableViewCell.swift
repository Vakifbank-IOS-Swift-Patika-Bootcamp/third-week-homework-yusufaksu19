//
//  EmployeesTableViewCell.swift
//  ThirdWeek-FirstHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {

  @IBOutlet weak var employeeName: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
