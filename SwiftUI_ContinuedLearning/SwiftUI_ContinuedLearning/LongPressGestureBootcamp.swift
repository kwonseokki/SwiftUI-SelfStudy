//
//  LongPressGestureBootcamp.swift
//  SwiftUI_ContinuedLearning
//
//  Created by SeokKi Kwon on 2023/12/23.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSucces: Bool = false
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        withAnimation {
                            isComplete = true
                        }
                        isSucces = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if !isSucces {
                                withAnimation {
                                    isComplete = false
                                }
                            }
                        }
                    }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isSucces = false
                        isComplete = false
                    }
            }
        }
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETED")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? .green : .gray)
//            .cornerRadius(10)
//            .onTapGesture {
//                isComplete.toggle()
//            }
        // maximumDistance -> 길게눌렀을떄 허용되는 최대길이
//            .onLongPressGesture(minimumDuration: 5.0, maximumDistance: 1) {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    LongPressGestureBootcamp()
}
