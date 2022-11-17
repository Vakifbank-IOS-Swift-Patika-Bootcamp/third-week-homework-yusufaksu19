//
//  Animal.swift
//  ThirdWeek-SecondHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import Foundation

class Animal {
  let animalName: String?
  let animalSound: String?
  var waterSpend: Double?
  var delegate1: AnimalKeeperWithAnimalDelegate?
  var delegate2: ZooWithAnimalDelegate?

  init(animalName: String, animalSound:String, waterSpend: Double, delegate1: AnimalKeeperWithAnimalDelegate, delegate2: ZooWithAnimalDelegate){
    self.animalName = animalName
    self.animalSound = animalSound
    self.waterSpend = waterSpend
    self.delegate1 = delegate1
    self.delegate2 = delegate2
    addWillDailySpendWater()
  }

  // ses
  func animalSpeak(speaks: () -> Void){
    print("Hayvan Konuşuyor: \(animalSound!)")
    speaks()
  }

  // su limitinde harcandı
  func addWillDailySpendWater(){
    self.delegate2?.willDailySpendWater(water: waterSpend!)
  }

}
