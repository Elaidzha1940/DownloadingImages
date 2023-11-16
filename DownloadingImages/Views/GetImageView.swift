//  /*
//
//  Project: DownloadingImages
//  File: GetImageView.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import SwiftUI

struct GetImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url))
    }
    
    var body: some View {
        
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
               Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    GetImageView(url: "https://via.placeholder.com/600/92c952" )
        .frame(width: 75, height:  75)
}
