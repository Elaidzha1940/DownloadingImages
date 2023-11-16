//  /*
//
//  Project: DownloadingImages
//  File: PhotoModelFileManager.swift
//  Created by: Elaidzha Shchukin
//  Date: 16.11.2023
//
//  */

import Foundation
import SwiftUI

class PhotoModelFileManager {
  
    static let instance = PhotoModelFileManager()
    let folderName = "downloaded_images"
    private init() {
        createFolderIfNeeded()
    }

    
    private func createFolderIfNeeded() {
        
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory , in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
}
