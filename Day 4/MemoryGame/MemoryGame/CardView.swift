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
    var open: Bool
    var body: some View {
        Image(filename)
    }
    var filename: String {
        if !open { //early return : 만족하지 않았을 때가 먼저
            return "\(prefix)_back"
        }
        return String(format: "%@_%02d_%02d",prefix,number,1)
            //주요코드를 들여쓰기 안해도됌
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            CardView(prefix: "f", number: 1,open: true)
            CardView(prefix: "f", number: 2,open: true)
            CardView(prefix: "f", number: 3,open: true)
            CardView(prefix: "f", number: 4,open: false)
        }
    }
}
