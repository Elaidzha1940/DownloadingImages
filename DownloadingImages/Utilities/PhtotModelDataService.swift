//  /*
//
//  Project: DownloadingImages
//  File: PhtotModelDataService.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import Foundation

class PhtotModelDataService {
    
    static let instance = PhtotModelDataService() // Singleton
    private init() {
        
    }
    
    func downloadData() {
        
        guard let url = 
                URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(<#T##transform: (Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> T##(Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> T#>)
        
        }
    }
}
