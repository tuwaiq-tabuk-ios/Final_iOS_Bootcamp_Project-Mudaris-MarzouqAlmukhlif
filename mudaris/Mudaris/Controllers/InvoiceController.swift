//
//  InvoiceController.swift
//  Mudaris
//
//  Created by Marzouq Almukhlif on 08/05/1443 AH.
//

import UIKit
import FSCalendar
import MFSDK

class InvoiceController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,UICollectionViewDelegate,UICollectionViewDataSource {

  var paymentMethods: [MFPaymentMethod]?
  var selectedPaymentMethodIndex: Int?
  
  //MARK: Outlet
  @IBOutlet weak var errorCodeLabel : UILabel!
  @IBOutlet weak var payButton: UIButton!
  @IBOutlet weak var amountTextField: UITextField!
  @IBOutlet weak var resultTextView: UITextView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet var cardInfoStackViews: [UIStackView]!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var cardNumberTextField: UITextField!
  @IBOutlet weak var cardHolderNameTextField: UITextField!
  @IBOutlet weak var monthTextField: UITextField!
  @IBOutlet weak var yearTextField: UITextField!
  @IBOutlet weak var secureCodeTextField: UITextField!
  @IBOutlet weak var sendPaymentButton: UIButton!
  @IBOutlet weak var sendPaymentActivityIndicator: UIActivityIndicatorView!
  
  
  //at list one product Required
  let productList = NSMutableArray()

  @IBOutlet var viewIn: UIView!
  @IBOutlet var viewBlack: UIView!
  
  @IBOutlet var calender: FSCalendar!
  
  @IBOutlet var buttonTimeOne: UIButton!
  @IBOutlet var buttonTimeTwo: UIButton!
  @IBOutlet var buttonTimeThree: UIButton!
  
  var array:Teachers?
  var arrayDate:[DateTime]?
  
  var selectedDate:String?
  var selectedTime:String?
  
  @IBOutlet var teacherSelected: UILabel!
  
  @IBOutlet var ordarLabel: UILabel!
  
  @IBOutlet var dayLabel: UILabel!
  
  @IBOutlet var dateLabel: UILabel!
  
  @IBOutlet var timeLabel: UILabel!
  
  
  
  @IBOutlet var InvoiceOneStackView: UIStackView!
  @IBOutlet var InvoiceTwoStackView: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewBlack.layer.opacity = 0
    viewIn.clipsToBounds = true
    viewIn.layer.cornerRadius = 50
    
    viewIn.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    // Top right corner, Top left corner respectively
    calender.delegate = self
    calender.dataSource = self
    setupCalendar()
    
    
//    setCardInfo()
    initiatePayment()
    
    // Do any additional setup after loading the view.
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn) {
      self.viewBlack.layer.opacity = 1
    }
    self.InvoiceTwoStackView.layer.opacity = 0
  }
  
  
  
  @IBAction func dissmisView(_ sender: Any) {
    
    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn) {
      self.viewBlack.layer.opacity = 0
      
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
      self.dismiss(animated: true, completion: nil)
    }
    
    
  }
  
  func setupCalendar() {
    calender.appearance.selectionColor = UIColor(red: 78/255, green: 119/255, blue: 160/255, alpha: 1.0)
    //    calender.appearance.todayColor = .clear
    calender.appearance.titleTodayColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1.0)
    
    
    
    calender.appearance.headerTitleColor = UIColor(red: 122/255, green: 167/255, blue: 220/255, alpha: 1.0)
    
    calender.appearance.weekdayTextColor = UIColor(red: 122/255, green: 167/255, blue: 220/255, alpha: 1.0)
    
    
    calender.appearance.titleFont = UIFont.boldSystemFont(ofSize: calender.appearance.titleFont.pointSize)
    calender.appearance.weekdayFont = UIFont(name: "DIN Next LT W23 Medium", size: calender.appearance.weekdayFont.pointSize + 2)
    
    calender.appearance.subtitleFont = UIFont(name: "DIN Next LT W23 Medium", size: calender.appearance.subtitleFont.pointSize + 2)
    
    calender.appearance.headerTitleFont = UIFont(name: "DIN Next LT W23 Bold", size: calender.appearance.headerTitleFont.pointSize + 2)
    
  }
  
  
  func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
    let array = arrayDate
    var dateArray = [String]()
    var timeArray = [String]()
    let dateCalendar = getDate(date)
    
    array?.forEach({ DateTime in
      dateArray.append(DateTime.date)
      if dateArray.contains(dateCalendar){
        DateTime.time.forEach { time in
          timeArray.append(time)
        }
      }
      
    })
    
    buttonTimeOne.setTitle(timeArray[0], for: .normal)
    buttonTimeTwo.setTitle(timeArray[1], for: .normal)
    buttonTimeThree.setTitle(timeArray[2], for: .normal)
    selectedDate = dateCalendar;
    return true
  }
  
  func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
    
    let dateCalendar = getDate(date)
    
    let array = arrayDate
    var dateArray = [String]()
    
    array?.forEach({ DateTime in
      dateArray.append(DateTime.date)
    })
    
    if dateArray.contains(dateCalendar) {
      cell.titleLabel.textColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1.0)
    }else {
      cell.titleLabel.textColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1.0)
      cell.isUserInteractionEnabled = false
    }
    
    
  }
  
  func getDate(_ date:Date) -> String {
    let date : Date = date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.locale = NSLocale(localeIdentifier: "en-US") as Locale
    let dateCalendar = dateFormatter.string(from: date)
    return dateCalendar
  }
  
  
  
  func minimumDate(for calendar: FSCalendar) -> Date {
    return Date()
  }
  
  
  @IBAction func timeButtonTapped(_ sender: UIButton) {
    selectedTime(sender)
  }
  
  
  @IBAction func moveToPayButtonTapped(_ sender: UIButton) {
    
    if (selectedDate == nil) {
      let alert = UIAlertController(title: "Date", message: "Place select the date", preferredStyle: .alert)
      
      let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
        
      }
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
    } else if (selectedTime == nil) {
      let alert = UIAlertController(title: "time", message: "Place select the time", preferredStyle: .alert)
      
      let action = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
        
      }
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
    } else {
      
      print("~~ \(selectedDate!) - \(selectedTime!)")
      
      teacherSelected.text = array?.cores
      ordarLabel.text = array?.cores
      dayLabel.text = "The"
      dateLabel.text = selectedDate
      timeLabel.text = selectedTime
      
      UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn) {
        self.InvoiceTwoStackView.layer.opacity = 1
        self.InvoiceOneStackView.layer.opacity = 0
        
      }
      
      
    }
    
  }
  
  
  func selectedTime(_ sender:UIButton) {
    
    let colorSelected = UIColor(red: 84/255, green: 110/255, blue: 138/255, alpha: 1.0)
    
    let colorUnSelected = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1.0)
    
    if sender.tag == 1 {
      buttonTimeOne.setTitleColor(colorSelected, for: .normal)
      buttonTimeOne.superview!.layer.borderColor = colorSelected.cgColor
      buttonTimeOne.superview!.layer.borderWidth = 1
      
      buttonTimeTwo.setTitleColor(colorUnSelected, for: .normal)
      buttonTimeTwo.superview!.layer.borderColor = UIColor.clear.cgColor
      buttonTimeTwo.superview!.layer.borderWidth = 1
      
      buttonTimeThree.setTitleColor(colorUnSelected, for: .normal)
      buttonTimeThree.superview!.layer.borderColor = UIColor.clear.cgColor
      buttonTimeThree.superview!.layer.borderWidth = 1
      
      
    } else if sender.tag == 2 {
      buttonTimeOne.setTitleColor(colorUnSelected, for: .normal)
      buttonTimeOne.superview!.layer.borderColor = UIColor.clear.cgColor
      buttonTimeOne.superview!.layer.borderWidth = 1
      
      buttonTimeTwo.setTitleColor(colorSelected, for: .normal)
      buttonTimeTwo.superview!.layer.borderColor = colorSelected.cgColor
      buttonTimeTwo.superview!.layer.borderWidth = 1
      
      buttonTimeThree.setTitleColor(colorUnSelected, for: .normal)
      buttonTimeThree.superview!.layer.borderColor = UIColor.clear.cgColor
      buttonTimeThree.superview!.layer.borderWidth = 1
      
    } else {
      buttonTimeOne.setTitleColor(colorUnSelected, for: .normal)
      buttonTimeOne.superview!.layer.borderColor = UIColor.clear.cgColor
      buttonTimeOne.superview!.layer.borderWidth = 1
      
      buttonTimeTwo.setTitleColor(colorUnSelected, for: .normal)
      buttonTimeTwo.superview!.layer.borderColor = UIColor.clear.cgColor
      buttonTimeTwo.superview!.layer.borderWidth = 1
      
      buttonTimeThree.setTitleColor(colorSelected, for: .normal)
      buttonTimeThree.superview!.layer.borderColor = colorSelected.cgColor
      buttonTimeThree.superview!.layer.borderWidth = 1
      
    }
    selectedTime = sender.titleLabel?.text
  }
  
  
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      guard let paymentMethods = paymentMethods else {
          return 0
      }
      return paymentMethods.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      selectedPaymentMethodIndex = indexPath.row
//      payButton.isEnabled = true

//      if let paymentMethods = paymentMethods {
//          if paymentMethods[indexPath.row].isDirectPayment {
//              hideCardInfoStacksView(isHidden: false)
//          } else {
//              hideCardInfoStacksView(isHidden: true)
//          }
//      }
      collectionView.reloadData()
  }
  
//  func hideCardInfoStacksView(isHidden: Bool) {
//      for stackView in cardInfoStackViews {
//          stackView.isHidden = isHidden
//      }
//  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "payMethodsCell", for: indexPath) as! payMethodsCell
      if let paymentMethods = paymentMethods, !paymentMethods.isEmpty {
          let selectedIndex = selectedPaymentMethodIndex ?? -1
          cell.configure(paymentMethod: paymentMethods[indexPath.row], selected: selectedIndex == indexPath.row)
      }
      return cell
  }
  


  


}



extension InvoiceController  {
  func startSendPaymentLoading() {
//      errorCodeLabel.text = "Status:"
//      resultTextView.text = "Result:"
//      sendPaymentButton.setTitle("", for: .normal)
//      sendPaymentActivityIndicator.startAnimating()
  }
  func stopSendPaymentLoading() {
//      sendPaymentButton.setTitle("Send Payment", for: .normal)
//      sendPaymentActivityIndicator.stopAnimating()
  }
  func startLoading() {
//      errorCodeLabel.text = "Status:"
//      resultTextView.text = "Result:"
//      payButton.setTitle("", for: .normal)
//      activityIndicator.startAnimating()
  }
  func stopLoading() {
//      payButton.setTitle("Pay", for: .normal)
//      activityIndicator.stopAnimating()
  }
  func showSuccess(_ message: String) {
//      errorCodeLabel.text = "Succes"
//      resultTextView.text = "result: \(message)"
  }
  
  func showFailError(_ error: MFFailResponse) {
//      errorCodeLabel.text = "responseCode: \(error.statusCode)"
//      resultTextView.text = "Error: \(error.errorDescription)"
  }
}
extension InvoiceController {
  func hideCardInfoStacksView(isHidden: Bool) {
      for stackView in cardInfoStackViews {
          stackView.isHidden = isHidden
      }
  }
  private func setCardInfo() {
      cardNumberTextField.text = "5123450000000008"
      cardHolderNameTextField.text = "John Wick"
      monthTextField.text = "05"
      yearTextField.text = "21"
      secureCodeTextField.text = "100"
  }
}
  
