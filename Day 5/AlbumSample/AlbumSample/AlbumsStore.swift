//
//  AlbumsStore.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/02/03.
//

import Foundation

struct Album :Decodable { //Decodable을 명시해주면 객체 생성시 변수를 안만들어도 됌
    let artistname : String
    let albumTitle : String
    let image : String
}

struct AlbumResponse: Decodable {
    let albums: [Album]
}

class AlbumStore: ObservableObject {
    private static let instance = AlbumStore()
    static func get() -> AlbumStore { instance }
    @Published var albums = [Album]()
    
    func load() {
        guard let url = Bundle.main.url(forResource: "res/albums.json", withExtension: "")  else {
        //url 의 타입은 옵셔널     //Bundle -> 이앱 자체
            print("Bug????")
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Data load failed")
            return
        }
        //nil 일수도 있기때문에 가드 렛
        
        let decoder = JSONDecoder()
        guard let albumResponse = try? decoder.decode(AlbumResponse.self, from : data) else {
            print("Invalid Json")
            return
        }
        
        albums = albumResponse.albums
        
    }
    
    
    
}
//객체가 하나만 존재해도 되는애 싱글턴,인스턴스

