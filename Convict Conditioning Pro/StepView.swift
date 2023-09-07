//
//  StepView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI

struct StepView: View {
    let steps: [Step]
    let title: String
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        List {
            ForEach(steps) { step in
                HStack {
                    Spacer()
                    ZStack {
                        VStack {
                            Text(step.name)
                                .font(.title2)
                                .padding(.bottom).fontWeight(.bold)
                            Text(step.desc)
                                .font(.title3)
                                .fontWeight(.bold)
                            Divider()
                        }.background( NavigationLink("", destination: VideoView(step: step).environment(\.managedObjectContext, viewContext)).opacity(0) )
                    }
                    Spacer()
                }.listRowSeparator(.hidden)
         
                
            }
        }.navigationTitle(title).fontWeight(.bold)
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(steps: CCModel().steps["Pushup"]!, title: "Pushup")
        StepView(steps: CCModel().steps["Pushup"]!, title: "Pushup").preferredColorScheme(.dark)
    }
}
