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
      MFSettings.shared.configure(token: "W_d3MNWeO8Jt1_PeR4R1QWQpdfayqOFD5LGPosWt25kvLboCW3UMilT9XMNdkjO7izGVR9j-jTzz9H1lzfCV9VnvsGrR_EKNWHcVqNcVAtOdk2m88pgcXKUouyRozDDqT74zWDEuK-rzHx6UP_aFKaEuwkJmesqPOkWPhGaCPDGcZGkSJ2FtCNJJjTgVBN1ET-23QpTk3Zqj27wxRK1Ob0q5TmHdd5JyOFUyORcGMeMAwrz7eKfAadeFMMg2J-Ugnjevzu40sZ7MRgRpLVqMFZ4tWvV8xmyS5oVuuv6jXPI8VMwvJoA6iwsrAtvhAN8IpkB-iFuxxnGR-_vnnk0-M892KfGws6oh-cpfLF0Wsas_54msdXgQTCY8hfme9WeYc6ddwGOx48m-1l5QZzzycFKnw2wp3GZGcxbvkN4MXEMa90FIirWZmkb86Y7XS9Hviwoq5K-lO-OReFAwJ11ApbMj6WGsAofz7KLSR1Y6_YNpEQiDDAO2glpJ6zx-1DLXSSpXq2C-b5dVy9LsLtKu0CJ3IgIHuGXM-fa-QeFxDDdEKz3CgAtMNEb3ZICdoGH8hR9Y-lP1CR0i157aEeMHTVxLDutFmmTo3KwIp5sq9O9XxrGaToIy54qCaTSb4UGNTHJd8Nl59pGCkD02r-i2sSExbRwNWP8EjBHAi0KQxM0vSOJc", baseURL: .live)


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

