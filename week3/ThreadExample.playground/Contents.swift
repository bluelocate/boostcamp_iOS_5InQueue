import Foundation
import UIKit
var number: Int = 100 // 공유 자원
let lock = NSLock() // 임계 영역 동기화

let plusThread = Thread {
    lock.lock()
    repeat{
        number = number + 1
        print(number)
    } while number < 100
    lock.unlock()
}


let minusThread = Thread {
    lock.lock()
    repeat{
        number = number - 1
        print(number)
    } while number > 0
    lock.unlock()
}

minusThread.start()
plusThread.start()
while plusThread.isFinished != true && minusThread.isCancelled != true {}

print("==================Thread Finish \(number)==================")

class PlusOperation: Operation {
    override func main() {
        repeat {
            number = number + 1
            print(number)
        } while number < 100
    }
}

class MinusOperation: Operation {
    override func main() {
        repeat {
            number = number - 1
            print(number)
        } while number > 0
    }
}

class OperationExample {
    let queue = OperationQueue()
    init() {
        let minusOperation = MinusOperation()
        let plusOperation = PlusOperation()
        plusOperation.addDependency(minusOperation) // 의존성 추가 (순차 처리)
        self.queue.addOperation(minusOperation)
        self.queue.addOperation(plusOperation)
    }
}

let operationExample = OperationExample()
operationExample.queue.waitUntilAllOperationsAreFinished()
print("==================Operation Queue Finish \(number)==================")



class BlockOperationExample {
    let queue = OperationQueue()
    init() {
        let minusOperation = BlockOperation(block: { () in
            repeat {
                number = number - 1
                print(number)
            } while number > 0
        })
        let plusOperation = BlockOperation(block: { () in
            repeat {
                number = number + 1
                print(number)
            } while number < 100
        })
        
        plusOperation.addDependency(minusOperation) // 의존성 추가 (순차 처리)
        self.queue.addOperation(minusOperation)
        self.queue.addOperation(plusOperation)
    }
}

let blockOperationExample = BlockOperationExample()
blockOperationExample.queue.waitUntilAllOperationsAreFinished()
print("==================BlockOperation Queue Finish \(number)==================")

//QoS 우선순위 순서
//DispatchQoS.userInteractive
//DispatchQoS.userInitiated
//DispatchQoS.utility
//DispatchQoS.background

//DispatchQueue.main.sync(execute: <#T##() -> Void#>) // 동기
//DispatchQueue.main.async(execute: <#T##() -> Void#>) // 비동기이고, 메인에서 실행되지만, 작업이 언제 끝나는지는 모름
//DispatchQueue.global().sync(execute: <#T##() -> Void#>) // 쓰레드 풀에서 쓰레드 하나 꺼내서 작업에 할당해서 실행, 동기
//DispatchQueue.global().async(execute: <#T##() -> Void#>) // 비동기, 작업이 언제 끝나는지는 모름

DispatchQueue.global().sync(execute: { () in
    repeat {
        number = number - 1
        print(number)
    } while number > 0
})

DispatchQueue.global().sync(execute: { () in
    repeat {
        number = number + 1
        print(number)
    } while number < 100
})

while true { }