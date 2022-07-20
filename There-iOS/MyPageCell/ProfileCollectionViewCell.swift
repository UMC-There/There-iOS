//
//  ProfileCollectionViewCell.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/20.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    
    
    @IBOutlet weak var artistNoteButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpAttribute()
        
    }
    
    func setUpAttribute(){
        profileImageView.layer.cornerRadius = 88 / 2
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        editProfileButton.layer.cornerRadius = 5
        editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        editProfileButton.layer.borderWidth = 1
        
        artistNoteButton.layer.cornerRadius = 5
        artistNoteButton.layer.borderColor = UIColor.lightGray.cgColor
        artistNoteButton.layer.borderWidth = 1
        
        [followerCountLabel,followingCountLabel]
            .forEach { $0.text = "\(Int.random(in: 0...10))"} //임시 [서버연결]
    }

}
