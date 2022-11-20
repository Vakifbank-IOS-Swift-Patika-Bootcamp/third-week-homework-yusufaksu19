//
//  AnimalKeeperViewController.swift
//  ThirdWeek-SecondHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import UIKit

class AnimalKeeperViewController: UIViewController {
  var gaziantepZoo: Zoo?

  @IBOutlet weak var keeperNameTextField: UITextField!

  @IBOutlet weak var keeperWage: UILabel!


  override func viewDidLoad() {
        super.viewDidLoad()


    }
    

  @IBAction func addNewKeeperButton(_ sender: Any) {
    var newKeeper = AnimalKeeper(name: keeperNameTextField.text!, delegate: gaziantepZoo!)
    keeperWage.text = String(format: "%1.f", newKeeper.income!)
    keeperNameTextField.text = ""
    gaziantepZoo?.addAnimalKeeperToList(keeper: newKeeper)
  }

}
