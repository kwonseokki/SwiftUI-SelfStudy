//
//  ContentView.swift
//  WeSplit
//
//  Created by SeokKi Kwon on 2024/01/12.
//

import SwiftUI

struct ContentView: View {
    @State var tabCount = 0
    let students = ["Harry", "Heromione", "Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        //        NavigationStack {
        //            Form {
        //                Section {
        //                    Text("Hello, world!")
        //                }
        //                Text("Hellow world!")
        //                Text("Hellow world!")
        //                Text("Hellow world!")
        //                Text("\(tabCount)")
        //                    .onTapGesture {
        //                        self.tabCount += 1
        //                    }
        //            }
        //            .navigationTitle("SwiftUI")
        //            .navigationBarTitleDisplayMode(.inline)
        //        }
        
        NavigationStack {
            Form {
                // id: \.self 고유하게 식별할 수 있도록 하며 변경되는 시기를 감지가능
                // \.self -> 배열의 문자열 자체가 고유한 식별자임을 의미
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                Text("selected \(selectedStudent)")
            }
        }
    }
}

#Preview {
    ContentView()
}
