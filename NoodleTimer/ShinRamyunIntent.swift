import AppIntents
import SwiftUI
import UserNotifications

struct ShinRamyunIntent: AppIntent {
    static var title: LocalizedStringResource = "신라면"

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let content = UNMutableNotificationContent()
        content.title = "짜잔!"
        content.body = "신라면이 완성되었습니다!"
//        content.sound = .default
        content.sound = UNNotificationSound(named: UNNotificationSoundName("라면송.wav"))


        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        try await UNUserNotificationCenter.current().add(request)
        return .result(dialog: "5초 후 신라면을 먹어봅시다!")
    }
}
