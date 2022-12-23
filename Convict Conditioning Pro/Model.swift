//
//  Model.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import Foundation

struct Model {
    static let VIDEO_PREFIX = "https://pf-video.s3.us-west-2.amazonaws.com/"
    var steps: [String: [Step]] = [
        "pushUp": [
            Step(name: "STEP1 WALL PUSHUPS", desc: """
                        The goal is 3×50
                        Then next step!
                        """, step: 1, videoName: "a01.mp4", info: "a1.jpg"),
            Step(name: "STEP2 INCLINE PUSHUPS", desc: """
                        The goal is 3×40
                        Then next step!
                        """, step: 2, videoName: "a02.mp4", info: "a2.jpg"),
            Step(name: "STEP3 KNEELING PUSHUPS", desc: """
                        The goal is 3×30
                        Then next step!
                        """, step: 3, videoName: "a03.mp4", info: "a3.jpg"),
            Step(name: "STEP4 HALF PUSHUPS", desc: """
                        The goal is 2×25
                        Then next step!
                        """, step: 4, videoName: "a04.mp4", info: "a4.jpg"),
            Step(name: "STEP5 FULL PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 5, videoName: "a05.mp4", info: "a5.jpg"),
            Step(name: "STEP6 CLOSE PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 6, videoName: "a06.mp4", info: "a6.jpg"),
            Step(name: "STEP7 UNEVEN PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 7, videoName: "a07.mp4", info: "a7.jpg"),
            Step(name: "STEP8 1/2 ONE-ARM PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 8, videoName: "a08.mp4", info: "a8.jpg"),
            Step(name: "STEP9 LEVER PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 9, videoName: "a09.mp4", info: "a9.jpg"),
            Step(name: "STEP10 ONE-ARM PUSHUPS", desc: """
                        The final goal is 1×100
                        """, step: 10, videoName: "a10.mp4", info: "a10.jpg")
        ]
    ]
}

struct Step: Identifiable {
    let id = UUID()
    let name: String
    let desc: String
    let step: Int
    let videoName: String
    let info: String
}
