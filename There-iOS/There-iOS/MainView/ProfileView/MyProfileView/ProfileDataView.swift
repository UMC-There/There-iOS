//
//  ProfileDataView.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/28.
//

import SnapKit
import UIKit

final class ProfileDataView: UIView {
    private let title: String
    private let count: Int
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = title
        
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.text = "\(count)"
        
        return label
    }()
    
    init(title: String, count: Int){
        self.title = title
        self.count = count
        
        super.init(frame: .zero)
        
        setupLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProfileDataView{
    func setupLayOut(){
        let stackView = UIStackView(arrangedSubviews: [titleLabel, countLabel])
        stackView.axis = .horizontal //방향
        //stackView.alignment = .center
        stackView.spacing = 3.0
        
        addSubview(stackView)
        stackView.snp.makeConstraints{ $0.edges.equalToSuperview()}
    }
}


