//
//  ShopViewController.swift
//  Mudaris
//
//  Created by Marzouq Almukhlif on 27/04/1443 AH.
//

import UIKit

class TeacherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  let shops = Teachers()
  @IBOutlet weak var topBarStackView: UIStackView!
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
      tableView.rowHeight = 130
      tableView.delegate = self
    tableView.dataSource = self
      view.layer.borderWidth = 0.5
      view.layer.borderColor = UIColor.blue.cgColor
    }

    // MARK: - Table view data source

  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shops.shopsNames.count
    }

    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as? TeacherTableViewCell
      cell?.shopImageView.image = UIImage(named: shops.shopsImages[indexPath.row])
      cell?.shopImageView.backgroundColor = .random
      lastColor = cell?.shopImageView.backgroundColor
      cell?.shopName.text = shops.shopsNames[indexPath.row]
      cell?.shopDescription.text = shops.shopsDescriptions[indexPath.row]
        // Configure the cell...

      return cell!
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    switch segue.identifier {
      case "showDetail":

        if let row = tableView.indexPathForSelectedRow?.row {
          let shopName = shops.shopsNames[row]
          let shopDescription = shops.shopsDescriptions[row]
          let shopsImage = shops.shopsImages[row]
              let detailsViewController
                      = segue.destination as! DetailsViewController
          detailsViewController.name = shopName
          detailsViewController.descriptions = shopDescription
          detailsViewController.imageName = shopsImage


        } default:
          preconditionFailure("Unexpected segue identifier.")
      }
  }
  
  

}
