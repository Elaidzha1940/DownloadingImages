//  /*
//
//  Projetc: DownloadingImages
//  File: GetImagesRow.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import SwiftUI

struct GetImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.green)
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(.mint)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    GetImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "title", url: "url", thumbnailUrl: "thumbnailUrl"))
        .previewLayout(.sizeThatFits)
}
