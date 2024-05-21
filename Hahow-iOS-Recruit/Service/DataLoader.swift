//
//  DataLoader.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import Foundation

enum APIError: Error {
    case decodeError(description: String)
    case unknownError(error: Error)
}

protocol DataLoaderProtocol {
    func load<T>(
        fileName: String,
        as type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T : Decodable
}

class DataLoader: DataLoaderProtocol {
    static let shared = DataLoader()
    
    private init() {}
    
    func load<T: Decodable>(fileName: String, as type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(type.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(APIError.decodeError(description: "decode failed")))
            }
        } else {
            let error = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])
            completion(.failure(error))
        }
    }
}
