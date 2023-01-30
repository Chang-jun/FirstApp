//
//  ContentView.swift
//  FirstApp
//
//  Created by 홍길동 on 2023/01/30.
//

import SwiftUI

struct ImageModifier : ViewModifier {
    func body(content: Content) ->some View {
        content
            .foregroundColor(.red)
            .padding()
            .background(Color.yellow)
            }
} //imageModifier를 쓰면 설정한걸로 바꿈

struct ContentView: View {
    static let names = [
            "pencil.circle.fill",
            "folder.circle",
            "paperplane.circle.fill",
            "xmark.bin.fill",
        ]

    @State var count = 0 //count의 값이 바꾸면 다시 그려줌
    @State var imgIndex = 0
    var body: some View {
                VStack { //세로로 쌓기
                    Image(systemName: ContentView.names[imgIndex])
                .modifier(ImageModifier())
            Image(systemName: "trash.circle")
                .modifier(ImageModifier())
            Circle()
                .frame(width:100)
                .foregroundColor(.green)
            Button {
                print("Pressed")
                count += 1
                imgIndex = (imgIndex + 1) % 4
            } label: {
                ZStack {
                    Capsule().stroke(lineWidth: 5)
                    Text("This is a Button")
                }
                .frame(width:200,height:50)
            }
        
            Text("Count = \(count)!")
                .font(.largeTitle)
                .foregroundColor(.purple)
            HStack { //세로로쌓기
                Image(systemName: "arrow.right")
                Text("Lee Chang jun")
                Image(systemName: "folder.badge.person.crop")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    
            }
            //modifier
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
