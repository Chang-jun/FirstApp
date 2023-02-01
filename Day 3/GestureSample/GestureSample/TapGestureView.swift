//
//  TapGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct TapGestureView: View {
@State var count = 0
        
    var body: some View {
        Text("Hello, World!, \(count)")
            .font(.largeTitle)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.cyan)
            .gesture(
                TapGesture()
                    .onEnded {
                print("Touch")
                count += 1
            }
        )
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
    }
}
