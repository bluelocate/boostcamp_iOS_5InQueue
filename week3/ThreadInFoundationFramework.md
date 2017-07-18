# Foundation Framework에서의 스레드
> Q. Foundation Framework에서는 어떤 방식으로 스레드를 다룰 수 있는지 찾아보고 각 예를 실질적인 코드로 표현해보세요

Foundation Framework가 제공하는 스레드 관리 기법에는 크게 세 가지가 있다.
1. Thread
2. Operation Queue
3. Dispatch Queue (GCD : Grand-Central-Dispatch)

## Thread

Thread 클래스를 사용하여 다중 스레드 프로그램을 만들 수 있으며,
다양한 잠금 클래스는 경쟁 스레드 별로 프로세스 리소스에 대한 액세스를 제어하는 메커니즘을 제공한다. Thread 클래스를 상속한 후, main() 메소드를 재정의하여 스레드의 기본 진입 점을 구현할 수 있다.

> Thread 를 사용하면 시스템 상태가 변함에 따라 개발자가 동적으로 생성하고 조정할 Thread수를 결정해야한다. 또, 응용 프로그램이 사용하는 스레드를 만들고 유지 관리하는 것과 관련된 많은 비용을 소모해야한다.  
따라서 OS X 및 iOS에서는 동시성 문제를 해결하기 위해 Thread에 의존하는 대신, 아래와 같은 비동기 설계 방식을 사용한다.

## Operation Queue

실행할 작업을 정의한 다음, Operation Queue에 추가하여 해당 작업의 스케줄링 및 실행을 처리한다. GCD와 마찬가지로 Operation Queue는 모든 Thread 관리를 처리하여, 시스템에서 가능한 한 신속하고 효율적으로 작업을 실행한다.

+ 작업 객체 생성 방법
   1. Operation 클래스 서브클래싱
   2. BlockOperation 이용

## Dispatch Queue (GCD : Grand-Central-Dispatch)

일반적으로 자신의 응용 프로그램에서 쓰는 Thread 관리 코드를 사용하여 해당 코드를 시스템 수준으로 이동시킨다. 실행할 작업을 정의하고, 이를 적절한 Dispatch Queue에 추가하면,  GCD는 필요한 Thread를 생성하고 해당 Thread에서 실행되도록 작업을 예약한다.

+ 동기와 비동기
   + 동기 : 작업이 완료 후 반환될 때까지 대기
   + 비동기 : 작업을 바로 실행, 반환될 때까지 대기하지 않음

+ 큐 종류
   + Serial : 처리를 직렬로 실행한다. 큐의 이전작업이 완료된 후, 다음 작업을 실행한다.
   + Concurrent : 처리를 병렬로 실행한다. 처리가 대기열에서 제거되는 순서는 FIFO이지만, 한번에 여러 작업을 실행하고 처리가 완료되는 차례도 보장하지 않는다.

## GCD VS Operation Queue
+ **KVO**  
: Operation Queue는 isCancelled, isFinished등을 통해 작업의 상태가 변경 되었는지를 알 수 있음.
+ **작업 취소**  
: Operation Queue는 Operation의 Cancel을 통해 작업을 취소할 수 있도록 제어가 가능. GCD도 취소를 구현할 수 있지만 부수적인 코드를 많이 작성해야 함.
+	**작업의 재사용**  
: Operation Queue는 자식 클래스를 만들어서 원하는 형태로 작업이 가능하며 작업이 끝나더라도 재사용 가능.
+	**작업 우선순위**  
: Operation Queue는 각 작업들 간의 우선순위를 매길 수 있음. 우선순위가 높은 작업이 우선순위가 낮은 작업보다 먼저 수행. GCD도 우선순위를 가지지만 같은 작업에 대해서는 직접적인 방법은 없으며, 개별 작업이 아닌 전체 큐에 대한 우선순위를 설정 가능.
+	**작업 간의 의존성**  
: 작업이 수행한 후 다른 작업이 수행할 수 있도록 작업 계층을 만들 수 있습니다.
