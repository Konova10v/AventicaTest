//
//  AventicaTestApp.swift
//  AventicaTest
//
//  Created by Кирилл Коновалов on 22.10.2021.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport
import HealthKit

@main
struct AventicaTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(ProfileViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.requestTrackingAuthorization()
        })
        
        return true
    }
    
    @objc func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.authorizeHealthKit()
                    print("Пользователь разрешил доступ.")
                case .denied, .restricted:
                    self.authorizeHealthKit()
                    print("Пользователь запретил доступ.")
                case .notDetermined:
                    self.authorizeHealthKit()
                    print("Пользователь ещё не получил запрос на авторизацию.")
                @unknown default:
                    break
                }
            }
        }
    }
    
    @objc func authorizeHealthKit(){
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
          guard authorized else {
            let baseMessage = "HealthKit: Авторизация не удалась"
                
            if let error = error {
              print("\(baseMessage). Причина: \(error.localizedDescription)")
            } else {
              print(baseMessage)
            }
            return
          }
          print("HealthKit: Успешно авторизован")
        }
    }
}
