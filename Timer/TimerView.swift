//
//  TimerView.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/18/24.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerViewModel: TimerViewModel
   
    
    var body: some View {
        TimerOperationView(timerViewModel: timerViewModel)
    }
}

private struct TimerOperationView: View {
    @ObservedObject private var timerViewModel: TimerViewModel
    @Environment(\.dismiss) private var dismiss // 추가된 부분
    
    fileprivate init(timerViewModel: TimerViewModel) {
        self.timerViewModel = timerViewModel
    }
    
    fileprivate var body: some View {
        ZStack {
            Color("bgColor")
                .ignoresSafeArea()
            VStack {
                Spacer()
                ZStack {
                    VStack {
                        Text("\(timerViewModel.timerRemaining.formattedTimeString)")
                            .font(.system(size: 42))
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    }
                    
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.accent)
//                        .opacity(0.2)
                        .frame(width: 350)
                }
                
                Spacer()
                
                HStack {
                    Button(
                        action: {
                            timerViewModel.cancelBtnTapped()
                            dismiss() // 뷰를 닫는 기능 추가
                        },
                        label: {
                            Text("취소")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                .frame(width: 120, height: 120)
                                .background(Circle().fill(Color.lightGray))
                        }
                    )
                    
                    Spacer()
                    
                    Button(
                        action: {
                            timerViewModel.pauseOrRestartBtnTapped()
                        },
                        label: {
                            Text(timerViewModel.isPaused ? "계속 진행" : "일시정지")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                .frame(width: 120, height: 120)
                                .background(Circle().fill(Color.lightGray))
                        }
                    )
                }
                .padding(.horizontal, 42)
                .padding(.bottom, 52)
            }
            
        }
        
        
        
    }

}


#Preview {
    TimerView()
        .environmentObject(TimerViewModel())
}
