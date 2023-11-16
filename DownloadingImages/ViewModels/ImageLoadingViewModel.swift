//  /*
//
//  Project: DownloadingImages
//  File: ImageLoadingViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 16.11.2023
//
//  */

import Foundation
import SwiftUI

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    init() {
        downloadImage()
    }
    
    func downloadImage() {
        
        isLoading = true
        guard let url = URL(string: "") else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }

    }
}
