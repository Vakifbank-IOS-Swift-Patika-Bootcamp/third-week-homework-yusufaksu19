//
//  File.swift
//  ThirdWeek-FirstHomework
//
//  Created by Yusuf Aksu on 16.11.2022.
//

import Foundation



protocol CompanyEmployeeDelegate {
  var employeesTotalMoney: Double { get set }
  var companyBudget: Double? { get set }
  var companyEmployeesCount: Int? { get set }
  func substractMoneyFromBudget(substract money: Double)
  func addMoneyToBudget(add money: Double)
  func addNewEmployee(count employee: Int)
  func calculateEmployeesTotalMoney(money amount: Double)
  func printCompanyInformations()
  func addEmployeeToList(name person: String)
}

class Company: CompanyEmployeeDelegate{
  var companyBudget: Double?
  let companyName: String?
  var companyEmployeesCount: Int?
  let companyStartYear: String
  var employeesTotalMoney: Double = 0.0
  var employeeList = [String]()
  
  init (companyName: String, companyEmployeesCount: Int, companyStartYear: String, companyBudget: Double) {
    self.companyName = companyName
    self.companyEmployeesCount = companyEmployeesCount
    self.companyStartYear = companyStartYear
    self.companyBudget = companyBudget
    printCompanyInformations()
  }

  func addMoneyToBudget(add money: Double){
    companyBudget? += money
    print("--")
    print("--------------- Bütçeye yeni para ekleniyor: \(money) --------")
    print("--")
    printCompanyInformations()
  }

  func substractMoneyFromBudget(substract money: Double){
    if (companyBudget! < money) {
      print("--")
      print("Bütçede yeterli miktarda para bulunmamakta.")
      print("--")
    } else {
      companyBudget? -= money
      print("--")
      print("--------------- Bütçeden para eksiliyor: \(money) --------")
      print("--")
    }

    printCompanyInformations()
  }

  func addNewEmployee(count employee: Int){
    companyEmployeesCount! += employee
    print("--")
    print("--------------- Yeni Çalışan Ekleniyor: \(employee) --------")
    print("--")
    printCompanyInformations()
  }

  func addEmployeeToList(name person: String){
    employeeList.append(person)
  }

  func calculateEmployeesTotalMoney(money amount: Double){
    self.employeesTotalMoney += amount
    print("--")
    print("--------------- Çalışanlara Ödenmesi Gereken Para Güncelleniyor Artış Miktarı:  \(amount) -------- Toplam Ulaşılan Mebla: \(self.employeesTotalMoney)")
    print("--")
  }

  func payMoneyToAllEmployees(completed: () -> Void){

    if (self.companyBudget! <= employeesTotalMoney) {
      print("--")
      print("Bütçede yeterli miktarda para bulunmamakta!")
      print("--")
    } else {
      self.companyBudget! -= employeesTotalMoney
      print("--")
      print("--------------- Çalışanlara Ödenmesi Gereken Para Toplamı: \(employeesTotalMoney) ödemesi yapıldı ve bütçeden çıkarıldı. --------")
      print("--")
      employeesTotalMoney = 0
    }
    completed()
    printCompanyInformations()
  }

  func printCompanyInformations() {
    print("--------------- Şirket Bilgileri -----------------")
    print("Şirket Adı: \(companyName!)")
    print("Şirketteki Çalışan Sayısı: \(companyEmployeesCount!)")
    print("Şirket Bütçesi: \(companyBudget!)")
    print("Şirket Kuruluş Yılı: \(companyStartYear)")
    print("--------------------------------------------------")
  }

}
