//
//  ViewController.swift
//  Countries
//
//  Created by manish yadav on 3/2/24.
//

import UIKit

class CountriesViewController: UIViewController {
    @IBOutlet weak var countriesTableView: UITableView!

    let viewModel = CountriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Countries"
        // Do any additional setup after loading the view.
        loadData()
    }
    
    private func loadData() {
        viewModel.getCountryList()
        viewModel.updateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.countriesTableView.reloadData()
            }
        }
        viewModel.showError = { [weak self] error in
            let alert = UIAlertController(title: "Error", message: error?.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            DispatchQueue.main.async {
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }

}

