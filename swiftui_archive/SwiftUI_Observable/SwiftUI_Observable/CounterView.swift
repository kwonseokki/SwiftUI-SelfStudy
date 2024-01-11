//
//  CounterView.swift
//  SwiftUI_Observable
//
//  Created by SeokKi Kwon on 2023/12/15.
//

import SwiftUI

final class CounterViewModel: ObservableObject {
    private(set) var count = 0
    
    func incrementCounter() {
        count += 1
        objectWillChange.send()
    }
}

struct CounterView: View {
    @ObservedObject var viewModel = CounterViewModel()
    var body: some View {
        Text("Count is: \(viewModel.count)")
        Button(action: {
            viewModel.incrementCounter()
        }, label: {
            Text("Count up")
        })
    }
}

#Preview {
    CounterView()
}
