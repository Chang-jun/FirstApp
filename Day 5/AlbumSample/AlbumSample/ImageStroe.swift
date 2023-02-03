//
//  ImageStroe.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/02/03.
//

import Foundation
import SwiftUI

class ImageStore {
    static var cache = [String: Image]()

    static func defImage() -> Image { Image("music.note.list") }
    static func load(urlString: String, callback: @escaping (Image)->()) -> Image {
        if let img = cache[urlString] {
            return img
        }

        guard let url = URL(string: urlString) else { return defImage() }
        print("Download start: \(urlString)")
        let task = URLSession.shared.dataTask(with: url) { data, resp, err in
            guard let data = data else { return }
            guard let uiImage = UIImage(data: data) else { return }
            let image = Image(uiImage: uiImage)
            OperationQueue.main.addOperation {
                cache[urlString] = image
                callback(image)
            }
        }
        task.resume()
        
        return defImage()
    }
}
