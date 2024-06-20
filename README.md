# 2024-NC2-M0-AugmentedReality
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About Augmented Reality
> **Phone과 Mac에서 필요한 것을 빠르게 찾을 수 있는 검색 엔진**<br/>

- 사용자가 **Spotlight 및 Safari에서** **콘텐츠와 기능을 검색할 수 있도록** 앱을 인덱싱하는 프레임워크 (iOS 9.0+)
- 사진첩, 연락처, 구매한 항목과 같은 영구 사용자 데이터에 라벨을 붙이고 관리하는 API 제공
- **→ 앱 콘텐츠에 대한 링크를 만들 수 있음**

## 🎯 What we focus on?
> **App shortcut Spotlight & Siri**<br/> 
spotlight에서 앱 이름을 검색하면 가장 두드러진 기능 3가지가 top hit에 버튼처럼 뜹니다. 사용자가 앱의 기능을 가장 빠르게 접근해서 사용할 수 있게 도와주는 기능이기 때문에 app shortcut에 집중하기로 했습니다.

## 💼 Use Case
> **Spotlight & Siri의 단축어 기능을 이용해서 라면 종류에 따른 타이머를 쉽고 빠르게 실행하자!** <br/> 

## 🖼️ Prototype
<img src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-M42-CoreSpotlight/assets/60493105/3565b831-d6fd-42cc-ab51-48ee6f00784f"></br>
App Shortcut용 앱 '라면 타이머'를 만들었습니다.
Spotlight에서 '라면'을 입력하면 '가장 연관성 높은 항목'에 라면 타이머 앱과 3개의 단축어가 노출됩니다.

## 🛠️ About Code
### App Intents

App Intent로 주요기능을 단축어로 만듭니다. 이 코드를 작성하면 앱 설치시 단축어앱에 자동으로 단축어를 설치합니다.

```swift
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
```

### Shortcut

App intents로 shortcut을 만들 수 있습니다. 

intent, phrases, shortTitle, systemImageName 파라미터는 꼭 작성되어야하는 항목입니다. 

pharases는 영문으로 작성해야합니다. *siri의 로컬라이징 문제로 파악됨.

```swift
import AppIntents

struct NotificationShortcuts: AppShortcutsProvider {
//    @AppShortcutsBuilder
    static var shortcutTileColor: ShortcutTileColor = .blue
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: ShinRamyunIntent(),
            phrases: ["Start a \(.applicationName) 1timer"],
            shortTitle: "신라면",
            systemImageName: "flame.fill"
        )
        
        AppShortcut(
            intent: JinRamyunIntent(),
            phrases: ["Start a \(.applicationName) 2timer"],
            shortTitle: "진라면",
            systemImageName: "water.waves"
        )
        
        AppShortcut(
            intent: BuldakRamyunIntent(),
            phrases: ["Start a \(.applicationName) 3timer"],
            shortTitle: "불닭볶음면",
            systemImageName: "bird.fill"
        )
    }
}
```
