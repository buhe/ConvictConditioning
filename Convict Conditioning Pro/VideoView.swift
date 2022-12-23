//
//  VideoView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI

struct VideoView: View {
    let step: Step
    var body: some View {
        Text(step.videoName)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(step: Model().steps["Pushup"]!.first!)
    }
}
