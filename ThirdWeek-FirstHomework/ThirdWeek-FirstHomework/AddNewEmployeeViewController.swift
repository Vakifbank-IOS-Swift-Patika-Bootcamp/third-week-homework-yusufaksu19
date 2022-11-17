//
//  AddNewEmployeeViewController.swift
//  ThirdWeek-FirstHomework
//
//  Created by Yusuf Aksu on 16.11.2022.
//

import UIKit

class AddNewEmployeeViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var employeeNameTextField: UITextField!
  @IBOutlet weak var employeeAgeTextField: UITextField!
  @IBOutlet weak var employeeRelationshipTextField: UITextField!
  @IBOutlet weak var employeeRankTextField: UITextField!

  @IBOutlet weak var employeeMoney: UILabel!

  var appleCompany: Company?
  var employee: Employee?
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

  func setup() {
    var employeeName = employeeNameTextField.text ?? ""
    if employeeName.isEmpty {
      employeeName = "İsimsiz Kişi"
    }
    let employeeAge = Int(employeeAgeTextField.text!) ?? 0
    let relationship = employeeRelationshipTextField.text ?? "0"
    let employeeRank = employeeRankTextField.text ?? "0"

    var newRelationship: EmployeeRelationShip?
    var newEmployeeRank: EmployeeRank?

    switch relationship {
    case "0":
      newRelationship = .single
    case "1":
      newRelationship = .engaged
    case "2":
      newRelationship = .married
    default:
      newRelationship = .single
    }

    switch employeeRank {
    case "0":
      newEmployeeRank = .junior
    case "1":
      newEmployeeRank = .mid
    case "2":
      newEmployeeRank = .senior
    default:
      newEmployeeRank = .junior
    }


    employee = Employee(employeeName: employeeName, employeeAge: employeeAge, employeeRelationship: newRelationship!, employeeRank: newEmployeeRank!, delegate: appleCompany!)

  }

  @IBAction func calculateEmployeeMoney(_ sender: Any) {
    setup()
    let employeeSalary: Double = (employee?.calculateEmployeeSalary())!
    employeeMoney.text = String(format: "%.1f", employeeSalary)
    
  }

}

