//
//  URLImage.swift
//  MovieApp
//
//  Created by Daniel Perez Olivares on 31-10-23.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let placeholder: String
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData,
           let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage).resizable()
        } else {
            return Image("placeholder").resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
    }
}
