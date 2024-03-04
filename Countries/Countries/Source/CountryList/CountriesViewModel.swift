//
//  CountriesViewModel.swift
//  Countries
//
//  Created by manish yadav on 3/2/24.
//

import Foundation

class CountriesViewModel {
    private var dataSource: [Country]?
    /// To update UI on successful response
    var updateUI: (() -> ())?
    var showError: ((NetworkError?) -> ())?
    
    func getCountryList() {
        
        Task {
            do {
                let urlString = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"

                let result = try await CountriesDataManager().getCountries(url: URL(string: urlString))
                switch result {
                case .success(let dataModel):
                    self.dataSource = dataModel
                    self.updateUI?()
                case .failure(let error):
                    debugPrint("Error:\(error)")
                    self.showError?(error)
                }
            } catch(let error) {
                debugPrint("Error:\(error)")
                if let networkError = error as? NetworkError {
                    self.showError?(networkError)
                }
            }
        }
    }
   
    func numberOfRows() -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func itemAtIndexPath(index: Int) -> Country? {
        return self.dataSource?[index] ?? nil
    }
}
