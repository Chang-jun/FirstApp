//
//  ContentView.swift
//  FirstApp
//
//  Created by 홍길동 on 2023/01/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { //세로로 쌓기
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Circle()
                .frame(width:100)
                .foregroundColor(.green)
            Button {
                print("Pressed")
            } label: {
                ZStack {
                    Capsule().stroke(lineWidth: 5)
                    Text("This is a Button")
                }
                .frame(width:200,height:50)
            }
        
            Text("Hello, Tukorea!")
                .font(.largeTitle)
                .foregroundColor(.purple)
            HStack { //세로로쌓기
                Image(systemName: "arrow.right")
                Text("Lee Chang jun")
                Image(systemName: "folder.badge.person.crop")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    
            }
            .padding()
            .background(Color.purple)
            .padding()
            //상하좌우에 빈공간, 조절가능
            .background(Color.black)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
