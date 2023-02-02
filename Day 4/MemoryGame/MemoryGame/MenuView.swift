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
            List {
                ForEach(prefixes, id : \.self) {
                    prefix in
                    NavigationLink {
                        GameView(prefix: prefix)
                    } label: {
                        MenuItemView(prefix: prefix)
                    }
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
        Image("\(prefix)_back")
    }
}
