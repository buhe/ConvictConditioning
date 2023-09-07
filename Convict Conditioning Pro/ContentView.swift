//
//  ContentView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI
import CoreData
import LangChain
import Foundation
import NIOPosix
import AsyncHTTPClient
import OpenAIKit

struct Unit: Codable {
    let num: Int
}
struct Book: Codable {
    let title: String
    let content: String
    let unit: Unit
}

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
        
        
        // scenario 2 - Chain
//        let template = """
//        You are a playwright. Given the title of play, it is your job to write a synopsis for that title.
//        Title: %@
//        Playwright: This is a synopsis for the above play:
//"""
//        let prompt_template = PromptTemplate(input_variables: ["title"], template: template)
////        let str = prompt_template.format(args: ["123"])
////        print(str)
//        let synopsis_chain = LLMChain(llm: llm, prompt: prompt_template, callbacks: [StdOutCallbackHandler()])
////
//        let test_prompts = ["documentary about good video games that push the boundary of game design"]
//        Task {
//            let _ = await synopsis_chain.apply(input_list: test_prompts)
////            print(response)
////            print(response.count)
//        }
//        
        let agent = initialize_agent(llm: llm, tools: [WeatherTool(callbacks: [StdOutCallbackHandler()])])
        Task {
            let answer = await agent.run(args: "Query the weather of this week")
            print(answer.llm_output!)
        }
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
        
//        
//        let template = """
//        Assistant is a large language model trained by OpenAI.
//
//        Assistant is designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, Assistant is able to generate human-like text based on the input it receives, allowing it to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand.
//
//        Assistant is constantly learning and improving, and its capabilities are constantly evolving. It is able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. Additionally, Assistant is able to generate its own text based on the input it receives, allowing it to engage in discussions and provide explanations and descriptions on a wide range of topics.
//
//        Overall, Assistant is a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether you need help with a specific question or just want to have a conversation about a particular topic, Assistant is here to assist.
//
//        %@
//        Human: %@
//        Assistant:
//"""
//
//        let prompt = PromptTemplate(input_variables: ["history", "human_input"], template: template)
//
//
//        let chatgpt_chain = LLMChain(
//            llm: OpenAI(),
//            prompt: prompt,
//            memory: ConversationBufferWindowMemory()
//        )
//        Task {
//            var input = ["human_input": "I want you to act as a Linux terminal. I will type commands and you will reply with what the terminal should show. I want you to only reply with the terminal output inside one unique code block, and nothing else. Do not write explanations. Do not type commands unless I instruct you to do so. When I need to tell you something in English I will do so by putting text inside curly brackets {like this}. My first command is pwd."
//            ]
//            var output = await chatgpt_chain.predict(args: input)
//            print(input["human_input"]!)
//            print(output["Answer"]!)
//            input = ["human_input": "ls ~"]
//            output = await chatgpt_chain.predict(args: input)
//            print(input["human_input"]!)
//            print(output["Answer"]!)
//        }
//        let google = Serper()
//        Task {
//            let google = try! await google._run(args:"apple")
//            print("google: \(google)")
//        }
//        let agent = initialize_agent(llm: OpenAI(), tools: [Serper(gl: "cn", hl: "zh")])
//        Task {
//            let answer = await agent.run(args: "沈阳二手房买卖，房产证几天出")
//            print(answer)
//        }
//        let video_id = "JdM6AruIKT4"
//        let loader = YoutubeLoader(video_id: video_id, language: "zh")
//        Task {
//            let doc = await loader.load()
//            let text_splitter = CharacterTextSplitter(chunk_size: 3000, chunk_overlap: 0)
//        
//            let texts = text_splitter.split_text(text: doc.first!.page_content)
//            let _1 = texts.first!
//            let prompt = PromptTemplate(input_variables: ["youtube"], template: """
//以下是 youtube 一个视频的字幕 : %@ , 请总结主要内容, 要求在100个字以内.
//""")
//            let request = prompt.format(args: [_1])
//        let llm = OpenAI(model: Model.GPT4.gpt4)
//        Task {
//            let r = await llm.send(text: "hi")
//            print("result: \(r)")
//        }
//            let reply = await llm.send(text: request)
//            print(reply)
//        }
//        let html = "<html><head><title></title></head>"
//               + "<body><p>你好</p></body></html>"
//        let loader = HtmlLoader(html: html, url: "")
//        Task {
//            let doc = await loader.load()
//            let text_splitter = CharacterTextSplitter(chunk_size: 3000, chunk_overlap: 0)
//        
//            let texts = text_splitter.split_text(text: doc.first!.page_content)
//            let _1 = texts.first!
//            let prompt = PromptTemplate(input_variables: ["h", "url"], template: """
//%@
//""")
//            let request = prompt.format(args: [_1])
//            let llm = HuggingFace(repo: "bigscience/bloomz-1b1")
//            print(request)
//            let reply = await llm.send(text: request)
//            print(reply)
//        }
//        if let url = Bundle.main.url(forResource: "sample", withExtension: "pdf") {
//            let loader = PDFLoader(fileURL: url)
//            Task {
//               let doc = await loader.load()
////               let text_splitter = CharacterTextSplitter(chunk_size: 3000, chunk_overlap: 0)
////   
////               let texts = text_splitter.split_text(text: doc.first!.page_content)
////               let _1 = texts.first!
//               let prompt = PromptTemplate(input_variables: [], template: """
//   这是一个 pdf 文件的内容 %@，尝试总结它
//   """)
//               let request = prompt.format(args: [doc.first!.page_content])
//               let llm = OpenAI()
//               print(request)
//               let reply = await llm.send(text: request)
//               print(reply)
//           }
//        }
//        Task {
//            let llm = Dalle(size: .fiveTwelve)
//            let url = await llm.send(text: "an icon of a paper plane in light blue metallic iridescent material, 3D render isometric perspective on dark background")
//            print("image url: \(url)")
//        }
//        Task {
//            let js = JavascriptREPLTool()
//            let result = try await js._run(args: "1 + 2 ")
//            print("result: \(result)")
//        }
//        let demo = Book(title: "a", content: "b", unit: Unit(num: 1))
//        
//        var p = ObjectOutputParser(demo: demo)
//        
//        let llm = OpenAI()
//        
//        let t = PromptTemplate(input_variables: [], template: "Answer the user query.\n" + p.get_format_instructions() + "\n%@")
//        
//        let chain = LLMChain(llm: llm, prompt: t, parser: p)
//        Task {
//            let pasred = await chain.predict_and_parse(args: ["text": "The book title is 123 , content is 456 , num of unit is 7"])
//            switch pasred {
//            case Parsed.object(let o): print("object: \(o)")
//            default: break
//            }
//        }
        
//        let glm = ChatGLM(model: .chatglm_lite, temperature: 0.8)
//        Task {
//            let r = await glm.send(text: "你好", stops: [])
//            print("result: \(r)")
//        }
        
        
       
        
//        Task {
//            let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
//
//            let httpClient = HTTPClient(eventLoopGroupProvider: .shared(eventLoopGroup))
//            let chat = ChatOpenAI(httpClient: httpClient, temperature: 0.9)
//            defer {
//                // it's important to shutdown the httpClient after all requests are done, even if one failed. See: https://github.com/swift-server/async-http-client
//                try? httpClient.syncShutdown()
//            }
//            let r = await chat.send(text: "以春眠不觉晓为主题写一篇500字的文章")
////            let r = await chat.straem(text: "以春眠不觉晓为主题写一篇500字的文章")
//            
//            for try await c in r.generation! {
//                if let message = c.choices.first?.delta.content {
//                    print("-- \(message)")
//                }
//            }
//            print("done")
//        }
//        if let url = Bundle.main.url(forResource: "audio", withExtension: "mp3") {
//            let audio = AudioLoader(audio: url, fileName: "audio3.m4a")
//            Task {
//                let docs = await audio.load()
//                print(docs.count)
//                print(docs[3].page_content)
//            }
    //        }
//        let loader = TextLoader(file_path: "state_of_the_union.txt")
//        let documents = loader.load()
//        let text_splitter = CharacterTextSplitter(chunk_size: 1000, chunk_overlap: 0)
//        let embeddings = OpenAIEmbeddings()
//        let s = SupabaseByUser(embeddings: embeddings)
//        let user_id = UUID().uuidString
//       Task {
//           for text in documents {
//               let docs = text_splitter.split_text(text: text.page_content)
//               for doc in docs {
//                   await s.addText(text: doc, user_id: user_id)
//               }
//           }
//
//           let m = await s.similaritySearch(query: "What did the president say about Ketanji Brown Jackson", k: 1, user_id: user_id)
//           print("Q:What did the president say about Ketanji Brown Jackson")
//           print("A:\(m)")
//       }
        
//        let baidu = Baidu()
//        Task {
//            let llmResult = await baidu.send(text: "你好")
//            print("llm: \(llmResult.llm_output!)")
//        }
//        if let imagePath = Bundle.main.path(forResource: "ocr2", ofType: "png") {
//            if let image = UIImage(contentsOfFile: imagePath) {
//                if let data = image.pngData() {
//                    let ocrLoader = ImageOCRLoader(image: data)
//                    Task {
//                        let docs = await ocrLoader.load()
//                        print("ocr: \(docs.first!.page_content)")
//                    }
//                }
//            }
//            
//        }
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
