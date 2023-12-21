//
//  ContentView.swift
//  Gesture
//
//  Created by SeokKi Kwon on 2023/12/21.
//

import SwiftUI

/**
 제스처는 터치 스크린과 사용자 간의 인터랙션을 설명하는데 사용
 - 드래그
 - 탭
 - 더블 탭
 - 로테이션
 - 핀칭
 - 롱 프레스
 */

struct ContentView: View {
    var body: some View {
        VStack {
            UpdatingGestureView()
        }
        .padding()
    }
}

// .gesture()로 제스처 인식기를 추가
// .onEnded는 제스처과 완료될때 호출되는 콜백
struct BasicGestureView: View {
    // 변수에 제스처를 선언해두고 사용하면 더깔끔하게 사용가능
    let tap = TapGesture()
        .onEnded { print("Tapped")}
    
    let doubleTap = TapGesture(count: 2)
        .onEnded { print("Double Tapped") }
    
    let longPress = LongPressGesture(minimumDuration: 2, maximumDistance: 25)
        .onEnded { _ in print("LongPressGesture") }
    
    var body: some View {
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .gesture(tap)
                .gesture(doubleTap)
                .gesture(longPress)
        }
    }
}

// MagnifyGesture 확대 동작을 인식하고 확대 정도를 추적
struct OnChangedGestureView: View {
    
    @State private var magnification: CGFloat = 1.0
    
    var body: some View {
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in
                print("Magnifying : \(value)")
                self.magnification = value
            }
            .onEnded { _ in print("MagnificationGesture") }
        
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(magnification)
                .gesture(magnificationGesture)
        }
    }
}

/**
 updating
 onChange와 유사하지만 @GestureState 프로퍼티 래퍼를 사용
 @State와 유사하지만 제스처가 끝나면 다시 초기 값으로 돌아감 -> 제스처를 하는 동안만 필요한 임시상태를 저장하는데 최적
 
 */
struct UpdatingGestureView: View {
    
    @GestureState private var offset: CGSize = .zero
    
    var body: some View {
        let drag = DragGesture()
        /**
         dragValue: 제스처에 대한 정보를 담고 있는 인스턴스
         state: @GestureState 제스처가 바인딩 되어있는 참조체(값을 업데이트할 수 있는 입출력 매개변수)
         transaction: Translation 제스처에 해당하는 애니메이션의 현재 상태를 담고 있는 객체
         */
            .updating($offset) { dragValue, state, transaction in
                print(dragValue.translation)
                state = dragValue.translation // DragGesture.Value 객체에서 현재값을 추출하여 @GestureState 프로퍼티에 할당
            }
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .font(.largeTitle)
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(drag)
        }
    }
}

/**
 여러개의 제스처들을 결합
 simultaneously: 두개의 제스처가 동시에 감지 되어야 동작을 수행
 sequenced: 두번째 제스처가 감지되기 전에 첫번째 제스처가 완료되어야함
 exclusively: 둘중 하나의 제스처가 감지되면 모두 감지된것으로 간주
 */
struct SimultaneouslyGestureView: View {
    
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    
    var body: some View {
        let longPressAndDrag = LongPressGesture(minimumDuration: 10.0)
            .updating($longPress) { value, state, transition in
                state = value
            }
            .simultaneously(with: DragGesture())
            .updating($offset) { value, state, transaction in
                state = value.second?.translation ?? .zero
            }
        
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .foregroundColor(longPress ? .red : .blue)
                .font(.largeTitle)
                .frame(width: 100, height: 100)
                .offset(offset)
                .gesture(longPressAndDrag)
        }
    }
}

struct SequencedGestureView: View {
    
    @GestureState private var offset: CGSize = .zero
    @State private var dranEnabled: Bool = false
    
    
    var body: some View {
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0)
            .onEnded { _ in
                self.dranEnabled = true
            }
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                switch value {
                case .first(true):
                    print("Long press in progress")
                case.second(true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded { value in
                self.dranEnabled = false
            }
        
        VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .foregroundStyle(dranEnabled ? .green : .red)
                .frame(width: 200, height: 200)
                .offset(offset)
                .gesture(longPressBeforeDrag)
        }
    }
}


//#Preview {
//    ContentView()
//}
