//
//  ProductView.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/16/24.
//

import SwiftUI
import Foundation

struct Product: Identifiable {
    let id: UUID = UUID()
    let imageName: String
    let title: String
    let timerText: String
    let duration: Time
}

struct ProductView: View {
    let product: Product
    @StateObject var timerViewModel = TimerViewModel()
    @State private var navigateToTimerView = false
    
    init(product: Product) {
        self.product = product
        _timerViewModel = StateObject(wrappedValue: TimerViewModel(time: product.duration))
    }
    
    var body: some View {
        ZStack {
            NavigationLink(destination: TimerView().environmentObject(timerViewModel), isActive: $navigateToTimerView) {
                EmptyView()
            }.hidden()
            
            Button(action: {
                timerViewModel.timerRemaining = product.duration.convertedSeconds
                timerViewModel.startTimer()
                navigateToTimerView = true
            }) {
                HStack(spacing: 16) {
                    ZStack {
                        Image(product.imageName)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack{
                            Spacer()
                            LinearGradient.bottomFade
                                .frame(height: 96)
                        }
                        
                        VStack(alignment: .leading) {
                            Spacer()
                            
                            HStack{
                                Image(systemName: "clock")
                                    .font(.title3)
                                Text(product.timerText)
                            }
                            .padding(8)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .background(.ultraThinMaterial)
                            .clipShape(.capsule)
                            
                            HStack {
                                Spacer()
                            }
                        }
                        .padding([.leading, .bottom], 8)
                    }
                    .frame(width: 173, height: 290)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
            }
            .padding(.vertical, 4)

        }
    }
}

extension LinearGradient {
    static var bottomFade: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color.black.opacity(0), Color.black]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}


#Preview {
    ContentView()
}
