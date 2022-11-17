//
//  ViewController.swift
//  ThirdWeek-SecondHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var zooNameLabel: UILabel!
  @IBOutlet weak var zooBudgetLabel: UILabel!
  @IBOutlet weak var zooWaterLimitLabel: UILabel!
  @IBOutlet weak var moneyTextField: UITextField!
  @IBOutlet weak var addWaterTextField: UITextField!


  let gaziantepZoo: Zoo = Zoo(zooName: "Gaziantep Hayvanat Bahçesi", louseBudget: 1_000_000, waterLimit: 5000)

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup(){
    zooNameLabel.text = gaziantepZoo.zooName
    zooBudgetLabel.text = "Bütçe: " + String(format: "%.1f", gaziantepZoo.louseBudget!)
    zooWaterLimitLabel.text = "Su Limiti: " + String(format: "%.1f", gaziantepZoo.waterLimit!)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddNewAnimalViewController" {
      guard let vc = segue.destination as? AddNewAnimalViewController else { return }
//      vc.appleCompany = appleCompany
    } else if segue.identifier == "AnimalKeeperViewController" {
      guard let vc = segue.destination as? AnimalKeeperViewController else { return }
//      vc.employeesArray = appleCompany.employeeList
    } else if segue.identifier == "AnimalAndKeeperListViewController" {
      guard let vc = segue.destination as? AnimalAndKeeperListViewController else { return }
      //      vc.employeesArray = appleCompany.employeeList
    }
  }


  @IBAction func addMoney(_ sender: Any) {
    if let newMoney = Double(moneyTextField.text!) {
      gaziantepZoo.newMoneyAddedToBudget(add: newMoney)
      zooBudgetLabel.text = "Bütçe: " + String(format: "%.1f", gaziantepZoo.louseBudget!)
    }
  }

  @IBAction func subtractMoney(_ sender: Any) {
    if let newMoney = Double(moneyTextField.text!) {
      gaziantepZoo.substractMoneyFromBudget(substract: newMoney)
      zooBudgetLabel.text = "Bütçe: " + String(format: "%.1f", gaziantepZoo.louseBudget!)
    }
  }

  @IBAction func addWater(_ sender: Any) {
    if let newWater = Double(addWaterTextField.text!) {
      gaziantepZoo.extendWaterLimit(water: newWater)
      zooWaterLimitLabel.text = "Su Limiti: " + String(format: "%.1f", gaziantepZoo.waterLimit!)
    }
  }

  @IBAction func payAllKeepersMoney(_ sender: Any) {
  }

  @IBAction func addNewKeeper(_ sender: Any) {
    performSegue(withIdentifier: "AnimalKeeperViewController", sender: self)
  }

  @IBAction func addNewAnimal(_ sender: Any) {
    performSegue(withIdentifier: "AddNewAnimalViewController", sender: self)
  }

  @IBAction func showZooAndKeeper(_ sender: Any) {
    performSegue(withIdentifier: "AnimalAndKeeperListViewController", sender: self)

  }

}

