import AppIntents
import SwiftUI
import UserNotifications

struct BuldakRamyunIntent: AppIntent {
    static var title: LocalizedStringResource = "불닭볶음면"

    func perform() async throws -> some IntentResult & ProvidesDialog {
        let content = UNMutableNotificationContent()
        content.title = "짜잔!"
        content.body = "불닭볶음면이 완성되었습니다!"
//        content.sound = .default
        content.sound = UNNotificationSound(named: UNNotificationSoundName("라면송.wav"))

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        try await UNUserNotificationCenter.current().add(request)
        return .result(dialog: "15초 후 불닭볶음면을 먹어봅시다!")
    }
}
