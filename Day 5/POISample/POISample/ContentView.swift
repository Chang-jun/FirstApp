//
//  ContentView.swift
//  POISample
//
//  Created by 홍길동 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var poiData = PoiDataStore.get()
    var body: some View {
        VStack {
            
        }
        .onAppear {
            poiData.startLoading()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
