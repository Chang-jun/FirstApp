import Foundation

//if let -> nil아닐 경우에만 동작
// !는 optional로 감싸져있는것을 해제 (unwrap)
//guard let true면 실행 아니면 else return,break,continue
//switch-case // break는 안씀 대신 밑으로 진행할땐 fallthrough
//case는 순서대로 진행하기때문에 위치가 중요
//repeat-while = do - while
//greet(string,string) -> string
//2개의 string 변수를 받고 string을 리턴하는 함수
//가변인자를 받을때는 Int..아런식으로 씀
let pair = (10,15.1) // pair's type is Int,Double을 가진 튜플
let point = (x:15,y:10) // 얘도 튜플
point.x
point.y
