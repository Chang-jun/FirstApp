//
//  RotationGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct RotationGestureView: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "arrow.right.circle")
                    .font(.largeTitle)
                .scaleEffect(3.0) //크게 보여지는것뿐, 이미지가 차이하는범위는 커지지않음
                Text("This is a test text")
                    .font(.largeTitle)
                    .padding()
            }
            .foregroundColor(.purple)
            .background(.orange.opacity(0.3))
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.blue.opacity(0.6))
        .navigationTitle("Rotation Gesture")
    }
}

struct RotationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RotationGestureView()
        }
    }
}
