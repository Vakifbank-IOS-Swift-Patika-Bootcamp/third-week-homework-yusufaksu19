//
//  ShowEmployeesViewController.swift
//  ThirdWeek-FirstHomework
//
//  Created by Yusuf Aksu on 16.11.2022.
//

import UIKit

class ShowEmployeesViewController: UIViewController {


  @IBOutlet weak var tableView: UITableView!
  var employeesArray = [String]()
  var items: [String] = []

  @IBOutlet weak var searchBarHide: UISearchBar!

  override func viewDidLoad() {
        super.viewDidLoad()
    searchBarHide.isHidden = true

    tableView.delegate = self
    tableView.dataSource = self

    items = employeesArray

    let search = UISearchController(searchResultsController: nil)
           search.searchResultsUpdater = self
           search.searchBar.placeholder = "Type something to search"
           navigationItem.searchController = search

    }

}

extension ShowEmployeesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      guard let text = searchController.searchBar.text else { return }
    employeesArray = items.filter({ $0.description == text })
      if text == "" {
        employeesArray = items
      }
    tableView.reloadData()
  }
}

extension ShowEmployeesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employeesArray.count
  }
}

extension ShowEmployeesViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeesTableViewCell", for: indexPath) as! EmployeesTableViewCell
    cell.employeeName.text = employeesArray[indexPath.row].description
    return cell
  }


}

