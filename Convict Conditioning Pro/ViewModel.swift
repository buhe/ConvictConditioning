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
        TopItem(title: "Pushup", image: "a.png"),
        TopItem(title: "Squat", image: "b.png"),
        TopItem(title: "Pullup", image: "c.png"),
        TopItem(title: "Leg raise", image: "d.png"),
        TopItem(title: "Bridge", image: "e.png"),
        TopItem(title: "Handstand Pushup", image: "f.png")
    ]
}

struct TopItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let step: Int = 0
}
