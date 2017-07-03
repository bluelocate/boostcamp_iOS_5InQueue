# boostcamp_iOS_5InQueue
## 2장
> 32 페이지

### 수정 전
```swift
var str = "Hello, playground"
```

### 수정 후
```swift
var greeting = "Hello, playground"
```

### 근거
* Swift API Design Guidelines
	* Naming
		* Promote Clear Usage


> 42 페이지

### 수정 전
```swift
for var i = 0 ; i < countingUp.count ; ++i {
	let string = countingUp[i]
}
```


### 수정 후
```swift
for countString in countingUp {
	let count = countString
}
```

### 근거
   * The Swift Programming Language (Swift 4)
 	    * [Control Flow](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html)
 		     *  For - In Loops

   * Swift API Design Guidelines
 	    * Naming




> 42 페이지

### 수정 전
```swift
for(i, string) in countingUp.enumerate() {
	//(0, "one"), (1, "two")
}
```

### 수정 후
```swift
for(index, indexValue) in countingUp.enumerated(){
	//(0, "one"), (1, "two")
}
```
### 근거
   * The Swift Programming Language (Swift 4)
	    * [Collection Type](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html)
		     * Iterating Over an Array - .enumerate() -> .enumerated()
   * Name Mutating/nonmutating method pairs consistently.
      ```swift
      x.reverse()
      let y = x.reversed()
      ```



> 44 페이지

### 수정 전
```swift
enum PieType {
    case Apple
    case Cherry
    case Pecan
}
```

### 수정 후
```swift
enum PieType {
    case apple
    case cherry
    case pecan
}
```
### 근거
  * Enum의 case 명명법 변경
	   * UpperCamelCase -> lowerCamelCase
	* The Swift Programming Language(Language Guide)
		 * [Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
			  * Enumeration Syntax




> 45 페이지

### 수정 전
```swift
enum PieType: Int {
	case Apple = 0
	case Cherry
	case Pecan
}
```

### 수정 후
```swift
enum PieType: Int {
    case apple = 0 ,cherry ,pecan
}
```


### 근거
   * Enum의 case 명명법 변경
	    * UpperCamelCase -> lowerCamelCase
	 * The Swift Programming Language(Language Guide)
		  * [Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
			   * Implicitly Assigned Raw Values

## 3장
> 52 페이지

### 수정 전
```swift
firstView.backgroundColor = UIColor.blueColor()
```

### 수정 후
```swift
firstView.backgroundColor = UIColor.blue
```

### 근거
+ API Design Guidelines
  + Naming
     + Promote Clear Usage
+ UIColor의 blueColor()의 이름 변경
  + blueColor() -> [blue](https://developer.apple.com/documentation/uikit/uicolor/1621947-blue)

> 54 페이지

### 수정 전
```swift
secondView.backgroundColor = UIColor.greenColor()
```

### 수정 후
```swift
secondView.backgroundColor = UIColor.green
```

### 근거
+ API Design Guidelines
  + Naming
     + Promote Clear Usage
+ UIColor의 greenColor()의 이름 변경
  + greenColor() -> [green](https://developer.apple.com/documentation/uikit/uicolor/1621946-green)

> 55 페이지

### 수정 전
```swift
view.addSubview(secondView)
firstView.addSubview(secondView)
```

### 수정 후
```swift
firstView.addSubview(secondView)
```

### 근거
+ 불필요한 코드 제거
