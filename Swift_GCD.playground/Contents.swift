import Foundation

// 출력 순서를 예측할 수 없음
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//             sleep(2)
//    }
//}
//
//DispatchQueue.main.async {
//    for _ in 1...5 {
//          print("🥵🥵🥵🥵🥵")
//          sleep(1)
//      }
//}

// sync로 처리되는 경우 해당 작업을 수행하고 다음 task를 수행
//DispatchQueue.global().sync {
//    for _ in 1...5 {
//        print("😀😀😀😀😀")
//        sleep(1)
//    }
//}
//
//DispatchQueue.global().sync {
//    for _ in 1...5 {
//        print("🥶🥶🥶🥶🥶")
//        sleep(2)
//    }
//}
//
//for _ in 1...5 {
//    print("🥵🥵🥵🥵🥵")
//    sleep(1)
//}

// deadlock(교착상태) 발생
//DispatchQueue.main.sync {
//    for _ in 1...5 {
//            print("😀😀😀😀😀")
//            sleep(1)
//        }
//}


// DispatchWorkItem을 이용하여 코드 블록을 캡슐화
// 타입을 명시하고 더 직관적인 코드를 작성할 수 있다.
let red = DispatchWorkItem {
    for _ in 1...5 {
          print("🥵🥵🥵🥵🥵")
          sleep(1)
      }
}

let yellow = DispatchWorkItem {
    for _ in 1...5 {
        print("😀😀😀😀😀")
        sleep(1)
    }
}

let blue = DispatchWorkItem {
    for _ in 1...5 {
        print("🥶🥶🥶🥶🥶")
        sleep(2)
    }
}

//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().async(execute: blue)

// 1
//DispatchQueue.global().async(execute: yellow)
//DispatchQueue.global().sync(execute: blue)
//DispatchQueue.main.async(execute: red)

// 2
//DispatchQueue.global().sync(execute: yellow)
//DispatchQueue.global().async(execute: blue)
//DispatchQueue.main.async(execute: red)

// 3
//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().async(execute: blue)
//DispatchQueue.global().sync(execute: red)

// 4
//DispatchQueue.main.async(execute: yellow)
//DispatchQueue.global().sync(execute: blue)
//DispatchQueue.global().async(execute: red)

//DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: yellow)


// notify
//let group = DispatchGroup()
//
//DispatchQueue.main.async(group: group) { print("TASK 1 IS COMPLETED") }
//DispatchQueue.global().async(group: group) { print("TASK 2 IS COMPLETED") }
//
//group.notify(queue: .main) {
//    print("TASK IS  DONE")
//}


// wait
//let group = DispatchGroup()
//
//DispatchQueue.global().async(group: group, execute: blue)
//DispatchQueue.global().async(group: group, execute: red)
//
//group.wait()
//print("모든 작업이 끝났습니다.")

//var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let semaphore = DispatchSemaphore(value: 1)
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        
//        semaphore.wait()
//        let card = cards.removeFirst()
//        print("야곰: \(card) 카드를 뽑았습니다!")
//        semaphore.signal()
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        semaphore.wait()
//        let card = cards.removeFirst()
//        print("노루: \(card) 카드를 뽑았습니다!")
//        semaphore.signal()
//    }
//}
//
//DispatchQueue.global().async {
//    for _ in 1...3 {
//        semaphore.wait()
//        let card = cards.removeFirst()
//        print("오동나무: \(card) 카드를 뽑았습니다!")
//        semaphore.signal()
//    }
//}


var cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let pickCardsSerialQueue = DispatchQueue(label: "PickCardsQueue") // 직렬큐

DispatchQueue.global().async {
    for _ in 1...3 {
        pickCardsSerialQueue.sync { // 직렬큐에 작업을 보내서 순차적으로 처리되도록 처리
            let card = cards.removeFirst()
            print("야곰: \(card) 카드를 뽑았습니다!")
        }
    }
}

DispatchQueue.global().async {
    for _ in 1...3 {
        pickCardsSerialQueue.sync {
            let card = cards.removeFirst()
            print("노루: \(card) 카드를 뽑았습니다!")
        }
    }
}

DispatchQueue.global().async {
    for _ in 1...3 {
        pickCardsSerialQueue.sync {
            let card = cards.removeFirst()
            print("오동나무: \(card) 카드를 뽑았습니다!")
        }
    }
}
