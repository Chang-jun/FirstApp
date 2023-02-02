//
//  GrideStackView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import SwiftUI

struct GrideStackView<Content: View>: View {
    let cols: Int
    let rows: Int
    let content : (_ row: Int, _ col: Int)->Content
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) {
                row in
                HStack {
                    ForEach(0..<cols, id : \.self) {
                        col in
                        self.content(row,col)
                    }
                }
            }
        }
    }
}

struct GrideStackView_Previews: PreviewProvider {
    static var previews: some View {
        GrideStackView(cols: 3, rows: 4) { row, col in
            Text("Card")
                .font(.largeTitle)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
}
