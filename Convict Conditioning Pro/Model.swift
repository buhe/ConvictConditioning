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
        "Pushup": [
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
        ],
        "Squat": [
            Step(name: "STEP1 SHOULDERSTAND SQUATS", desc: """
                        The goal is 3×50
                        Then next step!
                        """, step: 1, videoName: "b01.mp4", info: "b1.jpg"),
            Step(name: "STEP2 JACKKNIFE SQUATS", desc: """
                        The goal is 3×40
                        Then next step!
                        """, step: 2, videoName: "b02.mp4", info: "b2.jpg"),
            Step(name: "STEP3 SUPPORTED SQUATS", desc: """
                        The goal is 3×30
                        Then next step!
                        """, step: 3, videoName: "b03.mp4", info: "b3.jpg"),
            Step(name: "STEP4 HALF SQUATS", desc: """
                        The goal is 2×50
                        Then next step!
                        """, step: 4, videoName: "b04.mp4", info: "b4.jpg"),
            Step(name: "STEP5 FULL SQUATS", desc: """
                        The goal is 2×30
                        Then next step!
                        """, step: 5, videoName: "b05.mp4", info: "b5.jpg"),
            Step(name: "STEP6 CLOSE SQUATS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 6, videoName: "b06.mp4", info: "b6.jpg"),
            Step(name: "STEP7 UNEVEN SQUATS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 7, videoName: "b07.mp4", info: "b7.jpg"),
            Step(name: "STEP8 1/2 ONE-LEG SQUATS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 8, videoName: "b08.mp4", info: "b8.jpg"),
            Step(name: "STEP9 ASSISTED ONE-LEG SQUATS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 9, videoName: "b09.mp4", info: "b9.jpg"),
            Step(name: "STEP10 ONE-LEG SQUATS", desc: """
                        The final goal is 2×50
                        """, step: 10, videoName: "b10.mp4", info: "b10.jpg")
        ],
        "Pullup": [
            Step(name: "STEP1 VERTICAL PULLS", desc: """
                        The goal is 3×40
                        Then next step!
                        """, step: 1, videoName: "c01.mp4", info: "c1.jpg"),
            Step(name: "STEP2 HORIZONTAL PULLS", desc: """
                        The goal is 3×30
                        Then next step!
                        """, step: 2, videoName: "c02.mp4", info: "c2.jpg"),
            Step(name: "STEP3 JACKKNIFE PULLUPS", desc: """
                        The goal is 3×20
                        Then next step!
                        """, step: 3, videoName: "c03.mp4", info: "c3.jpg"),
            Step(name: "STEP4 HALF PULLUPS", desc: """
                        The goal is 2×15
                        Then next step!
                        """, step: 4, videoName: "c04.mp4", info: "c4.jpg"),
            Step(name: "STEP5 FULL PULLUPS", desc: """
                        The goal is 2×10
                        Then next step!
                        """, step: 5, videoName: "c05.mp4", info: "c5.jpg"),
            Step(name: "STEP6 CLOSE PULLUPS", desc: """
                        The goal is 2×10
                        Then next step!
                        """, step: 6, videoName: "c06.mp4", info: "c6.jpg"),
            Step(name: "STEP7 UNEVEN PULLUPS", desc: """
                        The goal is 2×9
                        Then next step!
                        """, step: 7, videoName: "c07.mp4", info: "c7.jpg"),
            Step(name: "STEP8 1/2 ONE-ARM PULLUPS", desc: """
                        The goal is 2×8
                        Then next step!
                        """, step: 8, videoName: "c08.mp4", info: "c8.jpg"),
            Step(name: "STEP9 ASSISTED ONE-ARM PULLUPS", desc: """
                        The goal is 2×7
                        Then next step!
                        """, step: 9, videoName: "c09.mp4", info: "c9.jpg"),
            Step(name: "STEP10 ONE-ARM PULLUPS", desc: """
                        The final goal is 2×7
                        """, step: 10, videoName: "c10.mp4", info: "c10.jpg")
        ],
        "Leg raise": [
            Step(name: "STEP1 KNEE TUCKS", desc: """
                        The goal is 3×40
                        Then next step!
                        """, step: 1, videoName: "d01.mp4", info: "d1.jpg"),
            Step(name: "STEP2 FLAT KNEE RAISES", desc: """
                        The goal is 3×35
                        Then next step!
                        """, step: 2, videoName: "d02.mp4", info: "d2.jpg"),
            Step(name: "STEP3 FLAT BENT LEG RAISES", desc: """
                        The goal is 3×30
                        Then next step!
                        """, step: 3, videoName: "d03.mp4", info: "d3.jpg"),
            Step(name: "STEP4 FLAT FROG RAISES", desc: """
                        The goal is 2×25
                        Then next step!
                        """, step: 4, videoName: "d04.mp4", info: "d4.jpg"),
            Step(name: "STEP5 FLAT STRAIGHT LEG RAISES", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 5, videoName: "d05.mp4", info: "d5.jpg"),
            Step(name: "STEP6 HANGING KNEE RAISES", desc: """
                        The goal is 2×15
                        Then next step!
                        """, step: 6, videoName: "d06.mp4", info: "d6.jpg"),
            Step(name: "STEP7 HANGING BENT LEG RAISES", desc: """
                        The goal is 2×15
                        Then next step!
                        """, step: 7, videoName: "d07.mp4", info: "d7.jpg"),
            Step(name: "STEP8 HANGING FROG RAISES", desc: """
                        The goal is 2×15
                        Then next step!
                        """, step: 8, videoName: "d08.mp4", info: "d8.jpg"),
            Step(name: "STEP9 PARTIAL STRAIGHT RAISES", desc: """
                        The goal is 2×15
                        Then next step!
                        """, step: 9, videoName: "d09.mp4", info: "d9.jpg"),
            Step(name: "STEP10 HANGING STRAIGHT LEG RAISES", desc: """
                        The final goal is 2×30
                        """, step: 10, videoName: "d10.mp4", info: "d10.jpg")
        ],
        "Bridge": [
            Step(name: "STEP1 SHORT BRIDGES", desc: """
                        The goal is 3×50
                        Then next step!
                        """, step: 1, videoName: "e01.mp4", info: "e1.jpg"),
            Step(name: "STEP2 STRAIGHT BRIDGES", desc: """
                        The goal is 3×40
                        Then next step!
                        """, step: 2, videoName: "e02.mp4", info: "e2.jpg"),
            Step(name: "STEP3 ANGLED BRIDGES", desc: """
                        The goal is 3×30
                        Then next step!
                        """, step: 3, videoName: "e03.mp4", info: "e3.jpg"),
            Step(name: "STEP4 HEAD BRIDGES", desc: """
                        The goal is 2×25
                        Then next step!
                        """, step: 4, videoName: "e04.mp4", info: "e4.jpg"),
            Step(name: "STEP5 HALF BRIDGES", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 5, videoName: "e05.mp4", info: "e5.jpg"),
            Step(name: "STEP6 FULL BRIDGES", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 6, videoName: "e06.mp4", info: "e6.jpg"),
            Step(name: "STEP7 WALL WALKING BRIDGES (DOWN)", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 7, videoName: "e07.mp4", info: "e7.jpg"),
            Step(name: "STEP8 WALL WALKING BRIDGES (UP)", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 8, videoName: "e08.mp4", info: "e8.jpg"),
            Step(name: "STEP9 CLOSING BRIDGES", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 9, videoName: "e09.mp4", info: "e9.jpg"),
            Step(name: "STEP10 STAND-TO-STAND BRIDGES", desc: """
                        The final goal is 1×100
                        """, step: 10, videoName: "e10.mp4", info: "e10.jpg")
        ],
        "Handstand Pushup": [
            Step(name: "STEP1 WALL HEADSTANDS", desc: """
                        The goal is 3×50
                        Then next step!
                        """, step: 1, videoName: "f01.mp4", info: "f1.jpg"),
            Step(name: "STEP2 CROW STANDS", desc: """
                        The goal is 3×40
                        Then next step!
                        """, step: 2, videoName: "f02.mp4", info: "f2.jpg"),
            Step(name: "STEP3 WALL HANDSTANDS", desc: """
                        The goal is 3×30
                        Then next step!
                        """, step: 3, videoName: "f03.mp4", info: "f3.jpg"),
            Step(name: "STEP4 1/2 HANDSTAND PUSHUPS", desc: """
                        The goal is 2×25
                        Then next step!
                        """, step: 4, videoName: "f04.mp4", info: "f4.jpg"),
            Step(name: "STEP5 HANDSTAND PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 5, videoName: "f05.mp4", info: "f5.jpg"),
            Step(name: "STEP6 CLOSE HANDSTAND PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 6, videoName: "f06.mp4", info: "f6.jpg"),
            Step(name: "STEP7 UNEVEN HANDSTAND PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 7, videoName: "f07.mp4", info: "f7.jpg"),
            Step(name: "STEP8 HALF ONE-ARM HANDSTAND PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 8, videoName: "f08.mp4", info: "f8.jpg"),
            Step(name: "STEP9 LEVER HANDSTAND PUSHUPS", desc: """
                        The goal is 2×20
                        Then next step!
                        """, step: 9, videoName: "f09.mp4", info: "f9.jpg"),
            Step(name: "STEP10 ONE-ARM HANDSTAND PUSHUPS", desc: """
                        The final goal is 1×100
                        """, step: 10, videoName: "f10.mp4", info: "f10.jpg")
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
