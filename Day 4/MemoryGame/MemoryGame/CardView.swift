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
    let number: Int
    
    var body: some View {
        Image("\(prefix)_\(String(format: "%02d", number))_01")
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            CardView(prefix: "f", number: 1)
            CardView(prefix: "f", number: 2)
            CardView(prefix: "f", number: 3)
            CardView(prefix: "f", number: 4)
        }
    }
}
