//
//  Profile.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/24.
//

import SwiftUI

struct Profile: View {
    var viewModel: ViewModel
    var chartView: some View {
        VStack {
            RadarChart(data: viewModel.tops.map { Double($0.step)}).padding(.vertical)
            List {
                ForEach(viewModel.tops) {
                    item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Text(String(item.step) + "/10")
                    }
                    
                }
            }.listStyle(PlainListStyle())
        }
        
    }
    var body: some View {
        VStack {
            chartView.padding(.vertical)
//            ShareLink(item: Image(uiImage: generateSnapshot()), preview: SharePreview("Profile", image: Image(uiImage: generateSnapshot())))
//            // FIXME - share image is not corret
//                .buttonStyle(.borderedProminent).padding()
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
        Profile(viewModel: ViewModel())
        Profile(viewModel: ViewModel()).preferredColorScheme(.dark)
    }
}
