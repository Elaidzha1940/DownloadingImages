//
//  URLSession.swift
//  DownloadingImages
//
//  Created by Elaidzha Shchukin on 14.11.2023.
//

import Foundation

// Создаем URL
if let url = URL(string: "https://api.example.com/data") {
    
    // Создаем URLSession
    let session = URLSession.shared
    
    // Создаем задачу для отправки GET-запроса
    let task = session.dataTask(with: url) { (data, response, error) in
        
        // Проверяем наличие ошибок
        if let error = error {
            print("Ошибка: \(error.localizedDescription)")
            return
        }
        
        // Проверяем наличие данных
        if let data = data {
            // Обработка данных, например, преобразование из JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("JSON: \(json)")
            } catch {
                print("Ошибка при разборе JSON: \(error.localizedDescription)")
            }
        }
    }
    
    // Запускаем задачу
    task.resume()
}


// Alamofire предоставляет более высокоуровневый интерфейс и упрощает обработку запросов и ответов, делая код более читаемым и облегчая обработку ошибок.

import Alamofire

AF.request("https://api.example.com/data").responseJSON { response in
    switch response.result {
    case .success(let value):
        print("JSON: \(value)")
    case .failure(let error):
        print("Ошибка: \(error.localizedDescription)")
    }
}


import Moya

enum MyAPIService {
    case getUser(id: Int)
}

let provider = MoyaProvider<MyAPIService>()
provider.request(.getUser(id: 123)) { result in
    switch result {
    case let .success(response):
        print("Success: \(response)")
    case let .failure(error):
        print("Error: \(error)")
    }
}

import Kingfisher

let url = URL(string: "https://example.com/image.jpg")
imageView.kf.setImage(with: url)
