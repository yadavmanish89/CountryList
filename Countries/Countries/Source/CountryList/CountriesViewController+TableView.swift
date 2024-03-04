//
//  CountriesViewController+TableView.swift
//  Countries
//
//  Created by manish yadav on 3/2/24.
//

import UIKit

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CountryTableViewCell.self), for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        let dataModel = self.viewModel.itemAtIndexPath(index: indexPath.row)
        cell.setData(data: dataModel)
        return cell
    }
}
