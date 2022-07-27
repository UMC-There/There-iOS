//
//  PortfolioCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/20.
//

import UIKit

class PortfolioCollectionViewCell: UICollectionViewCell {
    static let identifier = "PortfolioCollectionViewCell"
    
    @IBOutlet weak var portImageView: UIImageView!
    @IBOutlet weak var portTitleLabel: UILabel!
    @IBOutlet weak var portCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
