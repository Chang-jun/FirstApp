//
//  RotationGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct RotationGestureView: View {
    @State var currAngle = Angle.zero
    @State var finalAngle = Angle.zero
    var body: some View {
        VStack {
            Text("Angle = \(String(format: "%.1f", currAngle.degrees))") //부동소수점 수 정하는 법
                Spacer()
            VStack {
                Image(systemName: "arrow.right.circle")
                    .font(.largeTitle)
                .scaleEffect(3.0) //크게 보여지는것뿐, 이미지가 차이하는범위는 커지지않음
                Text("This is a test text")
                    .font(.largeTitle)
                    .padding()
            }
            .rotationEffect(finalAngle + currAngle)
            .foregroundColor(.purple)
            .background(.orange.opacity(0.3))
            .gesture(
                            RotationGesture()
                                .onChanged { value in
                                    currAngle = value
                                }
                                .onEnded { _ in
                                    finalAngle += currAngle
                                    currAngle = .zero
                                }
                        )
            Spacer()
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
