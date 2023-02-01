//
//  DragGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

func + (a:CGSize, b:CGSize) ->CGSize {
    CGSize(width: a.width + b.width, height: a.height + b.height)
}

struct DragGestureView: View {
    @State var globePosition = CGSize.zero // (0,0)
    @State var globeFinal = CGSize.zero
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.largeTitle)
                .scaleEffect(3.0)
                .foregroundColor(.blue)
                .offset(globePosition + globeFinal) //  위치설정
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            globePosition = value.translation // x,y 움직임 (CGSIZE) = > struct
                        }
                        .onEnded { value in
                            globeFinal = globeFinal + globePosition
                            globePosition = .zero
                        }
                )
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.yellow)
        .navigationTitle("Drag Gesture")
    }
        
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DragGestureView()
        }
    }
}
