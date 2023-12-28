//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by SeokKi Kwon on 2023/12/25.
//

import SwiftUI

struct ContentView: View {
    var contact = Contact(name: "john Smith", city: "London", country: "United Kingdom")
    var demo = Demo()
    var date = DateDemo()
    var body: some View {
        VStack {
            Text("\(demo.value)")
            Text(contact.name)
            Text(contact.city)
            Text(contact.country)
            
            Text("\(date.date)")
            
            Button(action: {
                
            }, label: {
                Text("Change")
            })
        }
        .padding()
    }
}

struct Demo {
    @MinMaxVal(max: 150, min: 10) var value: Int = 300
}

@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    let max: V
    let min: V
    
    init(wrappedValue: V, max: V, min: V) {
        value = wrappedValue
        self.max = max
        self.min = min
        
    }
        
    var wrappedValue: V {
        get { return value }
        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

struct DateDemo {
    // 최소 = 현재 최대 = 한달
    @MinMaxDate(min: Date(), max: Calendar.current.date(byAdding: .month, value: 1, to: Date())!) var date = Calendar.current.date(byAdding: .month, value: 7, to: Date())!
}

@propertyWrapper
struct MinMaxDate<V: Comparable> {
    var value: V
    var min: V
    var max: V
    
    init(wrappedValue: V, min: V, max: V) {
        self.value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: V {
        get { return value }
        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}

struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
    
    init(name: String, city: String, country: String) {
        self.name = name
        self.city = city
        self.country = country
    }
}

@propertyWrapper
struct FixCase {
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    private var value = ""
}

#Preview {
    ContentView()
}
