//  /*
//
//  Project: DownloadingImages
//  File: GetImageView.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.11.2023
//
//  */

import SwiftUI

struct GetImageView: View {
    @State var isLoading: Bool = true
    
    var body: some View {
        
        ZStack {
            if isLoading {
                ProgressView()
            } else {
               Circle()
            }
        }
    }
}

#Preview {
    GetImageView()
        .frame(width: 75, height:  75)
}
