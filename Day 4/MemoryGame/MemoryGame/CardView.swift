//
//  CardView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import SwiftUI
//Swift에서는 초기화 하지않은 멤버를 쓸수없음
struct CardView: View {
    let prefix: String
    let card: Card // struct Card를 가져옴
    @State var frameIndex = 1
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    //autoconnect()로 자동실행
    
    var body: some View {
        Image(filename)
            .resizable() //화면 크기에 맞춤
            .aspectRatio(contentMode: .fit) // 화면 비율에 맞춰서
            .onReceive(timer) {
                //0.1초마다 publish해라
                //publish 할때마다 receive에서 받겠다
                _ in
                if(card.state != .open) {
                    timer.upstream.connect().cancel()
                    return
                }
                frameIndex += 1
                if frameIndex > 8 {
                    frameIndex = 1
                }
            }
            .opacity(card.state == .removed ? 0 : 1)
    }
        
    
    var filename: String {
        if card.state == .closed { //early return : 만족하지 않았을 때가 먼저
            return "\(prefix)_back"
        }
        return String(format: "%@_%02d_%02d",prefix,card.number,frameIndex)
            //주요코드를 들여쓰기 안해도됌
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            ForEach(1...10, id:\.self) { num in
                HStack {
                    CardView(prefix: "f", card: Card(number: num))
                    CardView(prefix: "f", card: Card(number: num, state: .closed))
                    CardView(prefix: "f", card: Card(number: num, state: .removed))
                }
            }
        }
    }
}
