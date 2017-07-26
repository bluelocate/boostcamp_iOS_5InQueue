# Calling 'super' in UIViewController's Life Cycle Methods

Q. `UIViewController` 클래스를 상속받은 클래스에서 부모의 Life Cycle Method(예: `viewDidLoad()`, `viewWillAppear(animated:)` 등)를 호출(`super.viewDidLoad()` 등)하는 이유에 대해 토의해 보고, 부모클래스의 메서드를 호출하지 않으면 발생할 수 있는 일에 대해 탐구해보세요.

## 예시 코드를 통한 비교

### super를 호출한 경우

```swift
class A: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		print(“Very important logic is called!”)		
	}
}

class B: A {
	override func viewDidLoad() {
		super.viewDidLoad()

		print(“Custom logic is called!”)			
	}
}
```
이제 class B를 Initial View Controller로 지정한 뒤 실행하여 본다.

실행 결과
+ 부모 클래스의 Life Cycle Method인 viewDidLoad()내 정의된 print문까지 잘 실행된다.

```
Very important logic is called!  
Custom logic is called!
```

### super 호출을 생략한 경우

```swift
class A: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		print(“Very important logic is called!”)		
	}
}

class B: A {
	override func viewDidLoad() {
		//super.viewDidLoad()

		print(“Custom logic is called!”)			
	}
}
```
마찬가지로 class B를 Initial View Controller로 지정한 뒤 실행하여 본다.


실행 결과
+  부모 클래스의 viewDidLoad()내 정의된 **print문이 실행되지 않는다.**

```
Custom logic is called!
```

## 결론: super 호출은 중요한 습관이다.

Life cycle 메서드 안에서 코드를 작성할 때 부모 View controller의 메소드를 우선 호출하는 것은 매우 바람직한 습관이다. super를 호출함으로써 부모 클래스를 먼저 불러오고 나서 나머지 코드를 실행하는 것이 이치에 맞다. super 호출을 하지 않아도 같은 결과가 나타난다고 해서 이를 생략하는 것은 위험할 생각일 수 있다. 상속 관계가 복잡해지면 그 미묘한 차이로 예측 불가능한 오류가 발생할 수 있기 때문이다.

예시 코드에서 보았듯이 life cycle 메서드에서 super 호출을 하지 않으면 부모 클래스의 것을 온전히 상속받지 못한다. 클래스 A를 상속받겠다고 명시해 놓고서는 결과적으로 UIViewController만 상속받은 셈이 된 것이다.

따라서 super 호출을 하지 말아야 하는 특별한 이유가 있지 않는 한 super를 우선 호출하고 코드 작성을 시작하는 것이 바람직하다.
