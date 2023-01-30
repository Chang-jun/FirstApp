import Foundation // cocoa
//basic library = foundation
var greeting = "Hello, playground"


var name = "Lee"
// var name:String = "Lee"
var age = 23 //mutable value 변수
//var age:Int = 23
// var , let 키워드
let boreIn = 2000 //constant
age += 1
// boreIn += 1 상수를 바꾸려고 하기때문에 오류발생//

let pi = 3.14
let msg = "value of pi is \(pi)"
print(msg)

let names = ["Kim","Lee","Park"]
// names.append("Park") -> error : let(constant)
//sort() -> 정렬해라
//sorted() -> 정렬된 배열 리턴

var nums = [1,2,3,4,5]
nums.append(67)
nums[3] = 100
//CustomStringConvertible : 문자열,숫자 다 가능
// Dictionary [String : Int] =>String to Int
var ages = ["Kim" : 10,"Lee" : 20]
let a1 = ages["Kim"] // type : optional int => int란 값이 있을지 모르기 때문에 int? 가 맞는 표현이다
let a2 = ages["Kim"]! // type : int
// nil = null
//Set<Int> , Set<String>

ages = [:] // blank dictionary







