//
//  ContentView.swift
//  AlignmentGuide
//
//  Created by 석기권 on 7/21/24.
//

import SwiftUI

/*
 HStack(수직 정렬)
 VStack(수평 정령)
 */
struct ContentView: View {
    var body: some View {
//        AlignmentEx1()
        AlignmentEx3()
    }
}

struct AlignmentEx1: View {
    var body: some View {
        // alignment가 없으면 암묵적으로 center 정렬
        VStack(alignment: .trailing) {
            Text("This is some text")
            Text("This is some longer text")
            Text("This is short")
        }
        HStack(alignment: .lastTextBaseline) {
            Text("This is some text")
                .font(.largeTitle)
            Text("This is some much longer text")
                .font(.body)
            Text("This is short")
                .font(.headline)
        }
    }
}

// alignment guide는 뷰가 스택에 포함된 다른뷰와 정렬해야할때 커스텀 포지션을 정의하는데 사용한다.
struct AlignmentEx2: View {
    var body: some View {
        // 부모스택뷰와 정렬이 일치해야함
        // 부모스택 = leading
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color.green)
                .frame(width: 120, height: 120)
            
            Rectangle()
                .foregroundColor(Color.red)
                .frame(width: 200, height: 50)
            // 자식스택 = leading
            // ViewDimension은 뷰의 HorizontalAlignemnt, VerticalAlignment의 접근을 제공
                .alignmentGuide(.leading, computeValue: { d in
                    // 해당 뷰의 trailing 정렬을 부모의 leading과 맞춤
                    d[.trailing]
                })
            
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width: 180, height: 50)
        }
    }
}

struct AlignmentEx3: View {
    
    var body: some View {
        HStack(alignment: .oneThird) {
            Rectangle()
                .foregroundColor(Color.green)
                .frame(width: 50, height: 200)
            
            Rectangle()
                .foregroundColor(Color.red)
                .frame(width: 50, height: 200)
                .alignmentGuide(.oneThird, computeValue: { d in
                    // 뷰의 하단을 기준으로 높이의 3분의 1만큼 간격을줌
                    d[.bottom]
                })
            
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width: 50, height: 200)
            
            Rectangle()
                .foregroundColor(Color.orange)
                .frame(width: 50, height: 200)
                .alignmentGuide(.oneThird, computeValue: { d in
                    d[.top]
                })
        }
    }
}

// 스택 정렬 교차
struct AlignmentEx4: View {
    var body: some View {
        // hstack
        HStack(alignment: .crossAlignment, spacing: 20) {
            Circle()
                .foregroundColor(.purple)
            // bottom과 Circle의 center를 맞춘다.
                .alignmentGuide(.crossAlignment, computeValue: { d in
                    d[VerticalAlignment.center]
                })
                .frame(width: 100, height: 100)
              
            // vstack
            VStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(.blue)
                // Circle의 cetner와 Rectangle의 center를 맞춘다.
                    .alignmentGuide(.crossAlignment, computeValue: { d in
                        d[VerticalAlignment.center]
                    })
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

// VerticalAlignment을 확장하여 새로운 정렬타입 생성
extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }
    
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
    static let oneThird = VerticalAlignment(OneThird.self)
}

#Preview {
    ContentView()
}
