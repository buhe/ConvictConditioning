//
//  ContentView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Item>
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    @State var showProfile = false
    @State var showSetting = false

    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.step ?? "---") ")
//                    } label: {
//                        Text("Item at \(item.step ?? "---") ")
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//#if os(iOS)
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//#endif
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
        NavigationStack {
            List {
                ForEach(viewModel.tops) { item in
                    NavigationLink {
                        StepView(steps: viewModel.model.steps[item.title]!, title: item.title).environment(\.managedObjectContext, viewContext)
                    } label: {
                        HStack {
                            Image(item.image)
                            Text(item.title).fontWeight(.bold)
                                .font(.title2)
                            Spacer()
                            Text("\(item.step)/10").fontWeight(.bold)
                                .font(.title2)
                        }.padding()
                        
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        showProfile.toggle()
                    } label: {
                        Label("Profile", systemImage: "person.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showSetting.toggle()
                    } label: {
                        Label("Setting", systemImage: "gear")
                    }
                }
            }
            .sheet(isPresented: $showProfile) {
                Profile(viewModel: viewModel)
            }
            .sheet(isPresented: $showSetting) {
                SettingsView()
            }
            .onAppear {
                viewModel.top(itemMaps: Dictionary(grouping: items, by: { $0.type }))
            }
            
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        ContentView(viewModel: ViewModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).preferredColorScheme(.dark)
    }
}
