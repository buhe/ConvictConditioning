//
//  ViewModel.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var model = Model()
    var tops = [
        TopItem(title: "Pushup", image: "a"),
        TopItem(title: "Squat", image: "b"),
        TopItem(title: "Pullup", image: "c"),
        TopItem(title: "Leg raise", image: "d"),
        TopItem(title: "Bridge", image: "e"),
        TopItem(title: "Handstand Pushup", image: "f")
    ]
}

struct TopItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let step: Int = 0
}
