//
//  DrawingView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct DrawingView: View {
    var body: some View {
        VStack {
            Color.red
                .frame(width: 200,height: 55)
            Rectangle()
                .stroke(lineWidth: 10)
                .fill(.blue.gradient)
                .cornerRadius(5)
                .frame(height: 50)
                .padding()
            Capsule()
                .stroke(lineWidth: 5)
                .frame(height: 50)
                .padding(.horizontal)
                
            Circle()
                .frame(width: 50)
            Ellipse()
                .frame(width: 100, height: 50)
            Path {
                path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 150, y: 50))
                path.closeSubpath()
            }
            .stroke(lineWidth: 10)
            .fill(.blue.gradient)
        }
        .navigationTitle("Drawing")
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DrawingView()
        }
    }
}
