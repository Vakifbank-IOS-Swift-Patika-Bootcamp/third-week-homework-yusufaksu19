//
//  Zoo.swift
//  ThirdWeek-SecondHomework
//
//  Created by Yusuf Aksu on 17.11.2022.
//

import Foundation

protocol ZooWithAnimalDelegate {
  var willDailySpendWater: Double { get set }
  var waterLimit: Double? { get set }
  var willPayMoney: Double { get set }
  func willDailySpendWater(water amount: Double)
  func spendFromWaterLimit(water amount: Double)
  func addWillPayMoney(money amount: Double)
}


class Zoo: ZooWithAnimalDelegate {
  var zooName: String?
  var willDailySpendWater: Double = 0.0
  var willPayMoney: Double = 0.0
  var louseBudget: Double?
  var waterLimit: Double?

  init(zooName:String, louseBudget: Double, waterLimit: Double) {
    self.zooName = zooName
    self.louseBudget = louseBudget
    self.waterLimit = waterLimit
    printSituationOfZoo()
  }

  // gelir ekle
  func newMoneyAddedToBudget(add money:Double){
    louseBudget! += money
    print("--")
    print("--------------- Bütçeye yeni para ekleniyor: \(money) --------")
    print("--")
    printSituationOfZoo()
  }

  // gider çıkar
  func substractMoneyFromBudget(substract money:Double){
    if (louseBudget! < money) {
      print("--")
      print("Bütçede yeterli miktarda para bulunmamakta.")
      print("--")
    } else {
      louseBudget? -= money
      print("--")
      print("--------------- Bütçeden para eksiliyor: \(money) --------")
      print("--")
    }
    printSituationOfZoo()
  }

  // su limiti artır
  func extendWaterLimit(water amount: Double){
    waterLimit! += amount
    print("--")
    print("--------------- Su limiti artırılıyor.: \(amount) --------")
    print("--")
    printSituationOfZoo()
  }

  func spendFromWaterLimit(water amount: Double){
    if (waterLimit! < amount) {
      print("--")
      print("--------------- Yeterli Su Bulunmamaktadır.:--------")
      print("--")
    } else {
      waterLimit! -= amount
      print("--")
      print("--------------- Su limitinden düşülüyor.: \(amount) --------")
      print("--")
    }
    printSituationOfZoo()
  }

  func willDailySpendWater(water amount: Double){
    willDailySpendWater += amount
    print("--")
    print("--------------- Günlük harcanacak su miktarına ekleme yapıldı.: \(amount) --------")
    print("--")
    printSituationOfZoo()
  }

  func dailyWaterSpentFromWaterLimit(){
    spendFromWaterLimit(water: willDailySpendWater)
    print("--")
    print("Su limitinden harcanması gereken su miktarı çıkarıldı.")
    print("--")
    printSituationOfZoo()
  }

  func payAllAnimalKeepersMoney(){
    if (louseBudget! < willPayMoney){
      print("--")
      print("Bütçede yeterli miktarda para bulunmamakta.")
      print("--")
    } else {
      louseBudget! -= willPayMoney
      print("--------------- Bakıcı maaşları ödeniyor --------")
      print("--")
      print("--------------- Ödenen bakıcı maaşı toplamı \(willPayMoney) --------")
      print("--")
    }
    printSituationOfZoo()
  }

  func addWillPayMoney(money amount: Double){
    willPayMoney += amount
  }

  func printSituationOfZoo(){
    print("--------------- Hayvanat Bahçesi Bilgileri -----------------")
    print("Hayvanat Bahçesi Bütçesi: \(louseBudget!)")
    print("Hayvanat Bahçesi Su Limiti: \(waterLimit!)")
    print("--------------------------------------------------")
  }

}
