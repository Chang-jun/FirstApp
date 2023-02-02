//
//  ContentView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import SwiftUI

struct GameView: View {
    var gameModel = GameModel() // gameview가 생성 -> modelview 생성
    var body: some View {
        VStack {
            GrideStackView(cols: GameModel.cols, rows: GameModel.rows) { row, col in
                CardView(prefix: "f", card: gameModel.card(row : row, col : col))
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
