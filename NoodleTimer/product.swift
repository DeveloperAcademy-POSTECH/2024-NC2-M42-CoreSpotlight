//
//  product.swift
//  NoodleTimer
//
//  Created by lim juyiung on 6/17/24.
//

import Foundation

struct Product: Identifiable {
    let imageName: String
    let title: String
    let timerText: String
    let duration: Int
    
    var id: String {
        imageName
    }
}
