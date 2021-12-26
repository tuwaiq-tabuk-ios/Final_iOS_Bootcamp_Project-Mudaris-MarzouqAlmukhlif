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
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let pvc = storyboard.instantiateViewController(withIdentifier: "InvoiceController") as! InvoiceController
      pvc.array = array
      pvc.arrayDate = array?.requestDate
      pvc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      self.present(pvc, animated: true, completion: nil)
    } else {
      print("~~ NO")
    }
    
  }
  
  
  @IBAction func reservationButtonTapped(_ sender: UIButton) {
    if checkBoxButton.isSelected {
      print("~~ YES")
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let pvc = storyboard.instantiateViewController(withIdentifier: "InvoiceController") as! InvoiceController
      pvc.array = array
      pvc.arrayDate = array?.reservationDate
      pvc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
      self.present(pvc, animated: true, completion: nil)
    } else {
      print("~~ NO")
    }
    
  }
  
  
  
}
