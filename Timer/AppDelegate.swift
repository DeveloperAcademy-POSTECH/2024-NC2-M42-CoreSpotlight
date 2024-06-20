//
//  AppDelegate.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/17/24.
//

import UIKit
import NotificationCenter

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
       UNUserNotificationCenter.current().delegate = self
    
       let authorizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        UNUserNotificationCenter.current().requestAuthorization(options: authorizationOptions, completionHandler: { granted, error in
           if let error = error {
               print("ERROR: " + error.localizedDescription)
           }
       })

       return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
     // Foreground(앱 켜진 상태)에서도 알림 오는 설정
            func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
                completionHandler([.list, .banner])
                print(#function)
            }
    
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
            print("didrecieve")
        }
}
