//
//  ContentView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import SwiftUI

struct GameView: View {
    let prefix: String
    @State var showsRetryAlert = false
    @Environment(\.presentationMode) var present
    
    let timerPublisher = Timer.publish(every: 0.1,
                                       on: .main,
                                       in: .common).autoconnect()
    //s를 붙이는 것은 부울값을 정할때
    @ObservedObject var gameModel = GameModel() // gameview가 생성 -> modelview 생성
    //내가 멤버변수로 가지고있는 것의 멤버변수를 바꿀때, 게임모델의 변화가 있을때 다시 그리겠다
    var body: some View {
        VStack {
            HStack {
                Text("Memory Game")
                    .font(.largeTitle)
                Spacer()
                Text("Score: \(String(format: "%.1f     ", gameModel.score))")
                    .font(.headline)
                    .onReceive(timerPublisher) {
                        _ in
                            if gameModel.over {
                                timerPublisher.upstream.connect().cancel()
                            }
                        gameModel.addTimeScore(amount : 0.1)
                    }
                
            }
            
            
            GrideStackView(cols: GameModel.cols, rows: GameModel.rows) { row, col in
                CardView(prefix: prefix, card: gameModel.card(row : row, col : col))
                    .onTapGesture {
                        gameModel.toggle(row: row, col: col)
                        if gameModel.over {
                            showsRetryAlert = true
                        }
                    }
            }
            Spacer()
            HStack {
                
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    Spacer()
                    Text("Back")
                        .font(.largeTitle)
                        .padding()
                        .background(Capsule()
                            .stroke(lineWidth: 3))
                        .shadow(radius: 3)
                }
                
                Button {
                    //gameModel.start()
                    showsRetryAlert = true
                } label: {
                    
                    Spacer()
                    Text("Restart")
                        .font(.largeTitle)
                        .padding()
                        .background(Capsule()
                            .stroke(lineWidth: 3))
                        .shadow(radius: 3)
                    Spacer()
                }
                
                
            }
            Spacer()
        }
        .background(.linearGradient(colors: [.white,.cyan,.blue.opacity(0.6)], startPoint: .bottomLeading, endPoint: .topTrailing))
        .alert(isPresented: $showsRetryAlert) {
                    Alert(title: Text("Restart"),
                          message: Text("Do you really want to restart the game?"),
                          primaryButton:
                            .destructive(Text("Restart"))  {
                                gameModel.start()
                            },
                          secondaryButton: .cancel())
                }
        
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(prefix: "f")
    }
}
