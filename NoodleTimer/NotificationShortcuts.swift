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

