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
