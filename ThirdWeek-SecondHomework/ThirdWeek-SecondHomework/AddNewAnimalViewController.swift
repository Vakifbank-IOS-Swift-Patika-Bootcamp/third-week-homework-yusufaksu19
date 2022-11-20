//
//  AddNewAnimalViewController.swift
//  ThirdWeek-SecondHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import UIKit

class AddNewAnimalViewController: UIViewController {
  var gaziantepZoo: Zoo?
  var keeperList: [AnimalKeeper]?
  @IBOutlet weak var keeperListTableView: UITableView!
  @IBOutlet weak var keeperTextField: UITextField!

  override func viewDidLoad() {
        super.viewDidLoad()
    keeperListTableView.delegate = self
    keeperListTableView.dataSource = self
    keeperList = gaziantepZoo?.animalKeeperList

    }
    

  @IBAction func addDonkey(_ sender: Any) {
    if let keeperResult = Int(keeperTextField.text!){

      var newDonkey = Animal(animalName: "Eşek", animalSound: "Ai Ai", waterSpend: 1000.0, delegate1: keeperList![keeperResult], delegate2: gaziantepZoo!)
    }



  }

  @IBAction func addMonkey(_ sender: Any) {
    if let keeperResult = Int(keeperTextField.text!){
    var newMonkey = Animal(animalName: "Monkey", animalSound: "Oo oo oo", waterSpend: 2000.0, delegate1: keeperList![keeperResult], delegate2: gaziantepZoo!)
    }
  }
}

extension AddNewAnimalViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return keeperList?.count ?? 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "KeeperTableViewCell", for: indexPath) as! KeeperTableViewCell
    if keeperList?.count == 0 {
      cell.keeperName.text = "Hiç Bakıcı Yok"
    } else {
      cell.keeperName.text = "\([indexPath.row])" +  keeperList![indexPath.row].name!
    }


        return cell
  }


}
