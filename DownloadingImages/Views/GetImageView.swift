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
    //@State var isLoading: Bool = true
    @StateObject var loader = ImageLoadingViewModel()
    
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
    GetImageView()
        .frame(width: 75, height:  75)
}
