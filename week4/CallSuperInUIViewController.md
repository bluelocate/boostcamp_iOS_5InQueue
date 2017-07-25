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
Very important logic by A  
Custom logic by B
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
Custom logic by B
```

## 결론: super 호출은 좋은 습관이다.
