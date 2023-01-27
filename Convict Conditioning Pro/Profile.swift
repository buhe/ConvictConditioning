//
//  Profile.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/24.
//

import SwiftUI

struct Profile: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var viewModel: ViewModel
    let tags = ["Pushup", "Squat", "Pullup", "Leg raise", "Bridge", "Handstand Pushup"]
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
