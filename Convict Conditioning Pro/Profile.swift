//
//  Profile.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/24.
//

import SwiftUI

struct Profile: View {
    var chartView: some View {
        VStack {
            RadarChart(data: [1,1,10,1,5,1]).padding(.vertical)
            List {
                ForEach(["a", "b", "c", "d", "e"],id: \.self) {
                    item in
                    Text(item)
                }
            }.listStyle(PlainListStyle())
        }
        
    }
    var body: some View {
        VStack {
            chartView
            
            
            
            ShareLink(item: Image(uiImage: generateSnapshot()), preview: SharePreview("Profile", image: Image(uiImage: generateSnapshot())))
            .buttonStyle(.borderedProminent)
        }
        
    }
    
    @MainActor
    private func generateSnapshot() -> UIImage {
        let renderer = ImageRenderer(content: chartView)
     
        return renderer.uiImage ?? UIImage()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
        Profile().preferredColorScheme(.dark)
    }
}
