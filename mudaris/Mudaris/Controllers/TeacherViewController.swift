//
//  ShopViewController.swift
//  Mudaris
//
//  Created by Marzouq Almukhlif on 27/04/1443 AH.
//

import UIKit

class TeacherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var locationButton: UIButton!
  
  let shops:[Teachers] = array
  @IBOutlet weak var topBarStackView: UIStackView!
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      tableView.rowHeight = 100
      tableView.delegate = self
    tableView.dataSource = self
      view.layer.borderWidth = 0.5
      view.layer.borderColor = UIColor.blue.cgColor
    
    
    
    
    locationButton.layer.borderColor = UIColor(red: 122/255, green: 167/255, blue: 220/255, alpha: 1.0).cgColor
    }

    // MARK: - Table view data source

  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shops.count
    }

    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as? TeacherTableViewCell
     cell?.shopImageView.image = shops[indexPath.row].image
      cell?.shopImageView.backgroundColor = .random
     cell?.shopName.text = shops[indexPath.row].cores
      cell?.shopDescription.text = shops[indexPath.row].info
        // Configure the cell...
        
      return cell!
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    switch segue.identifier {
      case "showDetail":

        if let row = tableView.indexPathForSelectedRow?.row {
         
              let detailsViewController = segue.destination as! DetailsViewController
          detailsViewController.array = shops[row]


        } default:
          preconditionFailure("Unexpected segue identifier.")
      }
  }
  
  

}
