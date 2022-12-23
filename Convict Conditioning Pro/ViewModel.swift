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
        TopItem(title: "PUSH UP", image: "a.png"),
        TopItem(title: "SQUAT", image: "b.png"),
        TopItem(title: "PULL UP", image: "c.png"),
        TopItem(title: "LEG RAISE", image: "d.png"),
        TopItem(title: "BRIDGE", image: "e.png"),
        TopItem(title: "HANDSTAND", image: "f.png")
    ]
}

struct TopItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let step: Int = 0
}
