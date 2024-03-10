//
//  RMAsyncImage.swift
//  RickAndMorty
//
//  Created by RIMA on 9/3/2024.
//

import SwiftUI

struct RMAsyncImage: View {
    
    var urlString: String
    
    var body: some View {
        let urlImage = URL(string: urlString)
        
        AsyncImage(url: urlImage) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct RMCachedImage: View {
    
    @ObservedObject var cachedImageLoader: CachedImageLoader
    
    init(urlString: String?) {
        self.cachedImageLoader = .init(url: URL(string: urlString ?? ""))
    }
    
    var body: some View {
        
        if let image = cachedImageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            EmptyView()
        }
    }
}

class CachedImageLoader: ObservableObject {
    
    var url: URL?
    
    @Published var image: UIImage?
    
    init(url: URL?) {
        self.url = url
        loadImage()
    }
    
    func loadImage() {
        
        guard let url = url else {
            return
        }
        
        if let cachedImage = ImageCacheHelper.shared.get(forKey: url.absoluteString) {
            image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }

                if let image = UIImage(data: data) {
                    ImageCacheHelper.shared.set(image, forKey: url.absoluteString)
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }.resume()
        }
    }
}

class ImageCacheHelper {
    static let shared = ImageCacheHelper()
    
    private var cache: [String: UIImage] = [:]
    
    private let imageCacheQueue = DispatchQueue(label: "RickAndMorty.queue.imageQueue")

    private init() {}
    
    func set(_ image: UIImage, forKey key: String) {
        imageCacheQueue.sync {
            self.cache[key] = image
        }
    }
    
    func get(forKey key: String) -> UIImage? {
        imageCacheQueue.sync {
            cache[key]
        }
    }
}
