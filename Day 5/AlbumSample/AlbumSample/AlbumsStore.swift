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
