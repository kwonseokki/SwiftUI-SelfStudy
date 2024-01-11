//
//  ContentView.swift
//  SwiftUI_Text
//
//  Created by SeokkiKwon on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    static let dateFormat: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
       return formatter
    }()
    var trueOrFalse: Bool = false
    var today = Date()
    
    var body: some View {
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .tracking(0) // 글자와 글자 사이의 간격늘리기
                .font(.system(.body, design: .rounded))
                .fontWeight(.black)
                .multilineTextAlignment(.leading) // 글자 정렬 기본은 leading
                .lineLimit(nil) // 글자 라인을 제한 nil로 설정시 멀티라인 허용
                .lineSpacing(10) // 글자간격
                .truncationMode(.head) // 글자의 어디를 자를것인지?
                .shadow(color: Color.red, radius: 1.5, x: 0, y: 10) // radius는 번짐정도?
                .padding(.all, 20)
                .background(Color.yellow)
                .cornerRadius(20)
                .padding()
                .background(Color.green)
                .cornerRadius(20)
            
                Text("안녕하세요!!")
                .background(Color.gray)
                .foregroundColor(.white)
                
            Text(today, formatter: ContentView.dateFormat)
            
            Text("참 혹은 거짓: \(String(trueOrFalse))")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
