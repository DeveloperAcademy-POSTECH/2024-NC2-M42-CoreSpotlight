//
//  TimerModel.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/17/24.
//

import SwiftUI

struct Time {
    var minutes: Int
    var seconds: Int
    
    var convertedSeconds: Int {
        return (minutes * 60) + seconds
    }
    
    static func fromSeconds(_ seconds: Int) -> Time {
        let minutes = (seconds % 3600) / 60
        let remainingSeconds = (seconds % 3600) % 60
        return Time (minutes: minutes, seconds: remainingSeconds)
    }
}

extension Int {
    var formattedTimeString: String {
        let time = Time.fromSeconds(self)
        let minutesString = String(format: "%02d", time.minutes)
        let secondsString = String(format: "%02d", time.seconds)
        
        return "\(minutesString)분 \(secondsString)초"
    }
    
    var formattedSettingTime: String {
        let currentDate = Date()
        let settingDate = currentDate.addingTimeInterval(TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        dateFormatter.dateFormat = "HH:MM"
        
        let formattedTime = dateFormatter.string(from: settingDate)
        return formattedTime
    }
}
