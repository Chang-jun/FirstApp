//
//  ContentView.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/02/03.
//

import SwiftUI

struct AlbumListView: View {
    @ObservedObject var albumStore = AlbumStore.get()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(albumStore.albums, id: \.albumTitle) { album in
                        AlbumItemView(album: album)
                    }
                }
            }
            .overlay {
                ZStack { // 어떤 것위에 Zㅅ스택쌓는거랑 비슷
                    Color.gray.opacity(0.75)
                        .frame(width : .infinity,height: .infinity)
                    ProgressView()
                }
                .opacity(albumStore.albums.count == 0 ? 1.0 : 0.0)
            }
            
                .onAppear {
                    albumStore.load()
                }
            .navigationTitle("Albums")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}

struct AlbumItemView: View {
    let album: Album
    @State var image: Image?
    var body: some View {
        HStack {
            albumImage()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64)
            VStack(alignment: .leading) {
                Text(album.albumTitle)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(Color("albumTitleColor"))
                Text(album.artistName)
                    .font(.footnote)
                    .foregroundColor(Color("artistNameColor"))
                    .padding(.top, 4)
            }
        }
    }
    func albumImage() -> Image {
//        if image != nil { return image! }
        if let image = image { return image }
        return ImageStore.load(urlString: album.image) { img in
            image = img
        }
    }
}

struct AlbumItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AlbumItemView(album: Album(artistName: "김태우", albumTitle: "2집 T-School", image: "img"))
            AlbumItemView(album: Album(artistName: "Various Artists", albumTitle: "서바이벌 나는 가수다 경연 1 (80년대 명곡 부르기)", image: "img"))
            AlbumItemView(album: Album(artistName: "Ke$ha", albumTitle: "I Am The Dance Commander + I Command You To Dance - The Remix Album (US Explicit Ver.)", image: "img"))
        }
    }
}
