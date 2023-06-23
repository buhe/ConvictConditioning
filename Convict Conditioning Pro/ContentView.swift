//
//  ContentView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI
import CoreData
import LangChain

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
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
//        let e = OpenAIEmbeddings()
//        Task {
////            let r = await e.embedQuery(text: "1234567890abchi")
////            print("r: \(r.count)")
//            
//            let s = Supabase(embeddings: e)
//            await s.addTexts(texts: ["dog"])
//            let m = await s.similaritySearch(query: "cat", k: 1)
//        }
        
        let s1 = PromptTemplate(input_variables: ["1", "2"], template: SUFFIX).format(args: [ "dog" , "cat"] )
//        print(s1)
        let llm = OpenAI()
//        Task {
//            let reply = await llm.send(text: "hi", stops: ["\\nObservation: ", "\\n\\tObservation: "])
//            print(reply)
//            
//            let chain = LLMChain(llm: llm)
//            await chain.run(args: ["1", "2"])
//        }
//        let p = MRKLOutputParser()
//        let inputString = """
//Action: the action to take, should be one of [%@]
//Action Input: the input to the action
//"""
//        let a = p.parse(text: inputString)
//        print(a)
        
        
//        // scenario 2 - Chain
//        let template = """
//        You are a playwright. Given the title of play, it is your job to write a synopsis for that title.
//        Title: %@
//        Playwright: This is a synopsis for the above play:
//"""
//        let prompt_template = PromptTemplate(input_variables: ["title"], template: template)
//        let str = prompt_template.format(args: ["123"])
////        print(str)
//        let synopsis_chain = LLMChain(llm: llm, prompt: prompt_template, parser: Nothing())
////
//        let test_prompts = [
//            [
//                "title": "documentary about good video games that push the boundary of game design"
//            ],
//            ["title": "the phenomenon behind the remarkable speed of cheetahs"],
//            ["title": "the best in class mlops tooling"],
//        ]
//        Task {
//            let response = await synopsis_chain.apply(input_list: test_prompts)
//            print(response)
//            print(response.count)
//        }
        
        let agent = initialize_agent(llm: llm, tools: [WeatherTool()])
        Task {
            let answer = await agent.run(args: "Query the weather of this week")
            print(answer)
        }
    }
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
