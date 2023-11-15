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
    
    @Published var photoModels: [PhotoModel] = []
     
    private init() {
        
    }
    
    func downloadData() {
        
        guard let url =
                URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { (complition) in
                switch complition {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloding data. \(error)")
                }
            } receiveValue: { [weak self] (returnedPhotoModels) in
                self?.photoModels = returnedPhotoModels
            }

        
    }
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
