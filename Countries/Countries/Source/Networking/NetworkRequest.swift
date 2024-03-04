//
//  NetworkRequest.swift
//  Countries
//
//  Created by manish yadav on 3/2/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .parsingError:
            return "Parsing Error"
        case .invalidResponse:
            return "Bad Response from server"
        case .emptyValues:
            return "No value Found"
        }
    }
    case invalidURL, parsingError, invalidResponse, emptyValues
}

class NetworkRequest {
    func request(url: URL) async throws -> Data?{
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            return data
        }
        catch(_) {
                return nil
        }
    }
}


