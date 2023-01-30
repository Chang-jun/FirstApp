//
//  ContentView.swift
//  ImageSiwicher
//
//  Created by 홍길동 on 2023/01/30.
//

import SwiftUI

struct ContentView: View {
    @State var imgIndex = 1
    let count = 2
    
    var body: some View {
        VStack {
            HStack {
                //expect rename (repectoring)
                TopButton(enables: imgIndex > 1)
                Spacer()
                Text("\(imgIndex) / 2")
                Spacer()
                Button {
                    if imgIndex < count {
                        imgIndex += 1
                    }
                } label: {
                    ZStack {
                        Capsule().stroke(lineWidth: 5)
                        Image(systemName: "arrow.right")                }
                    .frame(width:30,height:30)
                    
            }
                .disabled(imgIndex == 2)

            }
            Spacer()
            Image("common\(imgIndex)")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// unit Test
struct TopButton: View {
    var enables: Bool
    init(enables: Bool){
        self.enables = enables
    }
    var body: some View {
        Button {
        //    if(imgIndex >= 1)
          //  {
            //    imgIndex -= 1 }
        } label: {
            ZStack {
                Capsule().stroke(lineWidth: 5)
                Image(systemName: "arrow.left")                }
            .frame(width:30,height:30)
            
        }
        .disabled(!enables)
    }
}


struct TopBotton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TopButton(enables: true)
            TopButton(enables: false)
        }
    }
}
