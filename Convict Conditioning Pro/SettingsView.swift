//
//  SettingsView.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2023/1/27.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form{
                Section(){
                    Button{
                        #if os(iOS)
                        if let url = URL(string: "https://github.com/buhe/InvestmentDashboard/issues") {
                            UIApplication.shared.open(url)
                        }
                        #endif
                    } label: {
                        
                        Text("Feedback")
                        
                    }.buttonStyle(PlainButtonStyle())
                    Button{
                        #if os(iOS)
                        if let url = URL(string: "https://github.com/buhe/InvestmentDashboard/issues") {
                            UIApplication.shared.open(url)
                        }
                        #endif
                    } label: {
                        
                        Text("Rate")
                        
                    }.buttonStyle(PlainButtonStyle())
                    HStack{
                        Text("Version")
                        Spacer()
                        Text("2")
                    }
                    HStack{
                        Text("License")
                        Spacer()
                        Text("GPLv3")
                    }
                }
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
