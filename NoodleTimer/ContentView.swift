//
//  ContentView.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var products = [
        Product(imageName: "신라면", title: "신라면", timerText: "테스트 8초", duration: Time(minutes: 0, seconds: 8)),
        Product(imageName: "불닭볶음면", title: "불닭볶음면", timerText: "5분", duration: Time(minutes: 4, seconds: 59)),
        Product(imageName: "안성탕면", title: "안성탕면", timerText: "4분 30초", duration: Time(minutes: 4, seconds: 29)),
        Product(imageName: "진라면", title: "진라면(순한맛)", timerText: "4분", duration: Time(minutes: 3, seconds: 59))
    ]
    
    let columns: [GridItem] = [
        GridItem(.fixed(173)),
        GridItem(.fixed(173)),
    ]
    var body: some View {
        NavigationView {
            ZStack{
                Color("bgColor")
                    .ignoresSafeArea()
                Spacer()
                VStack(alignment: .leading) {
                    HStack() {
                        Image("logo")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        Image("raIcon")
                    }
                    .padding(.bottom, 12)
                    
                    VStack(spacing: 8) {  // 8pt 간격을 설정
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.accentColor)  // 첫 번째 줄
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.accentColor)  // 두 번째 줄
                    }
                    .padding(.bottom, 16)
                    
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(products) { product in
                            ProductView(product: product)
                        }
                    }
                    
                }
                .padding()
            }
        }
        
    }
}


#Preview {
    ContentView()
}
