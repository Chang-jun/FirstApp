//
//  ContentView.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/02/03.
//

import SwiftUI

struct AlbumSample: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct AlbumSample_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSample()
    }
}
