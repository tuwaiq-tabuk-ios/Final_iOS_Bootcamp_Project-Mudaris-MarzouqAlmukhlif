//
//  AppDelegate.swift
//  Salon
//
//  Created by Marzoog Almoklif on 17/04/1443 AH.
//

import UIKit
import MFSDK
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      MFSettings.shared.configure(token: "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL", baseURL: .test)
      
      
      
//      MFSettings.shared.configure(token: "PoJR0-s1HF_JFyiuuJ-ojpBiXXsZpq5imON9hbqOzFNpUUL4oaPFtGsCnXd18sogaekm09oJxOwKxjg-79qtq7JvxTNrc3iRYIGqgJV8179WLbR8Oop9NVC_FHmWnxuSut4FOCQvOEamy9-0n5-D0RRbJNhDbniVqpOlFic5iIvHLELWJIEr0b-jTTqm0VRYaYFkdbqGwwmzsKxwnDVrAVIqMphn_leWvO3x6UcgYBBbCtr6vCdmZetrsp05PDPwAk2MvtN1cHqximLPqqI7JbE6kZDW1Jmg3tTz2HO4GT6E-PDgrbozkeIdG87R8qu818F32XdsIflncyEsFAaGYjp97mUEaRVgSxkPoSknDPjVUSWL1oF7rzh0pY8sGL5ufjJyhOMZ-lucBne4KLH-X3sO2NzfmtE-KLxiHdM7q7Xi174qQGTKX-c5Pm9r_NYMXOgfYOtNleBAxGQoXZa2LocWFuZ_zrtJNW_ec1o13qTO-gvVaMUtyc-W0K8UwPg9K8WQjtkB1vk7JLQozt5H3-gXTfvV-f1WnaRGfdUkrn4_WYfSUINMCMxcWVjn0VmBBibtiaeSMS7Qc88LmltpdvQOg9JlYBO1o9qe13-rhQVJwkp552A4RqcaYLfw10_ywvmoJHs2MZ1TJHBwzDW0tvlsdIUyYVX7Tcj2MtYntXnz84ECKALBTv2EaIaD2FQEV2-VRQ", baseURL: .live)


      // you can change color and title of nvgigation bar
      let them = MFTheme(navigationTintColor: .white, navigationBarTintColor: .lightGray, navigationTitle: "Payment", cancelButtonTitle: "Cancel")
      MFSettings.shared.setTheme(theme: them)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

