//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by 권석기 on 2/23/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var numbers = Array(1...100)
    @State var scrollID = 0
    
    var body: some View {
        VStack {
            HScrollView(numbers: numbers, scrollID: $scrollID)
                .frame(height: 50)
            Divider()
            VScrollView(numbers: numbers, scrollID: $scrollID)
        }
    }
}

struct HScrollView: View {
    let numbers: [Int]
    @Binding var scrollID: Int
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)")
                            .frame(maxHeight: 30)
                            .font(.body)
                            .padding(10)
                            .background(number == scrollID ? .blue : .gray)
                            .cornerRadius(12)
                            .onTapGesture {
                                scrollID = number
                            }
                    }
                }
            }
            .onChange(of: scrollID) { scrollID in
                withAnimation {
                    proxy.scrollTo(scrollID, anchor: .center)
                }
            }
        }
    }
}

struct VScrollView: View {
    let numbers: [Int]
    @Binding var scrollID: Int
    let detector: CurrentValueSubject<Int, Never>
    let publisher: AnyPublisher<Int, Never>
    
    init(numbers: [Int], scrollID: Binding<Int>) {
        self.numbers = numbers
        self._scrollID = scrollID
        let detector = CurrentValueSubject<Int, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.body)
                            .padding(15)
                            .background(number == scrollID ? .blue : .gray)
                            .cornerRadius(12)
                            .id(number)
                            .background(GeometryReader {
                                Color.clear.preference(key: ViewOffsetKey.self, value: ViewOffset(minY: -$0.frame(in: .named("scroll")).minY, maxY: -$0.frame(in: .named("scroll")).maxY))
                            })
                            .onPreferenceChange(ViewOffsetKey.self) { offset in
                                if offset.maxY >= 0 {
                                    detector.send(number + 1)
                                } else if offset.minY >= 0 {
                                    detector.send(number)
                                }
                            }
                            .onTapGesture {
                                scrollID = number
                            }
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .onChange(of: scrollID) { scrollID in
                // scrollID가 변경될때 offset변경
                withAnimation {
                    proxy.scrollTo(scrollID, anchor: .top)
                }
            }
            .onReceive(publisher) { number in
                scrollID = number
            }
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = ViewOffset
    static var defaultValue = ViewOffset(minY: 0, maxY: 0)
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = ViewOffset(minY: value.minY + nextValue().minY, maxY: value.maxY + nextValue().maxY)
    }
}

struct ViewOffset: Equatable {
    let minY: CGFloat
    let maxY: CGFloat
}

#Preview {
    ContentView()
}
