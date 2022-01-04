//
//  Shops.swift
//  Salon
//
//  Created by Marzouq Almukhlif on 17/04/1443 AH.
//

import UIKit


struct DateTime {
  let date:String
  let time:[String]
}

let array:[Teachers] = [
  Teachers(name: "احمد الخالدي",
           cores: "مدرس لغة انجليزية",
           age: "40",
           info: "اقوم بتعليم الطالب في المرحلة الابتدائية اساسيات اللغة الانجليزيه وتعليمه المنهج والقواعد الاساسية ومساعدته في حل واجباته وتعليمه على طريقة الحل الصحيحة ",
           exper: "10",
           stage: "الابتدائي",
           requestDate: [
            DateTime(date: "2021-12-26", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-27", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-30", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
           
           reservationDate: [
            DateTime(date: "2021-12-26", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-27", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-30", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
           image: UIImage(named: "icon")!),
  
  Teachers(name: "محمد المصري",
           cores: "مدرس لغة عربية",
           age: "35",
           info: "اقوم بتعليم الطالب في المرحلة الابتدائية اساسيات اللغة العربية وتعليمه المنهج والقواعد الاساسية ومساعدته في حل واجباته وتعليمه على طريقة الحل الصحيحة ",
           exper: "6",
           stage: "الابتدائي",
           
           
           requestDate: [
            DateTime(date: "2021-12-19", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-20", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-23", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
           
           reservationDate: [
            DateTime(date: "2021-12-16", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-17", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-18", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
           image: UIImage(named: "icon")!),
  
  Teachers(name: "خالد الشهري",
           cores: "مدرس رياضيات",
           age: "30",
           info: "اقوم بتعليم الطالب في المرحلة الابتدائية اساسيات الرياضيات وتعليمه المنهج والقواعد الاساسية ومساعدته في حل واجباته وتعليمه على طريقة الحل الصحيحة ",
           exper: "8",
           stage: "الثانوي",
           
           
           requestDate: [
            DateTime(date: "2021-12-16", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-17", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-18", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
           
           
           
           reservationDate: [
            DateTime(date: "2021-12-19", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-20", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-23", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
           
           image: UIImage(named: "icon")!)
]

struct Teachers {
  
  let name:String
  let cores:String
  let age:String
  let info:String
  let exper:String
  let stage:String
  let requestDate:[DateTime]
  let reservationDate:[DateTime]
  let image:UIImage
  
  
  
  var shopsNames = ["مدرس لغة انجليزية"
                    ,"مدرس لغة عربية"
                    ,"مدرس رياضيات"
                    ,"مدرس علوم"
                    ,"مدرس تاريخ"
                    ,"مدرس احمد رياضيات"
                    ,"مدرس خلف فيزياء"
                    ,"مدرس المرحلة الابتدائة"
                    ,"Salon 4",
                    "Salon 5"]
  
  var shopsDescriptions = ["هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة."]
  
  var shopsImages = ["icon"]
  
  
  
}
