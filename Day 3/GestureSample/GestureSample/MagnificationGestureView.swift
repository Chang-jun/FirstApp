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
        VStack{
            Image("common2")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .scaleEffect(finalScale * currentAmount)
                .gesture(
                    MagnificationGesture()
                    .onChanged {value in
                        
                        currentAmount = value
                    }
                    .onEnded {value in
                        finalScale *= currentAmount
                        currentAmount = 1.0
                        
                    }
                    
                    
                    
                )
        }
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
