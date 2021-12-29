//
//  ShopViewController.swift
//  Mudaris
//
//  Created by Marzouq Almukhlif on 27/04/1443 AH.
//

import UIKit

class TeacherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate{

  @IBOutlet weak var locationButton: UIButton!
  
  @IBOutlet var SearchBar: UISearchBar!
  
  let shops:[Teachers] = array
  var filterData:[Teachers]!
  var selectedData:Teachers!
  @IBOutlet weak var topBarStackView: UIStackView!
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      tableView.rowHeight = 100
      tableView.delegate = self
    tableView.dataSource = self
      view.layer.borderWidth = 0.5
      view.layer.borderColor = UIColor.blue.cgColor
    
    filterData = shops
    
    
    locationButton.layer.borderColor = UIColor(red: 122/255, green: 167/255, blue: 220/255, alpha: 1.0).cgColor
    }

    // MARK: - Table view data source

  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filterData.count
    }

    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as? TeacherTableViewCell
     
     if filterData.count != 0 {
       cell?.shopImageView.image = filterData[indexPath.row].image
        cell?.shopImageView.backgroundColor = .random
       cell?.shopName.text = filterData[indexPath.row].cores
        cell?.shopDescription.text = filterData[indexPath.row].info
     } else {
       cell?.shopImageView.image = shops[indexPath.row].image
        cell?.shopImageView.backgroundColor = .random
       cell?.shopName.text = shops[indexPath.row].cores
        cell?.shopDescription.text = shops[indexPath.row].info
     }
     
        // Configure the cell...
        
      return cell!
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    switch segue.identifier {
      case "showDetail":

        if let row = tableView.indexPathForSelectedRow?.row {
         
              let detailsViewController = segue.destination as! DetailsViewController
          detailsViewController.array = filterData[row]


        } default:
          preconditionFailure("Unexpected segue identifier.")
      }
  }
  
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filterData = searchText.isEmpty ? shops : shops.filter {
      (item : Teachers) -> Bool in
      
      return item.cores.range(of: searchText, options: .caseInsensitive , range: nil,locale: nil) != nil
    }
    
    tableView.reloadData()
  }

}
