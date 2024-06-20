//
//  TimerViewModel.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/17/24.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var isDisplaySetTimeView: Bool
    @Published var time: Time
    @Published var timer: Timer?
    @Published var timerRemaining: Int
    @Published var isPaused: Bool
    var notificationService: NotificationService
    
    init(
        isDisplaySetTimeView: Bool = true,
        time: Time = .init(minutes: 0, seconds: 0),
        timer: Timer? = nil,
        timerRemaining: Int = 0,
        isPaused: Bool = false,
        notificationService: NotificationService = .init()
    ) {
        self.isDisplaySetTimeView = isDisplaySetTimeView
        self.time = time
        self.timer = timer
        self.timerRemaining = timerRemaining
        self.isPaused = isPaused
        self.notificationService = notificationService
    }
}

extension TimerViewModel {
    func settingBtnTapped() {
        isDisplaySetTimeView = false
        timerRemaining = time.convertedSeconds
        startTimer()
    }
    
    func cancelBtnTapped() {
        stopTimer()
        isDisplaySetTimeView = true
    }
    
    func pauseOrRestartBtnTapped() {
        if isPaused {
            startTimer()
        } else {
            timer?.invalidate()
            timer = nil
        }
        isPaused.toggle()
    }
}


extension TimerViewModel {
    
    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timerRemaining > 0 {
                self.timerRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.notificationService.sendNotification()
                print("타이머가 종료되었습니다")
            }
        }
    }

    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
