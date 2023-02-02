//
//  GameModel.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import Foundation

struct Card {
    enum State {
        case open,closed,removed //열거형으로 세가지 상태 정의
    }
    // prefix, num , open
    let number : Int //숫자는 안변함
    var state = State.open
    //var open : Bool? //앞뒷면은 변함 Bool? 은 tri-state (ture,false,nil)
    //삭제 되는 경우 ture -> open, false -> back , nil -> delete?
}

class GameModel :ObservableObject { //게임 진행의 모든것, class만 옵저버블이 될수이씀
    static let cols = 3 // 코드 수정은 여기서 바꾸면됌
    static let rows = 4 // 정적,상수 , class 멤버, GameModel.~~
    
    @Published var cards = [Card]() //어느 멤버의 수정이 있을때 알림이 가게 하느냐 ? -> Published 
    //var cards : [Card] = [] 같은 표현 [~] = [] Card Array를 만들어서 cards에 넣겠다
    
    init() {
        let max =  Self.cols * Self.rows / 2
        for number in 1...max {
            cards.append(Card(number: number,state: .open))
            cards.append(Card(number: number, state: .closed)) // 다른언어의 경우 reference type이여서 안되지만, swift는 value type이여서 둘은 다른거임
            
        }
    }
    func card(row: Int, col: Int) -> Card {
            let index = row * Self.cols + col //여기서 대문자 Self는 gameModle
            return cards[index]
        }
    func toggle(row: Int, col: Int) { // class는 mutating을 안써도됌, 항상 가능
        let index = row * Self.cols + col
        var card = cards[index]
        card.state = card.state == .open ? .closed : .open
        cards[index] = card
    }
}



