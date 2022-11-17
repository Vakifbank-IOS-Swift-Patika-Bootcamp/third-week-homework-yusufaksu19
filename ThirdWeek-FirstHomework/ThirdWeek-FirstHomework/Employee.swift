//
//  Employee.swift
//  ThirdWeek-FirstHomework
//
//  Created by Yusuf Aksu on 16.11.2022.
//

import Foundation

enum EmployeeRank: Int{
  case junior = 10
  case mid = 20
  case senior = 30
}

enum EmployeeRelationShip: String{
  case single = "Bekar"
  case engaged = "Nişanlı"
  case married = "Evli"
}


class Employee {
  let employeeName: String?
  var employeeAge: Int?
  var employeeRelationship: EmployeeRelationShip?
  var employeeRank: EmployeeRank?
  var employeeReveneu: Double? = 0
  var delegate: CompanyEmployeeDelegate?

  init(employeeName: String, employeeAge: Int, employeeRelationship: EmployeeRelationShip, employeeRank: EmployeeRank, delegate: CompanyEmployeeDelegate) {
    print("--------------- Yeni Personel Oluşturuldu -----------------")
    self.employeeName = employeeName
    self.employeeAge = employeeAge
    self.employeeRelationship = employeeRelationship
    self.employeeRank = employeeRank
    self.delegate = delegate
    newEmployeeAdded()
    printPersonalInformation()
  }

  func calculateEmployeeSalary() -> Double {
    employeeReveneu = Double(employeeAge! * employeeRank!.rawValue * 100)
    print("--")
    print("--------------- Personel Maaşı Hesaplanıyor: \(employeeReveneu!) --------")
    print("--")
    printPersonalInformation()
    return employeeReveneu!
  }

  func newEmployeeAdded() {
    self.delegate?.addNewEmployee(count: 1)
    self.delegate?.calculateEmployeesTotalMoney(money: calculateEmployeeSalary())
    self.delegate?.printCompanyInformations()
    self.delegate?.addEmployeeToList(name: self.employeeName!)
  }

  func printPersonalInformation() {
    print("--------------- Personel Bilgileri -----------------")
    print("Personel Adı: \(employeeName!)")
    print("Personel Yaşı: \(employeeAge!)")
    print("Personel İlişki Durumu: \(employeeRelationship!.rawValue)")
    print("Personel Statüsü: \(employeeRank!)")
    print("Personel Maaşı: \(employeeReveneu!)")
    print("--------------------------------------------------")
  }

}
