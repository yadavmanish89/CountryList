//
//  CountriesDataManager.swift
//  Countries
//
//  Created by manish yadav on 3/2/24.
//

import Foundation

protocol CountriesDataManagerProtocol {
    func getCountries(url: URL?) async throws -> Result<[Country], NetworkError>
}
class CountriesDataManager: CountriesDataManagerProtocol {

    func getCountries(url: URL?) async throws -> Result<[Country], NetworkError> {

        guard let url ,
              let data = try await NetworkRequest().request(url: url) else {
            return .failure(.invalidResponse)
        }
        do {
            return try .success(JSONDecoder().decode([Country].self, from: data))
        } catch(let err) {
            guard let parsingError = err as? NetworkError else {
                return .failure(.parsingError)
            }
            return .failure(parsingError)
        }
    }
}
