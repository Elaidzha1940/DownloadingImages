//  /*
//
//  Project: DownloadingImages
//  File: GetImagesViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import Foundation

class GetImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    let newInstance = PhtotModelDataService()
    
    let dataService = PhtotModelDataService.instance
}
