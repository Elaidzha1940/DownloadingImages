//  /*
//
//  Project: DownloadingImages
//  File: GetImagesViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import Foundation
import Combine

class GetImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    let dataService = PhtotModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] (returnedPhotoModels) in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
}
