//
//  ViewModel.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var model = CCModel()
    @Published var tops = [
        TopItem(title: "Pushup", image: "a", type: 1),
        TopItem(title: "Squat", image: "b", type: 2),
        TopItem(title: "Pullup", image: "c", type: 3),
        TopItem(title: "Leg raise", image: "d", type: 4),
        TopItem(title: "Bridge", image: "e", type: 5),
        TopItem(title: "Handstand Pushup", image: "f", type: 6)
    ]
    
    func top(itemMaps: [Int16 : [Item]]) {
        for (k,v) in itemMaps {
            for item in tops {
                if item.type == k {
                    tops.remove(at: item.type - 1)
                    let newItem = TopItem(title: item.title, image: item.image, step: v.count, type: item.type)
                    tops.insert(newItem, at: item.type - 1)
                }
            }
        }
    }
}

struct TopItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    var step: Int = 0
    let type: Int
}
