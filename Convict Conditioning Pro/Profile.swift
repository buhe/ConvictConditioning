//
//  Profile.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/24.
//

import SwiftUI

// 扩展UIImage使其遵循Identifiable协议
extension UIImage: Identifiable {
    public var id: String {
        return "\(self.hash)"
    }
}

struct Profile: View {
    @Environment(\.colorScheme) private var colorScheme
    @AppStorage(wrappedValue: "", "steps") var steps
    var viewModel: ViewModel
    let tags = ["Pushup", "Squat", "Pullup", "Leg raise", "Bridge", "Handstand Pushup"]
    @State private var shareImage: UIImage?
    @State private var isGeneratingImage = false
    @State private var showShareSheet = false
    var chartView: some View {
        VStack {
            ZStack{
//                VStack{
//                    Text(tags[0])
//                    Spacer()
//                    Text(tags[3])
//                }
                GeometryReader{
                    rect in
                    
                    Grid {
                        GridRow {
                            Text("")
                                
                                .frame(minHeight: rect.size.height / 4)
                            
                            ZStack(alignment: .top){
                                
                                Rectangle()
                                    .fill(colorScheme == .light ? Color.white : .systemBackground)
                                    .frame(minHeight: rect.size.height / 4)
                                Text(tags[0])
                                    .font(.caption)
                            }
                            Text("")
                                
                                .frame(minHeight: rect.size.height / 4)
                        }
                        
                        GridRow {
                            ZStack(alignment: .topLeading){
                                
                                Rectangle()
                                    .fill(colorScheme == .light ? Color.white : .systemBackground)
                                    .frame(minHeight: rect.size.height / 4)
                                Text(tags[5])
                                    .padding(.horizontal)
                                    .font(.caption)
                            }
                            
                            Text("")
                                
                                .frame(minHeight: rect.size.height / 4)
                            ZStack(alignment: .topTrailing){
                                
                                Rectangle()
                                    .fill(colorScheme == .light ? Color.white : .systemBackground)
                                    .frame(minHeight: rect.size.height / 4)
                                Text(tags[1])
                                    .padding(.horizontal)
                                    .font(.caption)
                            }
                            
                        }
                        
                        GridRow {
                            ZStack(alignment: .leading){
                                
                                Rectangle()
                                    .fill(colorScheme == .light ? Color.white : .systemBackground)
                                    .frame(minHeight: rect.size.height / 4)
                                Text(tags[4])
                                    .padding(.horizontal)
                                    .font(.caption)
                            }
                            
                            Text("")
                                
                                .frame(minHeight: rect.size.height / 4)
                            
                            ZStack(alignment: .trailing){
                                
                                Rectangle()
                                    .fill(colorScheme == .light ? Color.white : .systemBackground)
                                    .frame(minHeight: rect.size.height / 4)
                                Text(tags[2])
                                    .padding(.horizontal)
                                    .font(.caption)
                            }
                            
                        }
                        
                        GridRow {
                            Text("")
                                
                                .frame(minHeight: rect.size.height / 4)
                            
                            ZStack(alignment: .center){
                                
                                Rectangle()
                                    .fill(colorScheme == .light ? Color.white : .systemBackground)
                                    .frame(minHeight: rect.size.height / 4)
                                Text(tags[3])
                                    .font(.caption)
                            }
                            
                            Text("")
                                
                                .frame(minHeight: rect.size.height / 4)
                            
                        }
                    }
                    
                }
                
                RadarChart(data: viewModel.tops.map { Double($0.step)}).padding(.vertical)
            }
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
        NavigationView {
            VStack {
                chartView.padding(.vertical)
            }
//            .navigationTitle("个人资料")
//            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        shareRadarImage()
                    }) {
                        if isGeneratingImage {
                            ProgressView()
                                .scaleEffect(0.8)
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        } else {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.blue)
                        }
                    }
                    .disabled(isGeneratingImage)
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            if let image = shareImage {
                ShareSheet(activityItems: [image])
            }
        }
        .onChange(of: shareImage) { newImage in
            if newImage != nil {
                showShareSheet = true
            }
        }
    }
    
    private func shareRadarImage() {
        isGeneratingImage = true
        
        let data = viewModel.tops.map { Double($0.step) }
        let labels = viewModel.tops.map { $0.title }
        
        // 在后台线程生成图片，避免阻塞UI
        DispatchQueue.global(qos: .userInitiated).async {
            let image = RadarImageGenerator.generateRadarImage(data: data, labels: labels)
            
            // 回到主线程更新UI
            DispatchQueue.main.async {
                self.shareImage = image
                self.isGeneratingImage = false
            }
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
