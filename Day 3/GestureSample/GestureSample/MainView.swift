//
//  ContentView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/02/01.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    TapGestureView()
                } label: {
                    Text("Tap & Long Press")
                }
                NavigationLink {
                    DragGestureView()
                } label: {
                    Text("Drag")
                }

                NavigationLink {
                    RotationGestureView()
                } label: {
                    Text("Rotation")
                }
                NavigationLink {
                    MagnificationGestureView()
                } label: {
                    Text("Magnification")
                }
                NavigationLink {
                    DrawingView()
                } label: {
                    Text("Draw")
                }
            }
            .navigationTitle("Gesture Test Sample")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
