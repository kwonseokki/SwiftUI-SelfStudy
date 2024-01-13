//
//  ContentView.swift
//  WeSplit-Day17
//
//  Created by SeokKi Kwon on 2024/01/13.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool // Foucs 처리에 특화된 속성래퍼
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalContainsTip: Double {
        // 원래금액 / 100 * 팁
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        return checkAmount + tipValue
    }
    
    // 원래금액(checkAmount) + tip 비율
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    /**
                     Locale는 사용자의 모든 지역 설정(사용하는 달력, 수천 자리 숫자를 구분하는 방법, 미터법 사용 여부 등)을 저장하는 역할을 하는 iOS에 내장된 대규모 구조체입니다.
                     */
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused) // 초점이 맞춰지면 true
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        // 2는 2...100 중에 2번째 인덱스를 의미로 4가 초기값으로 나타남
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("totalPer Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("total contains tip") {
                    Text(totalContainsTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                // 보기의 항목이 적을때 segmented가 유용하다
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }.navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
