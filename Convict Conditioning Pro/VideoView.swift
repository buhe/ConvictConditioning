//
//  VideoView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI
import AVKit

struct VideoView: View {
    let step: Step
    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url:  URL(string: Model.VIDEO_PREFIX + step.videoName)!)) {
                VStack {
                    Text("Watermark")
                        .foregroundColor(.black)
                        .background(.white.opacity(0.7))
                    Spacer()
                }
                .frame(width: 400, height: 300)
            }
//            Spacer()
            Text(step.name).font(.title).fontWeight(.bold).padding()
            Text(step.desc).font(.title2).fontWeight(.bold).padding()
            Divider().frame(height: 2).overlay(.gray).padding()
            Button {} label: {
                Text("DONE").fontWeight(.bold).frame(width: 300).padding(5)
            }.buttonStyle(.borderedProminent).padding()
//            Spacer()
    //
        
        
        }.ignoresSafeArea()

    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(step: Model().steps["Pushup"]!.first!).preferredColorScheme(.light)
        
        VideoView(step: Model().steps["Pushup"]!.first!).preferredColorScheme(.dark)
    }
}
