//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by manish yadav on 3/2/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var nameRegionLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: Country?) {
        if let name = data?.name,
           let region = data?.region {
            self.nameRegionLabel.text = "\(name), \(region)"
        }
        self.codeLabel.text = data?.code
        if data?.name?.contains("land Islan") == true {
            self.capitalLabel.text = nil
        } else {
            self.capitalLabel.text = data?.capital

        }
    }

}
