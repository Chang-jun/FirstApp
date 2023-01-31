//
//  ContentView.swift
//  MoreControl
//
//  Created by 홍길동 on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    @State var large = false
    @State var transparency = 0.0
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Color.red.frame(width: 20,height: 20)
            Image(systemName: "arrow.right.circle")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit) // 비율 지정
                .frame(width: large ? 200 : 100)
                .foregroundColor(.yellow)
                .rotationEffect(.radians(transparency*6.28))
                .shadow(color: .blue ,radius: 20)
            Slider(value: $transparency)
                .padding()
            HStack {
                Toggle(isOn: $large) {
                    //return 생략, 유일한 인자
                    Text("Show Large Circle")
                }
                .padding()
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(
            LinearGradient(colors: [Color.white,Color.cyan,Color.purple], startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing)
            //TopLeading : 좌측상단 , BottomTrailing : 좌측상단
            //LinearGradient : (컬러,시작점,끝점)그라데이션 주기
            
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
