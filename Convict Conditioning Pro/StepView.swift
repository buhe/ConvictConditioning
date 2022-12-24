//
//  StepView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI

struct StepView: View {
    let steps: [Step]
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
                        }.background( NavigationLink("", destination: VideoView(step: step)).opacity(0) )
                    }
                    Spacer()
                }.listRowSeparator(.hidden)
         
                
            }
        }
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(steps: Model().steps["Pushup"]!)
        StepView(steps: Model().steps["Pushup"]!).preferredColorScheme(.dark)
    }
}
