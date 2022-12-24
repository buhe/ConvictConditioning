//
//  VideoView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI
import AVKit
import SwiftUIX

struct VideoView: View {
    let step: Step
    @State var player: AutoRotate?
    @State var foundStep = false
    @State var showInfo = false
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @ViewBuilder
    var button: some View {
        if foundStep {
            Button {
            } label: {
                Text("DONE").fontWeight(.bold).frame(width: 300).padding(5)
            }.buttonStyle(.borderedProminent).padding(.large).disabled(true)
        } else {
            Button {
                let newItem = Item(context: viewContext)
                newItem.type = Int16(step.type)
                newItem.step = Int16(step.step)
                newItem.timestamp = Date()

                do {
                    try viewContext.save()
                    foundStep = true
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            } label: {
                Text("DONE").fontWeight(.bold).frame(width: 300).padding(5)
            }.buttonStyle(.borderedProminent).padding(.large)
        }
        
    }
    var body: some View {
        VStack {
            ZStack {
                VStack{
                    Spacer()
                    ActivityIndicator()
                    Spacer()
                }
                player.aspectRatio(4 / 3, contentMode: .fit)
            }.toolbar {
                Button {
                    showInfo = true
                } label: {
                    Label("info", systemImage: "info.circle")
                }
            }
//            Spacer()
            Text(step.name).font(.title).fontWeight(.bold).padding(.large)
            Text(step.desc).font(.title2).fontWeight(.bold).padding(.large)
            Divider().frame(height: 2).overlay(.gray).padding(.large)
//            Spacer()
//            Spacer(minLength: 144)
            button
            Spacer()
        }.onAppear {
            for item in items {
                if item.type == step.type && item.step == step.step {
                    foundStep = true
                }
            }
            
            CacheManager.shared.getFileWith(stringUrl: Model.VIDEO_PREFIX + step.videoName) { result in
                            switch result {
                            case .success(let url):
                                self.player = AutoRotate(url: url)
//                                self.player?.play()
                                break
                            case .failure:
                                //TODO - show alert
//                                self.showError.toggle()
                                break
                            }
                        }
        }
//        .ignoresSafeArea()
        .sheet(isPresented: $showInfo) {
            Image(step.info)
        }

    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(step: Model().steps["Pushup"]!.first!).preferredColorScheme(.light)
        
        VideoView(step: Model().steps["Pushup"]!.first!).preferredColorScheme(.dark)
    }
}
