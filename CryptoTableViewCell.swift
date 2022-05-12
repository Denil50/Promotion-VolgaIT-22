//
//  MyTableViewCell.swift
//  Promotion VolgaIT’22
//
//  Created by Apple on 25.04.2022.
//

import UIKit

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let logo_url: String
}
class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        priceLabel.text = nil
        symbolLabel.text = nil
    }
    
    static let indetifier = "CryptoTableViewCell"
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        let url = URL(string:
        "https://cryptoicon-api.vercel.app/api/icon/\(viewModel.symbol.lowercased())")
        DispatchQueue.main.async {
                if let data = try? Data(contentsOf: url!)
                {
                    self.logoImage.image = UIImage(data: data)
                }
            }
            
    }
}
