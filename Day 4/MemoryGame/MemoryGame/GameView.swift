//
//  ContentView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameModel = GameModel() // gameview가 생성 -> modelview 생성
    //내가 멤버변수로 가지고있는 것의 멤버변수를 바꿀때, 게임모델의 변화가 있을때 다시 그리겠다
    var body: some View {
        VStack {
            GrideStackView(cols: GameModel.cols, rows: GameModel.rows) { row, col in
                CardView(prefix: "f", card: gameModel.card(row : row, col : col))
                    .onTapGesture {
                        gameModel.toggle(row: row, col: col)
                    }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
