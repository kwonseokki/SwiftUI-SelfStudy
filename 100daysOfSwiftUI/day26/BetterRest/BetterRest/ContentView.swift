//
//  ContentView.swift
//  BetterRest
//
//  Created by 석기권 on 2024/02/09.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
        }
        .padding()
    }
    
    func exampleDates() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        
        let date = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = date.hour ?? 0
        let minute = date.minute ?? 0
    }
}

#Preview {
    ContentView()
}
