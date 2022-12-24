//
//  AutoRotate.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/24.
//

import SwiftUI

import SwiftUI
import AVKit

struct AutoRotate: View {
    @State private var showFullScreen = false
    let url: URL
    private let player: AVPlayer
    
    init(url: URL) {
        self.url = url
        self.player = AVPlayer(url: url)
    }
    
    var body: some View {
        playerView
            .ignoresSafeArea()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                DispatchQueue.main.async {
                    if UIDevice.current.orientation.isLandscape {
                        self.showFullScreen = true
                    } else {
                        self.showFullScreen = false
                    }
                }
            }
    }
    
    private var playerView: some View {
        showFullScreen ? AVPlayerControllerRepresentable(showFullScreen: true, player: player) : AVPlayerControllerRepresentable(showFullScreen: false, player: player)
    }
}

struct AutoRotate_Previews: PreviewProvider {
    static var previews: some View {
        AutoRotate(url: URL(fileURLWithPath: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4"))
    }
}


struct AVPlayerControllerRepresentable: UIViewControllerRepresentable {
    let showFullScreen: Bool
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller  = AVPlayerViewControllerRotatable()
        controller.player = player
        chooseScreenType(controller)
        return controller
    }
    
    func updateUIViewController(_ controller: AVPlayerViewController, context content: Context) {
        chooseScreenType(controller)
    }
    
    private func chooseScreenType(_ controller: AVPlayerViewController) {
        showFullScreen ? controller.enterFullScreen(animated: true) : controller.exitFullScreen(animated: true)
        
    }
    
    
}

class AVPlayerViewControllerRotatable: AVPlayerViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
}

extension AVPlayerViewController {
    func enterFullScreen(animated: Bool) {
        perform(NSSelectorFromString("enterFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
    
    func exitFullScreen(animated: Bool) {
        perform(NSSelectorFromString("exitFullScreenAnimated:completionHandler:"), with: animated, with: nil)
    }
}
