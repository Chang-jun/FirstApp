//
//  GrideStackView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.
//

import SwiftUI

struct GrideStackView: View {
    let cols: Int
    let rows: Int
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) {
                row in
                HStack {
                    ForEach(0..<cols, id : \.self) {
                        col in
                        Text("card")
                            .font(.largeTitle)
                    }
                }

            }
        }
    }
}

struct GrideStackView_Previews: PreviewProvider {
    static var previews: some View {
        GrideStackView(cols: 3, rows: 4)
    }
}
