//  /*
//
//  Project: DownloadingImages
//  File: GetImages.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import SwiftUI

// MVVM
// Codable
// Background Threads
// weak self
// Combine
// Publisher and Subscribers
// FileManager
// NSCashe

struct GetImages: View {
    @StateObject var vm = GetImagesViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    HStack {
                        Circle()
                            .foregroundColor(.brown)
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
            .navigationTitle("Get Images")
        }
    }
}

#Preview {
    GetImages()
}
