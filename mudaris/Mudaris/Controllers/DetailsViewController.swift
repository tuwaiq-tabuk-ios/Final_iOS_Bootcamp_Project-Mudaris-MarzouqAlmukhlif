//
//  DetailsViewController.swift
//  Salon
//
//  Created by Marzouq Almukhlif on 23/04/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {
  
  @IBOutlet weak var shopName: UILabel!
  @IBOutlet weak var shopRating: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet var checkBoxButton: UIButton!
  
  @IBOutlet var nameLabel: UILabel!
  
  @IBOutlet var ageLabel: UILabel!
  
  @IBOutlet var descriptionLabel: UILabel!
  
  @IBOutlet var experienceLabel: UILabel!
  
  @IBOutlet var stageLabel: UILabel!
  
  var array:Teachers?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    shopName.text = array?.cores
    shopRating.text = array?.info
    imageView.image = array?.image
    nameLabel.text = array?.name
    ageLabel.text = array?.age
    descriptionLabel.text = array?.info
    experienceLabel.text = "\(array!.exper) سنوات"
    stageLabel.text = array?.stage
    
    
    // Do any additional setup after loading the view.
    
    checkBoxButton.setBackgroundImage(UIImage(named: "checkBox_Yes"), for: .selected)
    self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController!.navigationBar.shadowImage = UIImage()
    self.navigationController!.navigationBar.isTranslucent = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    imageView.backgroundColor = .white
  }
  @IBAction func checkBoxTapped(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
  }
  
  @IBAction func requestButtonTapped(_ sender: UIButton) {
    if checkBoxButton.isSelected {
      print("~~ YES")
      performSegue(withIdentifier: "requestShow", sender: nil)
    } else {
      print("~~ NO")
    }
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "reservationShow":
      if let vc = segue.destination as? InvoiceController {
        vc.array = array
        vc.arrayDate = array?.reservationDate
      }
    case "requestShow":
      if let vc = segue.destination as? InvoiceController {
        vc.array = array
        vc.arrayDate = array?.reservationDate
      }
    default:
      print("Other")
    }
  }
  
  
  @IBAction func reservationButtonTapped(_ sender: UIButton) {
    if checkBoxButton.isSelected {
      print("~~ YES")
      performSegue(withIdentifier: "reservationShow", sender: nil)
    } else {
      print("~~ NO")
    }
    
  }
  
  
  
}
