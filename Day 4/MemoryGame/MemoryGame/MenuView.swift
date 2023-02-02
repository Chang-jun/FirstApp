//
//  MenuView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2023/02/02.


import SwiftUI

struct MenuView: View {
    let prefixes = [ "f", "t"]
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(prefixes, id : \.self) {
                    prefix in
                        MenuItemView(prefix: prefix)
                }
                
            }
                            .navigationTitle("Memory Game")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuItemView: View {
    let prefix: String
    
    var body: some View {
        HStack {
            Image("\(prefix)_back")
                .frame(width:200,height: 200)
                .background(
                    ZStack {
                        Color.white
                            .padding(20)
                        Image("\(prefix)_bg")
                            .resizable()
                            .padding(6)
                    }
                )
                Spacer()
            NavigationLink {
                GameView(prefix: prefix)
            } label: {
                Text("Start game")
            }
            Spacer()
        }
        
    }
}
