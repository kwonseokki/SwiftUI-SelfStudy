//
//  MyScrollView.swift
//  SwiftUI_UIViewRepresentable
//
//  Created by SeokKi Kwon on 2023/12/16.
//

import SwiftUI

// Coordinator는 UIKit과 SwiftUI의 중재자 역할을 한다.
struct MyScrollView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self) // 스크롤뷰를 코디네이터 클래스에 넘겨준다
    }
    
    var text: String
    
    func makeUIView(context: Context) -> some UIView {
        let scrollView = UIScrollView()
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        scrollView.delegate = context.coordinator // 스크롤뷰의 delegate를 context.coordinator로 지정
        scrollView.refreshControl = UIRefreshControl()
        
        // refreshControll 타겟으로 handleRefresh 메서드를 추가한다
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefresh), for: .valueChanged)
        
        myLabel.text = text
        scrollView.addSubview(myLabel)
        return scrollView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var control: MyScrollView
        
        init(control: MyScrollView) {
            self.control = control
        }
        
        // 스크롤될때 호출되는 함수
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("View is Scrolling")
        }
        
        @objc func handleRefresh(sender: UIRefreshControl) {
            sender.endRefreshing()
        }
    }
}

#Preview {
    MyScrollView(text: "Swift")
}
