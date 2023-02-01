//
//  TapGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct TapGestureView: View {
@State var count = 0
@State var L_count = 0
        
    var body: some View {
        VStack {
            Text("Tap!, \(count)")
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.cyan)
                .onTapGesture { // TapGesture와 동일
                    print("Touch")
                    count += 1
                }
            Text("Long Press!, \(L_count)")
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .onLongPressGesture {
                    L_count += 1
                }
             
        }
        .navigationTitle("Tab & Long Press")
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TapGestureView()
        }
    }
}
