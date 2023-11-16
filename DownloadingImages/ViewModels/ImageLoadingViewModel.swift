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
    
    func downloadImage() {
        
        guard let url = URL(string: "") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
    }
}
