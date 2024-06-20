//
//  Notification.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/17/24.
//

import UserNotifications

struct NotificationService {
    func sendNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]) { granted, _ in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "타이머 종료!"
                content.body = "라면이 맛있게 조리되었습니다."
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                { error in
                        if let error = error {
                            print("Error adding notification: \(error.localizedDescription)")
                        } else {
                            print("노티피케이션이 전송되었습니다")
                        }
                    }
                
            }
        }
    }
}


