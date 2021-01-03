//
//  ApiClient.swift
//  Stock Protfolio Final Project
//
//  Created by Dan Gavrielov on 03/01/2021.
//  Copyright © 2021 Dan Gavrielov. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(value: T, description: String? = nil)
    case failure(description: String? = nil)
}

protocol ApiClient: class {
    var session: URLSession { get }
    func fetch<T: Codable>(with url: URL, completion: @escaping (Result<T>) -> ())
}

extension ApiClient {
    var session: URLSession {
        return URLSession(configuration: .default)
    }
    
    func fetch<T: Codable>(with url: URL, completion: @escaping (Result<T>) -> ()) {
        if InternetConnectionManager.isConnectedToNetwork() {
            session.dataTask(with: url) { data, response, error in
                    guard let response = response as? HTTPURLResponse,
                          (200...299).contains(response.statusCode),
                          let data = data
                    else {
                        print("Error fetching data: \(error?.localizedDescription ?? "")")
                        completion(.failure(description: "Error fetching data"))
                        return
                    }
                    do {
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(value: decodedObject))
                    } catch {
                        print("Error decoding data: \(error.localizedDescription)")
                        completion(.failure(description: "Error decoding data"))
                    }
            }.resume()
        } else {
            completion(.failure(description: "Internet connection failed"))
        }
    }
}

