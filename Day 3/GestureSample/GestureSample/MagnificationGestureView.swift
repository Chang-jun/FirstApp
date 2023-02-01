//
//  MagnificationGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct MagnificationGestureView: View {
    @State var currentAmount = 1.0
    @State var finalScale = 1.0
    var body: some View {
        ZStack {
            VStack{
                Image("common2")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .scaleEffect(finalScale * currentAmount) // 마지막 배율 기억
                    .gesture(
                        MagnificationGesture()
                        .onChanged {value in
                            
                            currentAmount = value
                        }
                        .onEnded {value in
                            finalScale *= currentAmount // 비율이기 때문에 곱하기
                            currentAmount = 1.0 // 초기 상태 1배율
                            
                        }
                        
                        
                        
                    )
                
            }
            VStack {
                Text("Scale = \(String(format: "%.1f", finalScale * currentAmount))")
                    .font(.largeTitle)
                    .padding()
                    .background(.white.opacity(0.3))
                    .cornerRadius(10)
                    .padding()
                    .onTapGesture {
                        finalScale = 1.0
                    }
                
                Spacer()
            }
            
        }
        .background(
            LinearGradient(colors : [.white, .purple.opacity(0.3), .pink.opacity(0.4)], startPoint: .bottomTrailing, endPoint: .topLeading)
        )
        .navigationTitle("Magnification View")
    }
}

struct MagnificationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MagnificationGestureView()
        }
    }
}
