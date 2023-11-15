//  /*
//
//  Project: DownloadingImages
//  File: GetImages.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import SwiftUI

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
                    Text(model.title)
                }
            }
            .navigationTitle("Get Images")
        }
    }
}

#Preview {
    GetImages()
}
