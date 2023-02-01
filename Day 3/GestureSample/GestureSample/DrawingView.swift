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
                .stroke(style: StrokeStyle(lineWidth: 7,lineCap: .round, lineJoin: .round))
            //lineCap = 선의 양쪽 끝의 모양(square,round,butt)
            //lineJoin = 모서리 무분 모양
            
                .frame(height: 50)
                .padding(.horizontal)
                
            Circle()
                .frame(width: 50)
            Ellipse()
                .frame(width: 100, height: 50)
            GeometryReader { gr in
                           Path { path in
                               let rect = CGRect(origin: .zero, size: gr.size)
                               path.move(to: CGPoint(x: rect.size.width/2, y: 0))
                               path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: rect.size.width, y: rect.size.height))
                               path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: 0), control: CGPoint(x: 0, y: rect.size.height))
                               path.move(to: .zero)
                           }
                           .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottom))
                       }
                       .frame(width: 200, height: 200)
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
