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
    @State var player: AVPlayer?
    var body: some View {
        VStack {
            VideoPlayer(player: player) {
                VStack {
                    Text("")
                        .foregroundColor(.black)
                        .background(.white.opacity(0.7))
                    Spacer()
                }
                .frame(width: 400, height: 300)
            }.aspectRatio(4 / 3, contentMode: .fit)
//            Spacer()
            Text(step.name).font(.title).fontWeight(.bold).padding()
            Text(step.desc).font(.title2).fontWeight(.bold).padding()
            Divider().frame(height: 2).overlay(.gray).padding()
            Button {} label: {
                Text("DONE").fontWeight(.bold).frame(width: 300).padding(5)
            }.buttonStyle(.borderedProminent).padding()
            Spacer()
    //
        
        
        }.ignoresSafeArea().onAppear {
            CacheManager.shared.getFileWith(stringUrl: Model.VIDEO_PREFIX + step.videoName) { result in
                            switch result {
                            case .success(let url):
                                self.player = AVPlayer(url: url)
//                                self.player?.play()
                                break
                            case .failure:
                                //TODO - show alert
//                                self.showError.toggle()
                                break
                            }
                        }
        }

    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(step: Model().steps["Pushup"]!.first!).preferredColorScheme(.light)
        
        VideoView(step: Model().steps["Pushup"]!.first!).preferredColorScheme(.dark)
    }
}
