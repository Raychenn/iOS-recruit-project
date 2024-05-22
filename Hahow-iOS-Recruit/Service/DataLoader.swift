//
//  DataLoader.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import Foundation

enum APIError: Error, Equatable {
    static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.decodeError(let descriptionLeft), .decodeError(let descriptionRight)):
            return descriptionLeft == descriptionRight
        case (.unknownError(let descriptionLeft), .unknownError(let descriptionRight)):
            return descriptionLeft == descriptionRight
        default:
            return false
        }
    }
    
    case decodeError(description: String)
    case unknownError(description: String)
}

protocol DataLoaderProtocol {
    func load<T>(
        fileName: String,
        as type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T : Decodable
}
/*
 The network manager (aka: network layer), typically interacts with the interactor to provide data obtained from the network or local database.
 It abstracts away the details of network communication, making it easier to maintain and test the networking code separately from the rest of the application.
*/
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
