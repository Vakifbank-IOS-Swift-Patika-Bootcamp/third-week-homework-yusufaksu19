//
//  AnimalKeeper.swift
//  ThirdWeek-SecondHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import Foundation

protocol AnimalKeeperWithAnimalDelegate {

}

class AnimalKeeper: AnimalKeeperWithAnimalDelegate {
  let name: String?
  var income: Double? {
    return Double(name!.count) * 1000.0
  }
  var delegate: ZooWithAnimalDelegate?

  init(name: String, delegate: ZooWithAnimalDelegate){
    self.name = name
    self.delegate = delegate
    addedToWillPayMoney()
  }

  func addedToWillPayMoney(){
    self.delegate?.addWillPayMoney(money: income!)
  }

}
