//
//  ContentView.swift
//  Binding
//
//  Created by 석기권 on 2024/02/03.
//

import SwiftUI

struct ContentView: View {
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    @State private var selection = 0
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
    //    var body: some View {
    //        VStack {
    //            ForEach(agents, id: \.self) {
    //                Text($0)
    //            }
    //        }
    //        .padding()
    //    }
    var body: some View {
        let binding = Binding(
            get: { selection },
            set: { selection = $0 }
        )
        
        let agreedToAll = Binding(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToEmails = $0
                agreedToPrivacyPolicy = $0
            }
        )
        
        return VStack {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
        }
    }
}

#Preview {
    ContentView()
}
