//
//  UINavigationItems+.swift
//  There-iOS
//
//  Created by 이민아 on 2022/07/28.
//
import UIKit
import SnapKit

extension UINavigationItem{
    func makeSFSymbolButton(_ target: Any?, action: Selector, symbolName: String) -> UIBarButtonItem {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: symbolName), for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.tintColor = .black
        
    let barButtonItem = UIBarButtonItem(customView: button)
    barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
    barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
    barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
    return barButtonItem
    }
}

