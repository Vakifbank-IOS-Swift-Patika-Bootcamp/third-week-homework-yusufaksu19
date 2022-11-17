//
//  ViewController.swift
//  ThirdWeek-FirstHomework
//
//  Created by Yusuf Aksu on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var companyName: UILabel!
  @IBOutlet weak var companyYear: UILabel!
  @IBOutlet weak var companyBudget: UILabel!
  @IBOutlet weak var companyEmployeesCount: UILabel!
  @IBOutlet weak var moneyTextField: UITextField!

  var appleCompany = Company(companyName: "Apple", companyEmployeesCount: 1000, companyStartYear: "1976", companyBudget: 1_000_000)

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()

  }

  func setup(){

    companyName.text = appleCompany.companyName
    companyYear.text = appleCompany.companyStartYear

    companyBudget.text = String(format: "%.1f", appleCompany.companyBudget!)
    companyEmployeesCount.text = String(appleCompany.companyEmployeesCount!)
  }

  override func viewWillAppear(_ animated: Bool) {
    companyBudget.text = String(format: "%.1f", appleCompany.companyBudget!)
    companyEmployeesCount.text = String(appleCompany.companyEmployeesCount!)
  }

  @IBAction func addMoneyToBudget(_ sender: Any) {
    if let money = Double(moneyTextField.text ?? "0") {
      appleCompany.addMoneyToBudget(add: money)
      companyBudget.text = String(format: "%.1f", appleCompany.companyBudget!)
    }
    moneyTextField.text = ""
  }

  @IBAction func substractMoneyFromBudget(_ sender: Any) {
    if let money = Double(moneyTextField.text ?? "0") {
      appleCompany.substractMoneyFromBudget(substract: money)
      companyBudget.text = String(format: "%.1f", appleCompany.companyBudget!)
    }
    moneyTextField.text = ""
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddNewEmployeeViewController" {
      guard let vc = segue.destination as? AddNewEmployeeViewController else { return }
      vc.appleCompany = appleCompany
    } else if segue.identifier == "ShowEmployeesViewController" {
      guard let vc = segue.destination as? ShowEmployeesViewController else { return }
      vc.employeesArray = appleCompany.employeeList
    }
  }

  @IBAction func payEmployeesMoney(_ sender: Any) {
    appleCompany.payMoneyToAllEmployees{
      print("Ödemeler Tamamlandı.")
    }
    companyBudget.text = String(format: "%.1f", appleCompany.companyBudget!)
  }
  
  @IBAction func addNewEmployee(_ sender: Any) {
    performSegue(withIdentifier: "AddNewEmployeeViewController", sender: self)


  }

  @IBAction func listAllEmployees(_ sender: Any) {
    performSegue(withIdentifier: "ShowEmployeesViewController", sender: self)
  }

}

