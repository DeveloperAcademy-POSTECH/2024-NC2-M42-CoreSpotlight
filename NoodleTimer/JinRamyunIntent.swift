import AppIntents
import SwiftUI
import UserNotifications

struct JinRamyunIntent: AppIntent {
    static var title: LocalizedStringResource = "진라면"

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let content = UNMutableNotificationContent()
        content.title = "짜잔!"
        content.body = "진라면이 완성되었습니다!"
        content.sound = .default
//        content.sound = UNNotificationSound(named: UNNotificationSoundName("라면송.wav"))


        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        try await UNUserNotificationCenter.current().add(request)
        return .result(dialog: "10초 후 진라면을 먹어봅시다!")
    }
}
