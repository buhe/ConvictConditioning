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
        
//        let s1 = PromptTemplate(input_variables: ["1", "2"], template: SUFFIX).format(args: [ "dog" , "cat"] )
//        print(s1)
//        let llm = OpenAI()
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
        
//        let agent = initialize_agent(llm: llm, tools: [WeatherTool()])
//        Task {
//            let answer = await agent.run(args: "Query the weather of this week")
//            print(answer)
//        }
//        let name = "state_of_the_union.txt"
//        let loader = TextLoader(file_path: name)
//        let c = loader.load()
//        print(c)
        
//        let loader = TextLoader(file_path: "state_of_the_union.txt")
//        let documents = loader.load()
//        let text_splitter = CharacterTextSplitter(chunk_size: 1000, chunk_overlap: 0)
// 
//        let embeddings = OpenAIEmbeddings()
//        let s = Supabase(embeddings: embeddings)
//        Task {
//            for text in documents {
//                let docs = text_splitter.split_text(text: text.page_content)
//                for doc in docs {
//                    await s.addText(text: doc)
//                }
//            }
//            
//            let m = await s.similaritySearch(query: "What did the president say about Ketanji Brown Jackson", k: 1)
//            print("Q:What did the president say about Ketanji Brown Jackson")
//            print("A:\(m)")
//        }
        
        
        let template = """
        Assistant is a large language model trained by OpenAI.

        Assistant is designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, Assistant is able to generate human-like text based on the input it receives, allowing it to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand.

        Assistant is constantly learning and improving, and its capabilities are constantly evolving. It is able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. Additionally, Assistant is able to generate its own text based on the input it receives, allowing it to engage in discussions and provide explanations and descriptions on a wide range of topics.

        Overall, Assistant is a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether you need help with a specific question or just want to have a conversation about a particular topic, Assistant is here to assist.

        %@
        Human: %@
        Assistant:
"""

        let prompt = PromptTemplate(input_variables: ["history", "human_input"], template: template)


        let chatgpt_chain = LLMChain(
            llm: OpenAI(),
            prompt: prompt,
            parser: Nothing(),
            memory: ConversationBufferWindowMemory()
        )
        Task {
            var input = ["human_input": "I want you to act as a Linux terminal. I will type commands and you will reply with what the terminal should show. I want you to only reply with the terminal output inside one unique code block, and nothing else. Do not write explanations. Do not type commands unless I instruct you to do so. When I need to tell you something in English I will do so by putting text inside curly brackets {like this}. My first command is pwd."
            ]
            var output = await chatgpt_chain.predict(args: input)
            print(input["human_input"]!)
            print(output["Answer"]!)
            input = ["human_input": "ls ~"]
            output = await chatgpt_chain.predict(args: input)
            print(input["human_input"]!)
            print(output["Answer"]!)
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
